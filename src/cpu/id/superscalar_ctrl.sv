`include "cpu_defs.svh"

module superscalar_ctrl(
	input  rst, ena,

	input  PipelineData_t data_a,
	input  PipelineData_t data_b,
	input  PipelineReq_t  req_a,
	input  PipelineReq_t  req_b,

	output Bit_t inst2_taken
);

always_comb
begin
	if(rst || ~ena)
	begin
		inst2_taken = 1'b0;
	end else if(data_a.delayslot) begin
		inst2_taken = 1'b0;
	end else begin
		if(data_a.op == OP_OR && data_b.op == OP_OR)
		begin
			inst2_taken = 1'b1;
		end else begin
			inst2_taken = 1'b0;
		end
	end
end

endmodule
