`include "cpu_defs.svh"

module cpu_ex(
	input  rst,
	input  Oper_t     op,
	input  InstAddr_t pc,
	input  Word_t     reg1,
	input  Word_t     reg2,
	output Word_t     ret,
	output Bit_t      stall_req
);

assign stall_req = 1'b0;

always_comb
begin
	if(rst == 1'b1)
	begin
		ret = `ZERO_WORD;
	end else begin
		case(op)
		OP_ORI:
			ret = reg1 | reg2;
		OP_JAL:
			ret = pc + 32'd8;
		default: begin
            ret = `ZERO_WORD;
        end
		endcase
	end
end

endmodule
