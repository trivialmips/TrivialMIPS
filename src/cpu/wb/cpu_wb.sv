`include "cpu_defs.svh"

module cpu_wb(
	input  clk, rst,

	input  Bit_t      we_i,
	input  RegAddr_t  waddr_i,
	input  Word_t     wdata_i,

	output Bit_t      we_o,
	output RegAddr_t  waddr_o,
	output Word_t     wdata_o
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		we_o    <= 1'b0;
		waddr_o <= `ZERO_WORD;
		wdata_o <= `ZERO_WORD;
	end else begin
		we_o    <= we_i;
		waddr_o <= waddr_i;
		wdata_o <= wdata_i;
	end
end

endmodule
