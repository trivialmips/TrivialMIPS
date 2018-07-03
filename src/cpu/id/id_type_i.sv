`include "cpu_defs.svh"

module id_type_i(
	input  [5:0]     opcode,
	input  Inst_t    inst,
	output Oper_t    op,
	output Bit_t     unsigned_imm
);

assign unsigned_imm = (opcode == 6'b001101);

always_comb
begin
	case(opcode)
		6'b001101: op = OP_ORI;
		6'b101011: op = OP_SW;
		6'b100011: op = OP_LW;
		default: op = OP_INVALID;
	endcase
end

endmodule
