`include "cpu_defs.svh"

module id_type_j(
	input  [5:0]     opcode,
	output Oper_t    op
);

always_comb
begin
	case(opcode)
		6'b000010: op = OP_J;
		6'b000011: op = OP_JAL;
		default: op = OP_INVALID;
	endcase
end

endmodule
