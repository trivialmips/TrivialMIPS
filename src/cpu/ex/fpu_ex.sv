`include "cpu_defs.svh"

module fpu_ex(
	input  clk, rst,
	input  FPUOper_t op,
	input  FCSRReg_t fcsr,
	input  Word_t    gpr1,
	input  Word_t    gpr2,
	input  FPUReg_t  reg1,
	input  FPUReg_t  reg2,
	output FPUReg_t  fpu_ret,
	output Word_t    cpu_ret,
	output FPUExcept_t except,
	output Bit_t     is_busy
);

assign except = {$bits(FPUExcept_t){1'b0}};
assign is_busy = 1'b0;
Word_t ret;
assign fpu_ret.val = ret;

always_comb
begin
	unique case(op)
	FPU_OP_MTC: ret = gpr2;
	default: ret = 32'b0;
	endcase
end

always_comb
begin
	unique case(op)
	FPU_OP_MFC: cpu_ret = reg2;
	default: cpu_ret = 32'b0;
	endcase
end

endmodule
