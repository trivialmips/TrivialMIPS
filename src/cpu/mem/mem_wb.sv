`include "cpu_defs.svh"

module mem_wb(
	input  clk, rst,

	input  RegWriteReq_t mem_wr,
	output RegWriteReq_t wb_wr
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		wb_wr.we    <= 1'b0;
		wb_wr.waddr <= `ZERO_WORD;
		wb_wr.wdata <= `ZERO_WORD;
	end else begin
		wb_wr <= mem_wr;
	end
end

endmodule
