`include "cpu_defs.svh"

module fpu_ex(
	input  clk, rst,
	input  flush,
	input  FPUOper_t op,
	input  Inst_t    inst,
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

/* cycle control */
logic [5:0] cyc_number;
logic [63:0] cyc_stage;
assign is_busy = (cyc_number != 1 && ~cyc_stage[0]);
always @(posedge clk)
begin
	if(rst || flush) 
	begin
		cyc_stage <= 0;
	end else if(cyc_stage != 0) begin
		cyc_stage <= cyc_stage >> 1;
	end else begin
		cyc_stage <= ((1 << cyc_number) >> 2);
	end
end

always_comb
begin
	if(rst || flush)
	begin
		cyc_number = 1;
	end else begin
		unique case(op)
		FPU_OP_ADD, FPU_OP_SUB:
			cyc_number = 5;
		default:
			cyc_number = 1;
		endcase
	end
end

Word_t ret, ret_addsub;
assign except = {$bits(FPUExcept_t){1'b0}};
assign fpu_ret.val = ret;

/* arithematic units */
floating_point_add_sub fadd_sub(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.s_axis_b_tdata(reg2.val),
	.s_axis_b_tvalid(1'b1),
	.s_axis_operation_tdata(op == FPU_OP_ADD ? 8'b00000000 : 8'b00000001),
	.s_axis_operation_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_addsub),
	.m_axis_result_tuser(),  // TODO: check exception
	.m_axis_result_tvalid()
);

/* FPU register result */
always_comb
begin
	unique case(op)
	FPU_OP_MTC: ret = gpr2;
	FPU_OP_ADD, FPU_OP_SUB:
		ret = ret_addsub;
	default: ret = 32'b0;
	endcase
end

/* CPU register result */
always_comb
begin
	unique case(op)
	FPU_OP_MFC: cpu_ret = reg2;
	default: cpu_ret = 32'b0;
	endcase
end

endmodule
