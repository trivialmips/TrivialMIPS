module fcsr_mux(
	input  Bit_t ex_fcsr_we_a,
	input  Bit_t ex_fcsr_we_b,
	input  Bit_t mem_fcsr_we_a,
	input  Bit_t mem_fcsr_we_b,
	input  FCSRReg_t ex_fcsr_a,
	input  FCSRReg_t ex_fcsr_b,
	input  FCSRReg_t mem_fcsr_a,
	input  FCSRReg_t mem_fcsr_b,
	input  FCSRReg_t fcsr_unsafe,
	output FCSRReg_t fcsr_safe
);

always_comb
begin
	if(ex_fcsr_we_b) begin
		fcsr_safe = ex_fcsr_b;
	end else if(ex_fcsr_we_a) begin
		fcsr_safe = ex_fcsr_a;
	end else if(mem_fcsr_we_b) begin
		fcsr_safe = mem_fcsr_b;
	end else if(mem_fcsr_we_a) begin
		fcsr_safe = mem_fcsr_a;
	end else begin
		fcsr_safe = fcsr_unsafe;
	end
end

endmodule
