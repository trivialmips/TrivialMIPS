module lfsr4(
	input  clk, rst,
	output reg [3:0] val
);

logic [3:0] mov_val;
assign mov_val = (val >> 0) ^ (val >> 1);

always @(posedge clk)
begin
	if(rst)
	begin
		val <= 4'b1011;
	end else begin
		val[2:0] <= val[3:1];
		val[3]   <= mov_val[0];
	end
end

endmodule 
