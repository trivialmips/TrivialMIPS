`include "cpu_defs.svh"

module cpu_ex(
	input  clk, rst,
	input  Oper_t         op,
	input  InstAddr_t     pc,
	input  Inst_t         inst,
	input  Word_t         reg1,
	input  Word_t         reg2,
	input  Word_t         imm,
	input  Word_t         cp0_rdata_unsafe,
	input  DoubleWord_t   hilo_unsafe,
	input  RegWriteReq_t  mem_cp0_reg_wr,
	input  HiloWriteReq_t mem_hilo_wr,
	output HiloWriteReq_t hilo_wr,
	output RegWriteReq_t  cp0_reg_wr,
	output RegAddr_t      cp0_raddr,
	output MemAccessReq_t memory_req,
	output Word_t         ret,
	output Bit_t          stall_req,
	output ExceptInfo_t   except
);

// safe HILO
DoubleWord_t hilo_safe;
Word_t hi, lo;
assign { hi, lo } = hilo_safe;
always_comb
begin
	if(rst)
	begin
		hilo_safe = `ZERO_DWORD;
	end else if(mem_hilo_wr.we) begin
		hilo_safe = mem_hilo_wr.hilo;
	end else begin
		hilo_safe = hilo_unsafe;
	end
end

// unsigned register arithmetic
DoubleWord_t mul_u;
assign mul_u = reg1 * reg2;

// CP0 operation
Word_t cp0_rdata_safe;
always_comb
begin
	if(rst)
	begin
		cp0_rdata_safe = `ZERO_DWORD;
	end else if(mem_cp0_reg_wr.we && mem_cp0_reg_wr.waddr == cp0_raddr) begin
		cp0_rdata_safe = mem_cp0_reg_wr.wdata;
	end else begin
		cp0_rdata_safe = cp0_rdata_unsafe;
	end
end
assign cp0_raddr = inst[15:11];
assign cp0_reg_wr.we = (op == OP_MTC0);
assign cp0_reg_wr.wdata = reg2;
assign cp0_reg_wr.waddr = inst[15:11];

// memory operation
Bit_t is_load_memory_inst;
Bit_t is_save_memory_inst;
assign is_load_memory_inst = (op == OP_LW);
assign is_save_memory_inst = (op == OP_SW);
assign memory_req.ce = is_load_memory_inst | is_save_memory_inst;
assign memory_req.we = is_save_memory_inst;
assign memory_req.addr = reg1 + imm;
assign memory_req.wdata = reg2;
always_comb
begin
	if(op == OP_LW || op == OP_SW)
	begin
		memory_req.sel = 4'b1111;
	end else begin
		memory_req.sel = 4'b0000;
	end
end

// trap instructions
always_comb
begin
	if(rst == 1'b1)
	begin
		except.occur = 1'b0;
		except.code  = 5'b0;
		except.eret  = 1'b0;
	end else begin
		except.occur = 1'b0;
		except.code  = `EXCCODE_TR;
		except.eret  = 1'b0;
		case(op)
		OP_TEQI: except.occur = (reg1 == imm);
		OP_ERET: begin
			except.occur = 1'b1;
			except.eret  = 1'b1;
		end
		endcase
	end
end

// whether to write hilo
Bit_t we_hilo;
assign we_hilo = (
	op == OP_MTHI ||
	op == OP_MTLO ||
	op == OP_MADDU
);

DoubleWord_t multi_cyc_ret;
ex_multi_cyc multi_cyc_instance(
	.clk,
	.rst,
	.op,
	.reg1,
	.reg2,
	.mul_u,
	.hilo(hilo_safe),
	.ret(multi_cyc_ret),
	.is_busy(stall_req)
);


always_comb
begin
	if(rst == 1'b1)
	begin
		ret = `ZERO_WORD;
		hilo_wr.we = 1'b0;
		hilo_wr.hilo = `ZERO_DWORD;
	end else begin
		hilo_wr.we = we_hilo;
		hilo_wr.hilo = hilo_safe;

		case(op)
		/* logical instructions */
		OP_ORI:  ret = reg1 | imm;
		OP_ANDI: ret = reg1 & imm;
		OP_XORI: ret = reg1 ^ imm;
		OP_LUI:  ret = { imm[15:0], 16'b0 };
		OP_AND:  ret = reg1 & reg2;
		OP_OR:   ret = reg1 | reg2;
		OP_XOR:  ret = reg1 ^ reg2;
		OP_NOR:  ret = ~(reg1 | reg2);

		OP_JAL: ret = pc + 32'd8;
		OP_MFHI: ret = hi;
		OP_MFLO: ret = lo;
		OP_MTHI: hilo_wr.hilo = { reg1, lo };
		OP_MTLO: hilo_wr.hilo = { hi, reg1 };
		OP_MADDU: hilo_wr.hilo = multi_cyc_ret;
		OP_MFC0: ret = cp0_rdata_safe;
		default: begin
            ret = `ZERO_WORD;
        end
		endcase
	end
end

endmodule
