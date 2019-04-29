`include "cpu_defs.svh"

module cpu_ex(
	input  clk, clk_2x, rst,
	input  Bit_t          flush,
	input  Word_t         cp0_rdata_unsafe,
	input  DoubleWord_t   hilo_unsafe,
	input  FPUReg_t       fpu_reg1_unsafe,
	input  FPUReg_t       fpu_reg2_unsafe,
	input  Word_t         fpu_fccr,
	output RegAddr_t      cp0_raddr,
	output wire [2:0]     cp0_rsel,
	output Bit_t          stall_req,
	input  Bit_t          stall_from_mem,

	input  PipelineData_t  data_idex,
	input  PipelineReq_t   req_idex,
	output PipelineData_t  data_ex,
	output PipelineReq_t   req_ex,

	// data forward
	input  CP0RegWriteReq_t mem_cp0_reg_wr,
	input  CP0RegWriteReq_t wb_cp0_reg_wr,
	input  HiloWriteReq_t   mem_hilo_wr_a,
	input  HiloWriteReq_t   mem_hilo_wr_b,
	input  FPURegWriteReq_t mem_fpu_wr_a,
	input  FPURegWriteReq_t mem_fpu_wr_b,

	// data downward
	input  HiloWriteReq_t ex_hilo_wr_a,
	input  RegWriteReq_t  ex_reg_wr_a,
	input  Bit_t          ex_fcsr_we,
	input  FCSRReg_t      ex_fcsr_wdata
);

// setup data and request
Oper_t         op;
InstAddr_t     pc;
Inst_t         inst;
Word_t         reg1, reg2, imm;
FPUReg_t       fpu_reg1, fpu_reg2;
HiloWriteReq_t hilo_wr;
CP0RegWriteReq_t cp0_reg_wr;
MemAccessReq_t memory_req;
Word_t         ret;
ExceptInfo_t   except;
always_comb
begin
	if(ex_reg_wr_a.we && ex_reg_wr_a.waddr == data_idex.reg_addr1)
	begin
		reg1 = ex_reg_wr_a.wdata;
	end else begin
		reg1 = data_idex.reg1;
	end

	if(ex_reg_wr_a.we && ex_reg_wr_a.waddr == data_idex.reg_addr2)
	begin
		reg2 = ex_reg_wr_a.wdata;
	end else begin
		reg2 = data_idex.reg2;
	end
end

assign op = data_idex.op;
assign pc = data_idex.pc;
assign inst = data_idex.inst;
assign imm = data_idex.imm;
assign req_ex.hilo_wr = hilo_wr;
assign req_ex.cp0_reg_wr = cp0_reg_wr;
assign req_ex.memory_req = memory_req;
assign req_ex.reg_wr.we = req_idex.reg_wr.we;
assign req_ex.reg_wr.waddr = req_idex.reg_wr.waddr;
assign req_ex.reg_wr.wdata = ret;
assign req_ex.freg_wr.we = req_idex.freg_wr.we;
assign req_ex.freg_wr.waddr = req_idex.freg_wr.waddr;
assign req_ex.except = except;
assign req_ex.llbit_set = (op == OP_LL);
assign req_ex.tlbp      = (op == OP_TLBP);
assign req_ex.tlb_wi    = (op == OP_TLBWI);
assign req_ex.tlb_wr    = (op == OP_TLBWR);
assign req_ex.tlb_read  = (op == OP_TLBR);
assign data_ex.op = data_idex.op;
assign data_ex.fpu_op = data_idex.fpu_op;
assign data_ex.pc = data_idex.pc;
assign data_ex.inst = data_idex.inst;
assign data_ex.reg1 = reg1;
assign data_ex.reg2 = reg2;
assign data_ex.imm = data_idex.imm;
assign data_ex.reg_addr1 = data_idex.reg_addr1;
assign data_ex.reg_addr2 = data_idex.reg_addr2;
assign data_ex.delayslot = data_idex.delayslot;

// safe HILO
DoubleWord_t hilo_safe;
Word_t hi, lo;
assign { hi, lo } = hilo_safe;
always_comb
begin
	if(rst)
	begin
		hilo_safe = `ZERO_DWORD;
	end else if(ex_hilo_wr_a.we) begin
		hilo_safe = ex_hilo_wr_a.hilo;
	end else if(mem_hilo_wr_b.we) begin
		hilo_safe = mem_hilo_wr_b.hilo;
	end else if(mem_hilo_wr_a.we) begin
		hilo_safe = mem_hilo_wr_a.hilo;
	end else begin
		hilo_safe = hilo_unsafe;
	end
