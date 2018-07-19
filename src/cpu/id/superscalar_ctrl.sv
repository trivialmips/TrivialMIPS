`include "cpu_defs.svh"

module superscalar_ctrl(
	input  rst, ena,

	input  PipelineData_t data_a,
	input  PipelineData_t data_b,
	input  PipelineReq_t  req_a,
	input  PipelineReq_t  req_b,

	output Bit_t inst2_taken
);

function is_read_memory_inst(input Oper_t op);
	is_read_memory_inst = (
		op == OP_LB || op == OP_LBU || op == OP_LH || op == OP_LHU ||
		op == OP_LW || op == OP_LWL || op == OP_LWR || op == OP_LL ||
		op == OP_LWC1
	);
endfunction

function is_write_memory_inst(input Oper_t op);
	is_write_memory_inst = (
		op == OP_SB || op == OP_SH || op == OP_SW ||
		op == OP_SWL || op == OP_SWR || op == OP_SC ||
		op == OP_SWC1
	);
endfunction

function is_jump_inst(input Oper_t op);
	is_jump_inst = (
		op == OP_BEQ || op == OP_BGEZ || op == OP_BGEZAL ||
		op == OP_BGTZ || op == OP_BLEZ || op == OP_BLTZ ||
		op == OP_BLTZAL || op == OP_BNE || op == OP_J ||
		op == OP_JAL || op == OP_JALR || op == OP_JR ||
		op == OP_BC1
	);
endfunction

function is_cond_move_inst(input Oper_t op);
	is_cond_move_inst = (
		op == OP_MOVZ || op == OP_MOVN
	);
endfunction

function is_privileged_inst(input Oper_t op);
	is_privileged_inst = (
		op == OP_CACHE || op == OP_ERET || op == OP_MFC0 ||
		op == OP_MTC0 || op == OP_TLBP || op == OP_TLBR ||
		op == OP_TLBWI || op == OP_TLBWR || op == OP_WAIT
	);
endfunction

Bit_t read_memory_a, read_memory_b;
assign read_memory_a = is_read_memory_inst(data_a.op);
assign read_memory_b = is_read_memory_inst(data_b.op);

Bit_t write_memory_a, write_memory_b;
assign write_memory_a = is_write_memory_inst(data_a.op);
assign write_memory_b = is_write_memory_inst(data_b.op);

Bit_t memory_inst_a, memory_inst_b;
assign memory_inst_a = read_memory_a | write_memory_a;
assign memory_inst_b = read_memory_b | write_memory_b;

Bit_t privileged_inst_a, privileged_inst_b;
assign privileged_inst_a = is_privileged_inst(data_a.op);
assign privileged_inst_b = is_privileged_inst(data_b.op);

Bit_t jump_inst_a, jump_inst_b;
assign jump_inst_a = is_jump_inst(data_a.op);
assign jump_inst_b = is_jump_inst(data_b.op);

Bit_t cond_move_inst_a, cond_move_inst_b;
assign cond_move_inst_a = is_cond_move_inst(data_a.op);
assign cond_move_inst_b = is_cond_move_inst(data_b.op);

Bit_t fpu_inst_a, fpu_inst_b;
assign fpu_inst_a = (data_a.fpu_op != FPU_OP_INVALID);
assign fpu_inst_b = (data_b.fpu_op != FPU_OP_INVALID);

Bit_t reg_data_related;
assign reg_data_related = (
    req_a.reg_wr.we &&
    req_a.reg_wr.waddr != 5'b0 &&
    ( req_a.reg_wr.waddr == data_b.reg_addr1 ||
      req_a.reg_wr.waddr == data_b.reg_addr2 )
);

// TODO: SSNOP ?

always_comb
begin
	if(rst || ~ena)
	begin
		inst2_taken = 1'b0;
	end else begin
		if(data_a.op == OP_SSNOP || data_b.op == OP_SSNOP)
		begin
			// SSNOP is used to break the superscalar issue.
			inst2_taken = 1'b0;
		end else if(fpu_inst_b) begin
			inst2_taken = 1'b0;
		end else if(cond_move_inst_b && reg_data_related) begin
			// data is required at ID stage, but arrived at EX stage.
			inst2_taken = 1'b0;
		end else if(jump_inst_b) begin
			// only pipe-a can have jump instructions
			inst2_taken = 1'b0;
		end else if(jump_inst_a) begin
			// the delayslot instruction is executed in pipe-a
			inst2_taken = 1'b0;
		end else if(data_a.delayslot) begin
			// if the branch is taken, the delayslot must be executed alone
			// TODO: this is correct, but we can check whether the branch is
			//       taken to optimize the pipeline.
			inst2_taken = 1'b0;
		end else if(memory_inst_a && memory_inst_b) begin
			// only one memory instruction can be executed.
			inst2_taken = 1'b0;
		end else if(read_memory_a && reg_data_related) begin
			// load-related
			// data will arrive at MEM stage, but required at ID stage.
			inst2_taken = 1'b0;
		end else if(privileged_inst_b || privileged_inst_a) begin
			// privileged instructions
			// only pipeline-A can access CP0, for timing optimization
			inst2_taken = 1'b0;
		end else if(data_a.op == OP_MUL && reg_data_related) begin
			// MUL requires two cycles
			inst2_taken = 1'b0;
		end else if((data_b.pc & 12'hfff) == 12'b0) begin
			// two address may belong to different TLB
			inst2_taken = 1'b0;
		end else begin
			// otherwise
			inst2_taken = 1'b1;
		end
	end
end

endmodule
