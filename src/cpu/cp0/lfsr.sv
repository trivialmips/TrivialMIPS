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

module lfsr32(
	input  clk, rst,
	output reg [31:0] val
);

logic [31:0] mov_val;
// x^32 + x^30 + x^11 + x^5 + 1
assign mov_val = (val >> 0) ^ (val >> 2) ^ (val >> 21) ^ (val >> 27);

always @(posedge clk)
begin
	if(rst)
	begin
		val <= 32'hdeadface;
	end else begin
		val[30:0] <= val[31:1];
		val[31]   <= mov_val[0];
	end
end

endmodule 
