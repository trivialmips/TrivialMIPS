`include "cpu_defs.svh"

module cpu_wb(
	input  rst,

	input  RegWriteReq_t wr_i,
	output RegWriteReq_t wr_o,
	output Bit_t         stall_req
);

assign stall_req = 1'b0;

always_comb
begin
	if(rst == 1'b1)
	begin
		wr_o.we    = 1'b0;
		wr_o.waddr = `ZERO_WORD;
		wr_o.wdata = `ZERO_WORD;
	end else begin
		wr_o = wr_i;
	end
end

endmodule