end

// safe FPU registers
always_comb
begin
	if(mem_fpu_wr_b.we && data_idex.fpu_raddr1 == mem_fpu_wr_b.waddr)
	begin
		fpu_reg1 = mem_fpu_wr_b.wdata;
	end else if(mem_fpu_wr_a.we && data_idex.fpu_raddr1 == mem_fpu_wr_a.waddr) begin
		fpu_reg1 = mem_fpu_wr_a.wdata;
	end else begin
		fpu_reg1 = fpu_reg1_unsafe;
	end

	if(mem_fpu_wr_b.we && data_idex.fpu_raddr2 == mem_fpu_wr_b.waddr)
	begin
		fpu_reg2 = mem_fpu_wr_b.wdata;
	end else if(mem_fpu_wr_a.we && data_idex.fpu_raddr2 == mem_fpu_wr_a.waddr) begin
		fpu_reg2 = mem_fpu_wr_a.wdata;
	end else begin
		fpu_reg2 = fpu_reg2_unsafe;
	end
end

// unsigned register arithmetic
Word_t add_u, sub_u;
assign add_u = reg1 + reg2;  // for ADDI, ADDIU, reg2 = imm
assign sub_u = reg1 - reg2;

// comparsion
Bit_t signed_lt, unsigned_lt;
assign signed_lt = (reg1[31] != reg2[31]) ? reg1[31] : sub_u[31];
assign unsigned_lt = (reg1 < reg2);

