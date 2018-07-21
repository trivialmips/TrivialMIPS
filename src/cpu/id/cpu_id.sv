`include "cpu_defs.svh"

module cpu_id(
	input  rst,
	input  InstAddr_t pc,
	input  Inst_t     inst,
	input  Bit_t      delayslot,

	input  Word_t     reg1_i,
	input  Word_t     reg2_i,
	input  FCSRReg_t  fpu_fcsr,

	input  ExceptInfo_t ifid_except,

	output RegAddr_t  reg_raddr1,
	output RegAddr_t  reg_raddr2,

	output PipelineData_t data_id,
	output PipelineReq_t  req_id,

	output Bit_t    inst_taken,
	output Bit_t    stall_req,

	input  MemAccessReq_t ex_memory_req_a,
	input  MemAccessReq_t ex_memory_req_b,
	input  RegWriteReq_t  ex_wr_a,
	input  RegWriteReq_t  ex_wr_b,
	input  RegWriteReq_t  mem_wr_a,
	input  RegWriteReq_t  mem_wr_b
);

Oper_t op;
Word_t reg1_o, reg2_o, imm_o;
Bit_t reg_we;
RegAddr_t reg_waddr;
assign data_id.op = op;
assign data_id.pc = pc;
assign data_id.inst = inst;
assign data_id.reg1 = reg1_o;
assign data_id.reg2 = reg2_o;
assign data_id.reg_addr1 = reg_raddr1;
assign data_id.reg_addr2 = reg_raddr2;
assign data_id.imm  = imm_o;
assign data_id.delayslot  = delayslot;
assign req_id.reg_wr.we    = reg_we;
assign req_id.reg_wr.waddr = reg_waddr;
assign req_id.except = ifid_except;
assign req_id.fcsr = fpu_fcsr;

// 6-bit primary operation code
logic [5:0] opcode;
// 5-bit specifier for the source/destination/target register
RegAddr_t rs, rd, rt;
// 16-bit immediate
HalfWord_t immediate;

assign opcode = inst[31:26];
assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];
assign immediate = inst[15:0];

// load related stalling
Bit_t is_ex_load_inst;
assign is_ex_load_inst = (
	ex_memory_req_a.ce && ~ex_memory_req_a.we ||
	ex_memory_req_b.ce && ~ex_memory_req_b.we);
assign stall_req = is_ex_load_inst && 
	(ex_wr_a.waddr == reg_raddr1 && reg_raddr1 != 5'b0 ||
	 ex_wr_a.waddr == reg_raddr2 && reg_raddr2 != 5'b0 ||
	 ex_wr_b.waddr == reg_raddr1 && reg_raddr1 != 5'b0 ||
	 ex_wr_b.waddr == reg_raddr2 && reg_raddr2 != 5'b0);

// the zero-extended/signed-extended immediate
Word_t imm_zero_ext, imm_signed_ext;
assign imm_zero_ext   = { 16'h0, immediate };
assign imm_signed_ext = { {16{immediate[15]}}, immediate };

// deal with the harzard
Word_t safe_reg1, safe_reg2;
always_comb
begin
	if(rst == 1'b1 || reg_raddr1 == 5'b0)
	begin
		safe_reg1 = `ZERO_WORD;
	end else if(ex_wr_b.we && ex_wr_b.waddr == reg_raddr1) begin
		safe_reg1 = ex_wr_b.wdata;
	end else if(ex_wr_a.we && ex_wr_a.waddr == reg_raddr1) begin
		safe_reg1 = ex_wr_a.wdata;
	end else if(mem_wr_b.we && mem_wr_b.waddr == reg_raddr1) begin
		safe_reg1 = mem_wr_b.wdata;
	end else if(mem_wr_a.we && mem_wr_a.waddr == reg_raddr1) begin
		safe_reg1 = mem_wr_a.wdata;
	end else begin
		safe_reg1 = reg1_i;
	end

	if(rst == 1'b1 || reg_raddr2 == 5'b0)
	begin
		safe_reg2 = `ZERO_WORD;
	end else if(ex_wr_b.we && ex_wr_b.waddr == reg_raddr2) begin
		safe_reg2 = ex_wr_b.wdata;
	end else if(ex_wr_a.we && ex_wr_a.waddr == reg_raddr2) begin
		safe_reg2 = ex_wr_a.wdata;
	end else if(mem_wr_b.we && mem_wr_b.waddr == reg_raddr2) begin
		safe_reg2 = mem_wr_b.wdata;
	end else if(mem_wr_a.we && mem_wr_a.waddr == reg_raddr2) begin
		safe_reg2 = mem_wr_a.wdata;
	end else begin
		safe_reg2 = reg2_i;
	end
end

/* immediate (I-Type) instructions */
Oper_t op_type_i;
Bit_t unsigned_imm_type_i;
Bit_t reg_we_i;
RegAddr_t reg_raddr1_i, reg_raddr2_i, reg_waddr_i;
id_type_i id_type_i_instance(
	.opcode,
	.inst,
	.op(op_type_i),
	.reg_raddr1(reg_raddr1_i),
	.reg_raddr2(reg_raddr2_i),
	.reg_waddr(reg_waddr_i),
	.reg_we(reg_we_i),
	.unsigned_imm(unsigned_imm_type_i)
);

/* jump (J-Type) instructions */
Oper_t op_type_j;
id_type_j id_type_j_instance(
	.opcode,
	.op(op_type_j)
);

/* register (R-Type) instructions */
Oper_t op_type_r;
Bit_t reg_we_r;
RegAddr_t reg_raddr1_r, reg_raddr2_r, reg_waddr_r;
id_type_r id_type_r_instance(
	.opcode,
	.inst,
	.reg_raddr1(reg_raddr1_r),
	.reg_raddr2(reg_raddr2_r),
	.reg_waddr(reg_waddr_r),
	.reg_we(reg_we_r),
	.op(op_type_r)
);

Bit_t fcc_match, gpr_zero;
assign fcc_match = fpu_fcsr.fcc[inst[20:18]] == inst[16];
assign gpr_zero  = safe_reg2 == `ZERO_WORD;

