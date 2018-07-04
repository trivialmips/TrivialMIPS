`include "cpu_defs.svh"

module ctrl(
	input  rst,
	input  Bit_t   stall_from_if,
	input  Bit_t   stall_from_id,
	input  Bit_t   stall_from_ex,
	input  Bit_t   stall_from_mem,
	input  Bit_t   stall_from_wb,
	output Stall_t stall,

	input  ExceptReq_t except_req,
	output Bit_t       flush
);

always_comb
begin
	if(rst)
	begin
		stall = 6'b000000;
		flush = 1'b0;
	end else if(except_req.flush) begin
		stall = 6'b000000;
		flush = 1'b1;
	end else if(stall_from_wb) begin
		stall = 6'b111111;
		flush = 1'b0;
	end else if(stall_from_mem) begin
		stall = 6'b111110;
		flush = 1'b0;
	end else if(stall_from_ex) begin
		stall = 6'b111100;
		flush = 1'b0;
	end else if(stall_from_id) begin
		stall = 6'b111000;
		flush = 1'b0;
	end else if(stall_from_if) begin
		stall = 6'b110000;
		flush = 1'b0;
	end else begin
		stall = 6'b000000;
		flush = 1'b0;
	end
end

endmodule