// count leading bits
Word_t clz_cnt, clo_cnt;
ex_count_bit count_clz(
	.bit_val(1'b0),
	.val(reg1),
	.count(clz_cnt)
);

ex_count_bit count_clo(
	.bit_val(1'b1),
	.val(reg1),
	.count(clo_cnt)
);

// overflow checking
Bit_t ov_add, ov_sub;
assign ov_add = (reg1[31] == reg2[31]) & (reg1[31] ^ add_u[31]);
assign ov_sub = (reg1[31] ^ reg2[31]) & (reg1[31] ^ sub_u[31]);

// CP0 operation
Word_t cp0_rdata_safe, cp0_wmask;
cp0_write_mask cp0_write_mask_instance_ex(
	.rst,
	.sel(cp0_rsel),
	.addr(cp0_raddr),
	.mask(cp0_wmask)
);

always_comb
begin
	if(rst)
	begin
		cp0_rdata_safe = `ZERO_DWORD;
	end else if(wb_cp0_reg_wr.we && wb_cp0_reg_wr.waddr == cp0_raddr && wb_cp0_reg_wr.sel == cp0_rsel) begin
		cp0_rdata_safe = (cp0_wmask & wb_cp0_reg_wr.wdata) | (~cp0_wmask & cp0_rdata_unsafe);
	end else if(mem_cp0_reg_wr.we && mem_cp0_reg_wr.waddr == cp0_raddr && mem_cp0_reg_wr.sel == cp0_rsel) begin
		cp0_rdata_safe = (cp0_wmask & mem_cp0_reg_wr.wdata) | (~cp0_wmask & cp0_rdata_unsafe);
	end else begin
		cp0_rdata_safe = cp0_rdata_unsafe;
	end
end
assign cp0_raddr = inst[15:11];
assign cp0_rsel  = inst[2:0];
assign cp0_reg_wr.we = (op == OP_MTC0);
assign cp0_reg_wr.wdata = reg2;
assign cp0_reg_wr.waddr = inst[15:11];
assign cp0_reg_wr.sel   = inst[2:0];

// memory operation
Bit_t is_load_memory_inst;
Bit_t is_save_memory_inst;
MemAddr_t mem_addr;
assign mem_addr = reg1 + imm;
assign is_load_memory_inst = (
	op == OP_LB  || op == OP_LBU || op == OP_LH  || op == OP_LL ||
	op == OP_LHU || op == OP_LW  || op == OP_LWL || op == OP_LWR ||
	op == OP_LWC1);
assign is_save_memory_inst = (
	op == OP_SB  || op == OP_SH  || op == OP_SW ||
	op == OP_SWL || op == OP_SWR || op == OP_SC ||
	op == OP_SWC1);
assign memory_req.ce = is_load_memory_inst | is_save_memory_inst;
assign memory_req.we = is_save_memory_inst;
assign memory_req.addr = mem_addr;
always_comb
begin
	unique case(op)
	OP_LWC1, OP_SWC1:
	begin
		memory_req.sel = 4'b1111;
		memory_req.wdata = fpu_reg1;
	end
	OP_LW, OP_LL, OP_SW, OP_SC:
	begin
		memory_req.sel = 4'b1111;
		memory_req.wdata = reg2;
	end
	OP_LB, OP_LBU, OP_SB:
	begin
		memory_req.sel = 4'b0001 << mem_addr[1:0];
		memory_req.wdata = reg2 << (mem_addr[1:0] * 8);
	end
	OP_LH, OP_LHU, OP_SH:
	begin
		memory_req.sel = mem_addr[1] ? 4'b1100 : 4'b0011;
		memory_req.wdata = mem_addr[1] ? (reg2 << 16) : reg2;
	end
	OP_LWL:
	begin
		unique case(mem_addr[1:0])
			2'd0: memory_req.sel = 4'b1000;
			2'd1: memory_req.sel = 4'b1100;
			2'd2: memory_req.sel = 4'b1110;
			2'd3: memory_req.sel = 4'b1111;
		endcase
		memory_req.wdata = reg2;
	end
	OP_LWR:
	begin
		unique case(mem_addr[1:0])
			2'd0: memory_req.sel = 4'b1111;
			2'd1: memory_req.sel = 4'b0111;
			2'd2: memory_req.sel = 4'b0011;
			2'd3: memory_req.sel = 4'b0001;
		endcase
		memory_req.wdata = reg2;
	end
	OP_SWL:
	begin
		unique case(mem_addr[1:0])
			2'd0: memory_req.sel = 4'b0001;
			2'd1: memory_req.sel = 4'b0011;
			2'd2: memory_req.sel = 4'b0111;
			2'd3: memory_req.sel = 4'b1111;
		endcase
		memory_req.wdata = reg2 >> ((3 - mem_addr[1:0]) * 8);
	end
	OP_SWR:
	begin
		unique case(mem_addr[1:0])
			2'd0: memory_req.sel = 4'b1111;
			2'd1: memory_req.sel = 4'b1110;
			2'd2: memory_req.sel = 4'b1100;
			2'd3: memory_req.sel = 4'b1000;
		endcase
		memory_req.wdata = reg2 << (mem_addr[1:0] * 8);
	end
	default:
	begin
		memory_req.wdata = `ZERO_WORD;
		memory_req.sel = 4'b0000;
	end
	endcase
end

// exception
always_comb
begin
	except = req_idex.except;
	if(rst == 1'b1)
	begin
		except = {$bits(ExceptInfo_t){1'b0}};
	end else begin
		except.eret     = (op == OP_ERET);
		except.break_   = (op == OP_BREAK);
		except.syscall  = (op == OP_SYSCALL);
		except.overflow = ((op == OP_ADD) & ov_add) | ((op == OP_SUB) & ov_sub);
		except.invalid_inst = (op == OP_INVALID);
		except.priv_inst = (
			op == OP_CACHE || op == OP_ERET || op == OP_MFC0 ||
			op == OP_MTC0 || op == OP_TLBP || op == OP_TLBR ||
			op == OP_TLBWI || op == OP_TLBWR || op == OP_WAIT
		);

		unique case(op)
			OP_TEQ:  except.trap = (reg1 == reg2);
			OP_TNE:  except.trap = (reg1 != reg2);
			OP_TGE:  except.trap = ~signed_lt;
			OP_TLT:  except.trap = signed_lt;
			OP_TGEU: except.trap = ~unsigned_lt;
			OP_TLTU: except.trap = unsigned_lt;
			default: except.trap = 1'b0;
		endcase

		unique case(op)
			OP_LW, OP_LL, OP_SW, OP_SC, OP_LWC1, OP_SWC1:
				except.daddr_unaligned = mem_addr[0] | mem_addr[1];
			OP_LH, OP_LHU, OP_SH:
				except.daddr_unaligned = mem_addr[0];
			default: except.daddr_unaligned = 1'b0;
		endcase
	end
end

// whether to write hilo
Bit_t we_hilo;
assign we_hilo = (
	op == OP_MTHI  || op == OP_MTLO  ||
	op == OP_MADDU || op == OP_MSUBU ||
	op == OP_MADD  || op == OP_MSUB  ||
	op == OP_MULT  || op == OP_MULTU ||
	op == OP_DIV   || op == OP_DIVU
);

Bit_t multi_cyc_busy;
Word_t mult_word;
DoubleWord_t multi_cyc_ret;
ex_multi_cyc multi_cyc_instance(
	.clk,
	.clk_2x,
	.rst,
	.flush,
	.op,
	.reg1,
	.reg2,
	.hilo(hilo_safe),
	.ret(multi_cyc_ret),
	.mult_word,
	.is_busy(multi_cyc_busy)
);

Bit_t fpu_busy;
Word_t fpu_gpr_ret;

fpu_ex fpu_ex_instance(
	.clk,
	.rst,
	.flush,
	.inst,
	.op(data_idex.fpu_op),
	.fcsr(ex_fcsr_we ? ex_fcsr_wdata : req_idex.fcsr),
	.fccr(fpu_fccr),
	.gpr1(reg1),
	.gpr2(reg2),
	.reg1(fpu_reg1),
	.reg2(fpu_reg2),
	.fpu_ret(req_ex.freg_wr.wdata),
	.cpu_ret(fpu_gpr_ret),
	.except(req_ex.fpu_except),
	.fcsr_we(req_ex.fcsr_we),
	.fcsr_wdata(req_ex.fcsr),
	.stall_from_mem,
	.is_busy(fpu_busy)
);

Word_t ret_ext, ret_ins;
ex_ext ext_instance(
	.inst,
	.in(reg1),
	.out(ret_ext)
);

ex_ins ins_instance(
	.inst,
	.in1(reg1),
	.in2(reg2),
	.out(ret_ins)
);

assign stall_req = fpu_busy | multi_cyc_busy;

always_comb
begin
	if(rst == 1'b1)
	begin
		ret = `ZERO_WORD;
		hilo_wr.we = 1'b0;
		hilo_wr.hilo = `ZERO_DWORD;
	end else begin
		ret = `ZERO_WORD;
		hilo_wr.we = we_hilo;
		hilo_wr.hilo = hilo_safe;

		unique case(op)
		/* special3 */
		OP_EXT:  ret = ret_ext;
		OP_INS:  ret = ret_ins;
		OP_SEB:  ret = { {24{reg2[7]}}, reg2[7:0] };
		OP_SEH:  ret = { {16{reg2[15]}}, reg2[15:0] };
		OP_WSBH: ret = { reg2[23:16], reg2[31:24], reg2[7:0], reg2[15:8] };

		/* logical instructions */
		OP_LUI:  ret = { imm[15:0], 16'b0 };
		OP_AND:  ret = reg1 & reg2;
		OP_OR:   ret = reg1 | reg2;
		OP_XOR:  ret = reg1 ^ reg2;
		OP_NOR:  ret = ~(reg1 | reg2);

		/* add and subtract */
		OP_ADD, OP_ADDU: ret = add_u;
		OP_SUB, OP_SUBU: ret = sub_u;

		/* bits counting */
		OP_CLZ: ret = clz_cnt;
		OP_CLO: ret = clo_cnt;

		/* move instructions */
		OP_MFHI: ret = hi;
		OP_MFLO: ret = lo;
		OP_MTHI: hilo_wr.hilo = { reg1, lo };
		OP_MTLO: hilo_wr.hilo = { hi, reg1 };
		OP_MOVZ, OP_MOVN, OP_MOVCI:
			ret = reg1;   // 'we' was set in ID stage.

		/* jump instructions */
		OP_JAL, OP_BLTZAL, OP_BGEZAL, OP_JALR:
			ret = pc + 32'd8;

		/* shift instructions */
		OP_SLL:  ret = reg2 << inst[10:6];
		OP_SLLV: ret = reg2 << reg1[4:0];
		OP_SRL:  ret = reg2 >> inst[10:6];
		OP_SRLV: ret = reg2 >> reg1[4:0];
		OP_ROR:  ret = (reg2 >> inst[10:6]) | (reg2 << (32 - inst[10:6]));
		OP_RORV:  ret = (reg2 >> reg1[4:0]) | (reg2 << (32 - reg1[4:0]));
		OP_SRA:  ret = $signed(reg2) >>> inst[10:6];
		OP_SRAV: ret = $signed(reg2) >>> reg1[4:0];

		/* compare and set */
		OP_SLTU: ret = unsigned_lt;
		OP_SLT:  ret = signed_lt;

		/* multiplication */
		OP_MUL: ret = mult_word;
		OP_MADDU, OP_MADD, OP_MSUBU, OP_MSUB,
		OP_MULT, OP_MULTU, OP_DIV, OP_DIVU:
		begin
			hilo_wr.hilo = multi_cyc_ret;
			ret = `ZERO_WORD;
		end

		/* read coprocessers */
		OP_MFC0: ret = cp0_rdata_safe;
		OP_MFC1, OP_CFC1: ret = fpu_gpr_ret;
		default: begin
			ret = `ZERO_WORD;
		end
		endcase
	end
end

endmodule
