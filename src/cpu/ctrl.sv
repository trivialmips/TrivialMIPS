`include "cpu_defs.svh"

module ctrl(
	input  rst,
	input  Bit_t   stall_from_if,
	input  Bit_t   stall_from_id,
	input  Bit_t   stall_from_ex,
	input  Bit_t   stall_from_mem,
	input  Bit_t   stall_from_wb,
	output Stall_t stall
);

always_comb
begin
	if(rst)
	begin
		stall = 6'b000000;
	end else if(stall_from_wb) begin
		stall = 6'b111111;
	end else if(stall_from_mem) begin
		stall = 6'b111110;
	end else if(stall_from_ex) begin
		stall = 6'b111100;
	end else if(stall_from_id) begin
		stall = 6'b111000;
	end else if(stall_from_if) begin
		stall = 6'b110000;
	end else begin
		stall = 6'b000000;
	end
end

endmodule
