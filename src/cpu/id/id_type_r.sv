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

module id_type_r(
	input  [5:0]     opcode,
	input  Inst_t    inst,
	output RegAddr_t reg_raddr1,
	output RegAddr_t reg_raddr2,
	output RegAddr_t reg_waddr,
	output Bit_t     reg_we,
	output Oper_t    op
);

logic [4:0] sa;
logic [5:0] funct;
RegAddr_t rs, rd, rt;

assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];
assign sa = inst[10:6];
assign funct = inst[5:0];

always_comb
begin
	reg_raddr1 = rs;
	reg_raddr2 = rt;
	reg_waddr  = rd;
	reg_we     = 1'b1;
	unique case(opcode)
		6'b000000: // SPECIAL
		begin 
			if(inst == 32'b0)
			begin
				`INST_R(OP_NOP, 5'b0, 5'b0)
			end else if(inst == 32'h40) begin
				`INST_R(OP_SSNOP, 5'b0, 5'b0)
			end else begin
				unique case(inst[5:0])
				/* logical */
				6'b100100: `INST_W(OP_AND, rs, rt, rd)
				6'b100101: `INST_W(OP_OR,  rs, rt, rd)
				6'b100110: `INST_W(OP_XOR, rs, rt, rd)
				6'b100111: `INST_W(OP_NOR, rs, rt, rd)
				/* move */
				6'b010000: `INST_W(OP_MFHI, rs, rt, rd) // rs = rt      = 0
				6'b010001: `INST_R(OP_MTHI, rs, rt)     //      rt = rd = 0
				6'b010010: `INST_W(OP_MFLO, rs, rt, rd) // rs = rt = 0
				6'b010011: `INST_R(OP_MTLO, rs, rt)     //      rt = rd = 0
				/* conditional move */
				6'b000001: `INST_W(OP_MOVCI, rs, 5'b0, rd)
				6'b001011: `INST_W(OP_MOVN, rs, rt, rd)
				6'b001010: `INST_W(OP_MOVZ, rs, rt, rd)
				/* jump */
				6'b001000: `INST_R(OP_JR,   rs, rt)     //      rt = rd = 0
				6'b001001: `INST_W(OP_JALR, rs, rt, rd) //      rt      = 0
				/* shift */
				6'b000000: `INST_W(OP_SLL,  rs, rt, rd) // rs           = 0
				6'b000010: if(rs[0]) begin
					`INST_W(OP_ROR,  5'b0, rt, rd)
				end else begin
					`INST_W(OP_SRL,  5'b0, rt, rd)
				end
				6'b000011: `INST_W(OP_SRA,  rs, rt, rd) // rs           = 0
				6'b000100: `INST_W(OP_SLLV, rs, rt, rd)
				6'b000110: if(inst[6]) begin
					`INST_W(OP_RORV, rs, rt, rd)
				end else begin
					`INST_W(OP_SRLV, rs, rt, rd)
				end
				6'b000111: `INST_W(OP_SRAV, rs, rt, rd)
				/* add and substract */
				6'b100000: `INST_W(OP_ADD,  rs, rt, rd)
				6'b100001: `INST_W(OP_ADDU, rs, rt, rd)
				6'b100010: `INST_W(OP_SUB,  rs, rt, rd)
				6'b100011: `INST_W(OP_SUBU, rs, rt, rd)
				/* multiplication and division */
				6'b011000: `INST_R(OP_MULT,  rs, rt)    //           rd = 0
				6'b011001: `INST_R(OP_MULTU, rs, rt)    //           rd = 0
				6'b011010: `INST_R(OP_DIV,   rs, rt)    //           rd = 0
				6'b011011: `INST_R(OP_DIVU,  rs, rt)    //           rd = 0
				/* compare and set */
				6'b101010: `INST_W(OP_SLT,  rs, rt, rd)
				6'b101011: `INST_W(OP_SLTU, rs, rt, rd)
				/* trap */
				6'b110000: `INST_R(OP_TGE,  rs, rt)
				6'b110001: `INST_R(OP_TGEU, rs, rt)
				6'b110010: `INST_R(OP_TLT,  rs, rt)
				6'b110011: `INST_R(OP_TLTU, rs, rt)
				6'b110100: `INST_R(OP_TEQ,  rs, rt)
				6'b110110: `INST_R(OP_TNE,  rs, rt)
				/* breakpoint and syscall */
				6'b001100: `INST_R(OP_SYSCALL, 5'b0, 5'b0)
				6'b001101: `INST_R(OP_BREAK,   5'b0, 5'b0)
				/* sync */
				6'b001111: `INST_R(OP_NOP, 5'b0, 5'b0)
				default: op = OP_INVALID;
				endcase
			end
		end
		6'b011100: // SPECIAL2
		begin 
			unique case(inst[5:0])
			6'b100000: `INST_W(OP_CLZ, rs, 5'b0, rd)
			6'b100001: `INST_W(OP_CLO, rs, 5'b0, rd)

			6'b000000: `INST_R(OP_MADD,  rs, rt)  // rd = 0
			6'b000001: `INST_R(OP_MADDU, rs, rt)  // rd = 0
			6'b000100: `INST_R(OP_MSUB,  rs, rt)  // rd = 0
			6'b000101: `INST_R(OP_MSUBU, rs, rt)  // rd = 0

			6'b000010: `INST_W(OP_MUL, rs, rt, rd)
			default: op = OP_INVALID;
			endcase
		end
		6'b011111:  // SPECIAL3
		begin
			unique case(inst[5:0])
			6'b000000: `INST_W(OP_EXT, rs, 5'b0, rt)
			6'b000100: `INST_W(OP_INS, rs, rt, rt)
			6'b100000:
				unique case(inst[10:6])
				5'b10000: `INST_W(OP_SEB, 5'b0, rt, rd)
				5'b11000: `INST_W(OP_SEH, 5'b0, rt, rd)
				5'b00010: `INST_W(OP_WSBH, 5'b0, rt, rd)
				default: op = OP_INVALID;
				endcase
			default: op = OP_INVALID;
			endcase
		end
		6'b010000:  // COP0
		begin
			unique case(inst[25:21])
			5'b00000: `INST_W(OP_MFC0, 5'b0, 5'b0, rt)
			5'b00100: `INST_R(OP_MTC0, 5'b0, rt)
			5'b10000:
			begin
				unique case(inst[5:0])
				6'b000001: `INST_R(OP_TLBR,  5'b0, 5'b0)
				6'b000010: `INST_R(OP_TLBWI, 5'b0, 5'b0)
				6'b000110: `INST_R(OP_TLBWR, 5'b0, 5'b0)
				6'b001000: `INST_R(OP_TLBP,  5'b0, 5'b0)
				6'b011000: `INST_R(OP_ERET,  5'b0, 5'b0)
				default: op = OP_INVALID;
				endcase
			end
			default: op = OP_INVALID;
			endcase
		end
		6'b010001:  // COP1
		begin
			unique case(inst[25:21])
			5'b00000: `INST_W(OP_MFC1, 5'b0, 5'b0, rt)
			5'b00010: `INST_W(OP_CFC1, 5'b0, 5'b0, rt)
			5'b00100: `INST_R(OP_MTC1, 5'b0, rt)
			5'b00110: `INST_R(OP_CTC1, 5'b0, rt)
			5'b01000: `INST_R(OP_BC1, 5'b0, 5'b0)
			5'b10000: // fmt = S
			begin
				`INST_R(OP_FPU, 5'b0, 5'b0)
				if(inst[5:1] == 5'b01001)
					reg_raddr2 = rt; // MOVZ, MOVN
			end
			default: `INST_R(OP_FPU, 5'b0, 5'b0)
			endcase
		end
		default: op = OP_INVALID;
	endcase
end

endmodule
