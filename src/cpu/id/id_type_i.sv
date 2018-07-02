`include "cpu_defs.svh"

module id_type_i(
	input  [5:0]     opcode,
	output Oper_t    op,
	output Bit_t     unsigned_imm
);

always_comb
begin
	unsigned_imm = 1'b1;
	case(opcode)
		6'b001101: op = OP_ORI;
		default: op = OP_INVALID;
	endcase
end

endmodule
