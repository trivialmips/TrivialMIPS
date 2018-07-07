`include "cpu_defs.svh"

module ll_bit_reg(
	input  clk, rst,
	input  Bit_t         flush,
	input  RegWriteReq_t wr,
	output Bit_t         ll_bit
); 

reg ll_bit_inner;

always @(posedge clk)
begin
	if(rst == 1'b1 || flush)
	begin
		ll_bit_inner <= 1'b0;
	end else if(wr.we == 1'b1) begin
		ll_bit_inner <= wr.wdata[0];
	end
end

always_comb
begin
	if(rst == 1'b1 || flush)
	begin
		ll_bit = 1'b0;
	end else if(wr.we == 1'b1) begin
		ll_bit = wr.wdata[0];
	end else ll_bit = ll_bit_inner;
end

endmodule
