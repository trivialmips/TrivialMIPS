`include "cpu_defs.svh"

module id_type_r(
	input  [5:0]     opcode,
	input  Inst_t    inst,
	output Oper_t    op
);

// 5-bit shift amount
logic [4:0] sa;
// 6-bit function field used to specify functions within the primary opcode SPECIAL
logic [5:0] funct;

assign sa = inst[10:6];
assign funct = inst[5:0];

always_comb
begin
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
		6'b011100: // SPECIAL2
		begin 
			case(inst[5:0])
			6'b000001: op = OP_MADDU;
			default: op = OP_INVALID;
			endcase
		end
		default: op = OP_INVALID;
	endcase
end

endmodule
