`include "cpu_defs.svh"

`define INST(typ, r1, r2, we, w1) \
begin \
	op = typ; \
	reg_raddr1 = r1; \
	reg_raddr2 = r2; \
	reg_waddr = w1; \
	reg_we = we; \
end

`define INST_W(typ, r1, r2, w) `INST(typ, r1, r2, 1'b1, w)
`define INST_R(typ, r1, r2) `INST(typ, r1, r2, 1'b0, 5'b0)

module id_type_i(
	input  [5:0]     opcode,
	input  Inst_t    inst,
	output Oper_t    op,
	output RegAddr_t reg_raddr1,
	output RegAddr_t reg_raddr2,
	output RegAddr_t reg_waddr,
	output Bit_t     reg_we,
	output Bit_t     unsigned_imm
);

assign unsigned_imm = (
	opcode == 6'b001100 ||  // ANDI
	opcode == 6'b001101 ||  // ORI 
	opcode == 6'b001110     // XORI
);

RegAddr_t rs, rt;
assign rs = inst[25:21];
assign rt = inst[20:16];

always_comb
begin
	reg_raddr1 = rs;
	reg_raddr2 = 5'b0;
	reg_waddr  = rt;
	reg_we     = 1'b1;
	unique case(opcode)
		6'b000001: // REGIMM
		begin
			reg_we = 1'b0;
			unique case(inst[20:16])
			/* trap */
			5'b01000: `INST_R(OP_TGE,  rs, 5'b0)
			5'b01001: `INST_R(OP_TGEU, rs, 5'b0)
			5'b01010: `INST_R(OP_TLT,  rs, 5'b0)
			5'b01011: `INST_R(OP_TLTU, rs, 5'b0)
			5'b01100: `INST_R(OP_TEQ,  rs, 5'b0)
			5'b01110: `INST_R(OP_TNE,  rs, 5'b0)

			/* jump */
			5'b00000: `INST_R(OP_BLTZ, rs, 5'b0)
			5'b00001: `INST_R(OP_BGEZ, rs, 5'b0)
			5'b10000: `INST_W(OP_BLTZAL, rs, 5'b0, 5'd31)
			5'b10001: `INST_W(OP_BGEZAL, rs, 5'b0, 5'd31)
			default: op = OP_INVALID;
			endcase
		end
		/* logic */
		6'b001100: `INST_W(OP_AND, rs, 5'b0, rt)
		6'b001101: `INST_W(OP_OR,  rs, 5'b0, rt)
		6'b001110: `INST_W(OP_XOR, rs, 5'b0, rt)
		6'b001111: `INST_W(OP_LUI, 5'b0, 5'b0, rt)

		/* add and substract */
		6'b001000: `INST_W(OP_ADD,  rs, 5'b0, rt)
		6'b001001: `INST_W(OP_ADDU, rs, 5'b0, rt)

		/* compare and set */
		6'b001010: `INST_W(OP_SLT,  rs, 5'b0, rt)
		6'b001011: `INST_W(OP_SLTU, rs, 5'b0, rt)

		/* jump */
		6'b000100: `INST_R(OP_BEQ,  rs, rt)
		6'b000101: `INST_R(OP_BNE,  rs, rt)
		6'b000110: `INST_R(OP_BLEZ, rs, 5'b0)  // rt = 0
		6'b000111: `INST_R(OP_BGTZ, rs, 5'b0)  // rt = 0

		/* store data */
		6'b101000: `INST_R(OP_SB,  rs, rt)
		6'b101001: `INST_R(OP_SH,  rs, rt)
		6'b101010: `INST_R(OP_SWL, rs, rt)
		6'b101011: `INST_R(OP_SW,  rs, rt)
		6'b101110: `INST_R(OP_SWR, rs, rt)

		/* load data */
		6'b100000: `INST_W(OP_LB,  rs, 5'b0, rt)
		6'b100001: `INST_W(OP_LH,  rs, 5'b0, rt)
		6'b100010: `INST_W(OP_LWL, rs, rt,   rt)
		6'b100011: `INST_W(OP_LW,  rs, 5'b0, rt)
		6'b100100: `INST_W(OP_LBU, rs, 5'b0, rt)
		6'b100101: `INST_W(OP_LHU, rs, 5'b0, rt)
		6'b100110: `INST_W(OP_LWR, rs, rt,   rt)

		/* conditional load/store */
		6'b110000: `INST_W(OP_LL,  rs, 5'b0, rt)
		6'b111000: `INST_W(OP_SC,  rs, rt,   rt)

		/* perfetch */
		6'b110011: `INST_R(OP_NOP, 5'b0, 5'b0)
		default: op = OP_INVALID;
	endcase
end

endmodule
