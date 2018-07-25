`include "cpu_defs.svh"

module fpu_ex(
	input  clk, rst,
	input  flush,
	input  FPUOper_t op,
	input  Inst_t    inst,
	input  FCSRReg_t fcsr,
	input  Word_t    fccr,
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
		// ADD/SUB/MUL/DIV have an extra pipeline latency
		FPU_OP_ADD:  cyc_number = 2;
		FPU_OP_SUB:  cyc_number = 2;
		FPU_OP_MUL:  cyc_number = 2;
		FPU_OP_DIV:  cyc_number = 6;
		FPU_OP_SQRT: cyc_number = 5;
		FPU_OP_COND: cyc_number = 2;
		default:     cyc_number = 1;
		endcase
	end
end

/* utility */
function is_nan(input Word_t x);
	is_nan = (x == 32'h7fffffff || x == 32'h7fbfffff);
endfunction

// invalid
logic exp_sqrt;
// divide_by_zero, invalid, overflow, underflow
logic [3:0] exp_divide;
// invalid, overflow, underflow
logic [2:0] exp_add, exp_sub, exp_multiply;

Bit_t reg1_nan;
Word_t ret, ret_add, ret_sub, ret_multiply;
Word_t ret_divide, ret_sqrt, ret_neg, ret_abs;
assign fpu_ret.val = ret;

assign reg1_nan = is_nan(reg1.val);
assign ret_abs = reg1_nan ? reg1.val : { 1'b0, reg1.val[30:0] };
assign ret_neg = reg1_nan ? reg1.val : { ~reg1.val[31], reg1.val[30:0] };

/* arithematic units */
Word_t pipe_val1, pipe_val2;
always @(posedge clk)
begin
	pipe_val1 <= reg1.val;
	pipe_val2 <= reg2.val;
end

floating_point_add fpu_add(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.s_axis_b_tdata(reg2.val),
	.s_axis_b_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_add),
	.m_axis_result_tuser(exp_add),
	.m_axis_result_tvalid()
);

floating_point_sub fpu_sub(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.s_axis_b_tdata(reg2.val),
	.s_axis_b_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_sub),
	.m_axis_result_tuser(exp_sub),
	.m_axis_result_tvalid()
);

floating_point_multiply fpu_multiply(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.s_axis_b_tdata(reg2.val),
	.s_axis_b_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_multiply),
	.m_axis_result_tuser(exp_multiply),
	.m_axis_result_tvalid()
);

floating_point_divide fpu_divide(
	.s_axis_a_tdata(pipe_val1),
	.s_axis_a_tvalid(1'b1),
	.s_axis_b_tdata(pipe_val2),
	.s_axis_b_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_divide),
	.m_axis_result_tuser(exp_divide),
	.m_axis_result_tvalid()
);

floating_point_sqrt fpu_sqrt(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.aclk(clk),
	.m_axis_result_tdata(ret_sqrt),
	.m_axis_result_tuser(exp_sqrt),
	.m_axis_result_tvalid()
);

logic [7:0] ret_compare_fcc, ret_compare_fcc_pipe;
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

always_comb
begin
	ret_compare_fcc = fcsr.fcc;
	ret_compare_fcc[inst[10:8]] = |(compare_cond_code[3:0] & expected_cond_code);
end

always @(posedge clk)
begin
	ret_compare_fcc_pipe <= ret_compare_fcc;
end

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

/* convert to int */
Word_t ret_ceil, ret_floor, ret_trunc, ret_round;
Bit_t invalid_ceil, invalid_floor, invalid_trunc, invalid_round;
fpu_float2int float2int_instance(
	.float(reg1.val),
	.invalid_ceil,
	.invalid_floor,
	.invalid_trunc,
	.invalid_round,
	.ceil(ret_ceil),
	.floor(ret_floor),
	.trunc(ret_trunc),
	.round(ret_round)
);

Word_t ret_int2float;
floating_point_int2float fpu_int2float_instance(
	.s_axis_a_tdata(reg1.val),
	.s_axis_a_tvalid(1'b1),
	.m_axis_result_tdata(ret_int2float),
	.m_axis_result_tvalid()
);

/* exception */
`define FPU_EXP3 { except.invalid, except.overflow, except.underflow }
`define FPU_EXP4 { except.divided_by_zero, except.invalid, except.overflow, except.underflow }
always_comb
begin
	except = {$bits(FPUExcept_t){1'b0}};

	unique case(op)
	FPU_OP_ADD: `FPU_EXP3 = exp_add;
	FPU_OP_SUB: `FPU_EXP3 = exp_sub;
	FPU_OP_MUL: `FPU_EXP3 = exp_multiply;
	FPU_OP_DIV: `FPU_EXP4 = exp_divide;
	FPU_OP_NEG:  except.invalid = reg1_nan;
	FPU_OP_ABS:  except.invalid = reg1_nan;
	FPU_OP_SQRT: except.invalid = exp_sqrt;
	FPU_OP_CEIL: except.invalid = invalid_ceil;
	FPU_OP_TRUNC: except.invalid = invalid_trunc;
	FPU_OP_ROUND: except.invalid = invalid_round;
	FPU_OP_FLOOR: except.invalid = invalid_floor;
	FPU_OP_CVTW:
	begin
		unique casez(fcsr.rm)
		2'd0: except.invalid = invalid_round;
		2'd1: except.invalid = invalid_trunc;
		2'd2: except.invalid = invalid_ceil;
		2'd3: except.invalid = invalid_floor;
		endcase
	end
	FPU_OP_INVALID: except.unimpl = 1'b1;
	default: begin end
	endcase
end

/* FCSR register result */
always_comb
begin
	fcsr_we    = 1'b1;
	fcsr_wdata = fcsr;
	unique case(op)
	FPU_OP_COND: fcsr_wdata.fcc = ret_compare_fcc_pipe;
	FPU_OP_ADD, FPU_OP_SUB, FPU_OP_MUL, FPU_OP_DIV, FPU_OP_SQRT,
	FPU_OP_CEIL, FPU_OP_TRUNC, FPU_OP_FLOOR, FPU_OP_ROUND, FPU_OP_CVTS,
	FPU_OP_CVTW, FPU_OP_NEG, FPU_OP_ABS:
		fcsr_wdata.flags[4:0] = fcsr.flags[4:0] | except[4:0];
	FPU_OP_CTC:
	begin
		unique case(inst[15:11])
		5'd25: fcsr_wdata.fcc = gpr2[7:0];
		5'd26: begin
			fcsr_wdata.cause      = gpr2[17:12];
			fcsr_wdata.flags[4:0] = gpr2[6:2];
		end
		5'd28: begin
			fcsr_wdata.fs           = gpr2[2];
			fcsr_wdata.rm           = gpr2[1:0];
			fcsr_wdata.enables[4:0] = gpr2[11:7];
		end
		5'd31: begin
			fcsr_wdata.fcc          = { gpr2[31:25], gpr2[23] };
			fcsr_wdata.fs           = gpr2[24];
			fcsr_wdata.cause        = gpr2[17:12];
			fcsr_wdata.enables[4:0] = gpr2[11:7];
			fcsr_wdata.flags[4:0]   = gpr2[6:2];
			fcsr_wdata.rm           = gpr2[1:0];
		end
		default: fcsr_we = 1'b0;
		endcase
	end
	default: fcsr_we = 1'b0;
	endcase
end

/* FPU register result */
always_comb
begin
	unique case(op)
	FPU_OP_MTC:  ret = gpr2;
	FPU_OP_MOV:  ret = reg1.val;
	FPU_OP_NEG:  ret = ret_neg;
	FPU_OP_ABS:  ret = ret_abs;
	FPU_OP_ADD:  ret = ret_add;
	FPU_OP_SUB:  ret = ret_sub;
	FPU_OP_MUL:  ret = ret_multiply;
	FPU_OP_DIV:  ret = ret_divide;
	FPU_OP_SQRT: ret = ret_sqrt;
	FPU_OP_CEIL: ret = ret_ceil;
	FPU_OP_TRUNC: ret = ret_trunc;
	FPU_OP_ROUND: ret = ret_round;
	FPU_OP_FLOOR: ret = ret_floor;
	FPU_OP_CVTS: ret = ret_int2float;
	FPU_OP_CVTW:
	begin
		unique casez(fcsr.rm)
		2'd0: ret = ret_round;
		2'd1: ret = ret_trunc;
		2'd2: ret = ret_ceil;
		2'd3: ret = ret_floor;
		endcase
	end
	default: ret = 32'b0;
	endcase
end

/* CPU register result */
always_comb
begin
	unique case(op)
	FPU_OP_MFC: cpu_ret = reg2.val;
	FPU_OP_CFC:
	begin
		unique case(inst[15:11])
		5'd0:  cpu_ret = fccr;
		5'd25: cpu_ret = { 24'b0, fcsr.fcc };
		5'd26: cpu_ret = { 14'b0, fcsr.cause, 5'b0, fcsr.flags[4:0], 2'b0 };
		5'd28: cpu_ret = { 20'b0, fcsr.enables[4:0], 4'b0, fcsr.fs, fcsr.rm };
		5'd31: cpu_ret = { fcsr.fcc[7:1], fcsr.fs, fcsr.fcc[0], 5'b0,
			fcsr.cause, fcsr.enables[4:0], fcsr.flags[4:0], fcsr.rm };
		default: cpu_ret = 32'b0;
		endcase
	end
	default: cpu_ret = 32'b0;
	endcase
end

endmodule
