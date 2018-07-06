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
	 opcode == 6'b001100  // ANDI
  || opcode == 6'b001101  // ORI 
  || opcode == 6'b001110  // XORI
  || opcode == 6'b001111  // LUI
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
			5'b01100: op = OP_TEQI;

			/* jump */
			5'b00000: `INST_R(OP_BLTZ, rs, 5'b0)
			5'b00001: `INST_R(OP_BGEZ, rs, 5'b0)
			5'b10000: `INST_W(OP_BLTZAL, rs, 5'b0, 5'd31)
			5'b10001: `INST_W(OP_BGEZAL, rs, 5'b0, 5'd31)
			default: op = OP_INVALID;
			endcase
		end
		/* logic */
		6'b001100: `INST_W(OP_ANDI, rs, 5'b0, rt)
		6'b001101: `INST_W(OP_ORI,  rs, 5'b0, rt)
		6'b001110: `INST_W(OP_XORI, rs, 5'b0, rt)
		6'b001111: `INST_W(OP_LUI,  5'b0, 5'b0, rt)

		/* add and substract */
		6'b001000: `INST_W(OP_ADDI,  rs, 5'b0, rt)
		6'b001001: `INST_W(OP_ADDIU, rs, 5'b0, rt)

		/* compare and set */
		6'b001010: `INST_W(OP_SLTI,  rs, 5'b0, rt)
		6'b001011: `INST_W(OP_SLTIU, rs, 5'b0, rt)

		/* jump */
		6'b000100: `INST_R(OP_BEQ,  rs, rt)
		6'b000101: `INST_R(OP_BNE,  rs, rt)
		6'b000110: `INST_R(OP_BLEZ, rs, 5'b0)  // rt = 0
		6'b000111: `INST_R(OP_BGTZ, rs, 5'b0)  // rt = 0

		6'b101011: 
		begin
			op = OP_SW;
			reg_we = 1'b0;
			reg_raddr1 = rs;
			reg_raddr2 = rt;
		end
		6'b100011:
		begin
			op = OP_LW;
			reg_we = 1'b1;
			reg_raddr1 = rs;
			reg_raddr2 = rt;
		end
		default: op = OP_INVALID;
	endcase
end

endmodule
