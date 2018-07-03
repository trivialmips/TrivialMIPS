`include "cpu_defs.svh"

module id_type_i(
	input  [5:0]     opcode,
	input  Inst_t    inst,
	output Oper_t    op,
	output RegAddr_t waddr,
	output Bit_t     unsigned_imm
);

RegAddr_t rs, rd, rt;
assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];

always_comb
begin
	unsigned_imm = 1'b1;
	case(opcode)
		6'b000000: // SPECIAL
		begin 
			case(inst[5:0])
			6'b010000: op = OP_MFHI;
			6'b010001: op = OP_MTHI;
			6'b010010: op = OP_MFLO;
			6'b010011: op = OP_MTLO;
			default: op = OP_INVALID;
			endcase
		end
		6'b001101: op = OP_ORI;
		default: op = OP_INVALID;
	endcase
end

always_comb
begin
	case(opcode)
		6'b000000: // SPECIAL
		begin 
			case(inst[5:0])
			6'b010000, 6'b010010:
				waddr = rd;
			default:
				waddr = 5'b0;
			endcase
		end
		6'b001101: waddr = rt;
		default: waddr = 5'b0;
	endcase
end

endmodule
