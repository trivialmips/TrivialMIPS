`include "cpu_defs.svh"

module hilo(
	input  clk, rst,
	input  HiloWriteReq_t wr,
	output DoubleWord_t   hilo
); 

DoubleWord_t reg_hilo;

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		reg_hilo <= `ZERO_DWORD;
	end else if(wr.we == 1'b1) begin
		reg_hilo <= wr.hilo;
	end
end

always_comb
begin
	if(rst == 1'b1)
	begin
		hilo = `ZERO_DWORD;
	end else if(wr.we == 1'b1) begin
		hilo = wr.hilo;
	end else begin
		hilo = reg_hilo;
	end
end

endmodule
