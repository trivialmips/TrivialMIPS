`include "cpu_defs.svh"

module ex_mem(
	input  clk, rst,

	input  RegWriteReq_t ex_wr,
	output RegWriteReq_t mem_wr,

	input  Stall_t       stall
);

always @(posedge clk)
begin
	if(rst == 1'b1 || (stall.stall_ex && ~stall.stall_mem))
	begin
		mem_wr.we    <= 1'b0;
		mem_wr.waddr <= `ZERO_WORD;
		mem_wr.wdata <= `ZERO_WORD;
	end else if(~stall.stall_ex) begin
		mem_wr <= ex_wr;
	end
end

endmodule
