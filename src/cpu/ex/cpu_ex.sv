`include "cpu_defs.svh"

module cpu_ex(
	input  rst,
	input  Oper_t     op,
	input  Word_t     reg1,
	input  Word_t     reg2,
	output Word_t     ret;
);

always_comb
begin
	if(rst == 1'b1)
	begin
		ret = `ZERO_WORD;
	end else begin
		case(op)
		OP_ORI:
			ret = reg1 | reg2;
		default:
			ret = `ZERO_WORD;
		endcase
	end
end

endmodule
