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
	output Bit_t     fcsr_we,
	output FCSRReg_t fcsr_wdata,
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
		FPU_OP_ADD,
		FPU_OP_SUB:  cyc_number = 2;
		FPU_OP_MUL:  cyc_number = 2;
		FPU_OP_DIV:  cyc_number = 5;
		FPU_OP_SQRT: cyc_number = 5;
		default:
			cyc_number = 1;
		endcase
	end
end

Word_t ret, ret_addsub, ret_multiply, ret_divide, ret_sqrt;
assign except = {$bits(FPUExcept_t){1'b0}};
assign fpu_ret.val = ret;

/* arithematic units */
floating_point_add_sub fpu_add_sub(
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

floating_point_multiply fpu_multiply(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.s_axis_b_tdata(reg2.val),
	.s_axis_b_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_multiply),
	.m_axis_result_tuser(),  // TODO: check exception
	.m_axis_result_tvalid()
);

floating_point_divide fpu_divide(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.s_axis_b_tdata(reg2.val),
	.s_axis_b_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_divide),
	.m_axis_result_tuser(),  // TODO: check exception
	.m_axis_result_tvalid()
);

floating_point_sqrt fpu_sqrt(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_sqrt),
	.m_axis_result_tuser(),  // TODO: check exception
	.m_axis_result_tvalid()
);

logic ret_compare;
logic [3:0] expected_cond_code;
logic [7:0] compare_cond_code;  // ( unordered, >, <, EQ )
floating_point_compare fpu_compare(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.s_axis_b_tdata(reg2.val),
	.s_axis_b_tvalid(1'b1),
	.m_axis_result_tdata(compare_cond_code),
	.m_axis_result_tvalid()
);

assign ret_compare = |(compare_cond_code[3:0] & expected_cond_code);

always_comb
begin
	unique case(inst[2:0])
	3'd0: expected_cond_code = 4'b0000;  // always false
	3'd1: expected_cond_code = 4'b1000;  // unordered
	3'd2: expected_cond_code = 4'b0001;  // equal
	3'd3: expected_cond_code = 4'b1001;  // unordered or equal
	3'd4: expected_cond_code = 4'b0010;  // ordered or less than
	3'd5: expected_cond_code = 4'b1010;  // unordered or less than
	3'd6: expected_cond_code = 4'b0011;  // ordered or less than or equal
	3'd7: expected_cond_code = 4'b1011;  // unordered or less than or equal
	default: expected_cond_code = 4'b0000;
	endcase
end

/* FCSR register result */
always_comb
begin
	fcsr_we = (op == FPU_OP_COND);
	fcsr_wdata = fcsr;
	unique case(op)
	FPU_OP_COND: fcsr_wdata.fcc[inst[10:8]] = ret_compare;
	endcase
end

/* FPU register result */
always_comb
begin
	unique case(op)
	FPU_OP_MTC:  ret = gpr2;
	FPU_OP_ADD:  ret = ret_addsub;
	FPU_OP_SUB:  ret = ret_addsub;
	FPU_OP_MUL:  ret = ret_multiply;
	FPU_OP_DIV:  ret = ret_divide;
	FPU_OP_SQRT: ret = ret_sqrt;
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