/* FPU instructions */
fpu_id fpu_id_instance(
	.inst,
	.op(data_id.fpu_op),
	.fcc_match,
	.gpr_zero,
	.raddr1(data_id.fpu_raddr1),
	.raddr2(data_id.fpu_raddr2),
	.waddr(req_id.freg_wr.waddr),
	.we(req_id.freg_wr.we)
);

Bit_t cond_move_not_taken, movz_not_taken, movn_not_taken, movci_not_taken;
assign movn_not_taken = op_type_r == OP_MOVN && gpr_zero;
assign movz_not_taken = op_type_r == OP_MOVZ && ~gpr_zero;
assign movci_not_taken = op_type_r == OP_MOVCI && ~fcc_match;
assign cond_move_not_taken = movn_not_taken | movz_not_taken | movci_not_taken;

always_comb
begin
	reg1_o = safe_reg1;
	reg2_o = safe_reg2;

	if(op_type_i != OP_INVALID)
	begin
		op = op_type_i;
		reg_raddr1 = reg_raddr1_i;
		reg_raddr2 = reg_raddr2_i;
		reg_we     = reg_we_i;
		reg_waddr  = reg_waddr_i;
		imm_o  = unsigned_imm_type_i ? imm_zero_ext : imm_signed_ext;

		/* We do not distinguish the following instructions
		 * bwteen their register versions and immediate versions
		 *   ADDI, ADDIU, SLTI, SLTIU, ANDI, ORI, XORI 
		 *   REGIMM (TGEI, TGEIU, TLTI, TLTIU, TEQI, TNEI)
		 * As for the following instructions, 'reg2' is not used,
		 * but we also set it to be equal to 'imm'
		 *   LUI, REGIMM (BLTZ, BGEZ, BLTZAL, BGEZAL) */
		if(opcode[5:3] == 3'b001 || opcode == 6'b000001)
			reg2_o = imm_o;
	end else if(op_type_j != OP_INVALID) begin
		op = op_type_j;
		reg_raddr1 = 5'b0;
		reg_raddr2 = 5'b0;
		imm_o  = `ZERO_WORD;

		// only two instructions: J (6'b000010) and JAL (6'b000011)
		// for J,   no write operation
		// for JAL, $31 <- $pc+8
		reg_we = opcode[0];
		reg_waddr = 5'd31;
	end else if(op_type_r != OP_INVALID) begin
		op         = op_type_r;
		reg_raddr1 = reg_raddr1_r;
		reg_raddr2 = reg_raddr2_r;
		imm_o      = `ZERO_WORD;
		reg_we     = reg_we_r & ~cond_move_not_taken;
		reg_waddr  = reg_waddr_r;
	end else begin
		op = OP_INVALID;
		reg_raddr1 = 5'b0;
		reg_raddr2 = 5'b0;
		imm_o  = `ZERO_WORD;
		reg_we = 1'b0;
		reg_waddr = `ZERO_WORD;
	end
end

endmodule
