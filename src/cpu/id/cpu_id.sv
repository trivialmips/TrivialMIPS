`include "cpu_defs.svh"

module cpu_id(
	input  rst,
	input  InstAddr_t pc,
	input  Inst_t     inst,

	input  Word_t     reg1_i,
	input  Word_t     reg2_i,

	output RegAddr_t  reg_raddr1,
	output RegAddr_t  reg_raddr2,

	output Oper_t     op,
	output Word_t     reg1_o,
	output Word_t     reg2_o,
	output Word_t     imm_o,
	// whether to write register
	output Bit_t      reg_we,
	// the address of register to be written
	output RegAddr_t  reg_waddr,
	output Bit_t      stall_req,
	output ExceptInfo_t except,

	input  MemAccessReq_t ex_memory_req,
	input  RegWriteReq_t  ex_wr,
	input  RegWriteReq_t  mem_wr
);

assign except.occur = 1'b0;

// 6-bit primary operation code
logic [5:0] opcode;
// 5-bit specifier for the source/destination/target register
RegAddr_t rs, rd, rt;
// 16-bit immediate
HalfWord_t immediate;
// 26-bit index shifted left two bits to supply the low-order 28 bits of the jump target address
logic [25:0] instr_index;

assign opcode = inst[31:26];
assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];
assign immediate = inst[15:0];
assign instr_index = inst[25:0];

// load related stalling
Bit_t is_ex_load_inst;
assign is_ex_load_inst = ex_memory_req.ce && ~ex_memory_req.we;
assign stall_req = is_ex_load_inst && 
	(ex_wr.waddr == reg_raddr1 && reg_raddr1 != 5'b0 ||
	 ex_wr.waddr == reg_raddr2 && reg_raddr2 != 5'b0);

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
	end else if(ex_wr.we && ex_wr.waddr == reg_raddr1) begin
		safe_reg1 = ex_wr.wdata;
	end else if(mem_wr.we && mem_wr.waddr == reg_raddr1) begin
		safe_reg1 = mem_wr.wdata;
	end else begin
		safe_reg1 = reg1_i;
	end

	if(rst == 1'b1 || reg_raddr2 == 5'b0)
	begin
		safe_reg2 = `ZERO_WORD;
	end else if(ex_wr.we && ex_wr.waddr == reg_raddr2) begin
		safe_reg2 = ex_wr.wdata;
	end else if(mem_wr.we && mem_wr.waddr == reg_raddr2) begin
		safe_reg2 = mem_wr.wdata;
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

Bit_t cond_move_not_taken, movz_not_taken, movn_not_taken;
assign movn_not_taken = op_type_r == OP_MOVN && safe_reg2 == `ZERO_WORD;
assign movz_not_taken = op_type_r == OP_MOVZ && safe_reg2 != `ZERO_WORD;
assign cond_move_not_taken = movn_not_taken | movz_not_taken;

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
