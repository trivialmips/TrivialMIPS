`include "cpu_defs.svh"

module trivial_mips(
	Bus_if.master inst_bus,
	Bus_if.master data_bus 
);

wire clk, rst;
assign clk = inst_bus.clk._50M;
assign rst = inst_bus.clk.rst;

Bit_t flush;
PipelineData_t data_id_a, data_idex_a;
PipelineData_t data_ex_a, data_exmem_a;
PipelineData_t data_mem_a;
PipelineReq_t req_id_a, req_idex_a;
PipelineReq_t req_ex_a, req_exmem_a;
PipelineReq_t req_mem_a, req_memwb_a;

PipelineData_t data_id_b, data_idex_b;
PipelineData_t data_ex_b, data_exmem_b;
PipelineData_t data_mem_b;
PipelineReq_t req_id_b, req_idex_b;
PipelineReq_t req_ex_b, req_exmem_b;
PipelineReq_t req_mem_b, req_memwb_b;

// general registers
RegAddr_t reg_raddr1, reg_raddr2, reg_raddr3, reg_raddr4;
Word_t    reg_rdata1, reg_rdata2, reg_rdata3, reg_rdata4;
RegWriteReq_t reg_wr1, reg_wr2;

regs general_regs_instance(
	.clk,
	.rst,
	.wr1(reg_wr1),
	.wr2(reg_wr2),
	.raddr1(reg_raddr1),
	.raddr2(reg_raddr2),
	.rdata1(reg_rdata1),
	.rdata2(reg_rdata2),
	.raddr3(reg_raddr3),
	.raddr4(reg_raddr4),
	.rdata3(reg_rdata3),
	.rdata4(reg_rdata4)
);

// HILO registers
HiloWriteReq_t hilo_wr;
DoubleWord_t reg_hilo;
hilo hilo_instance(
	.clk,
	.rst,
	.wr(hilo_wr),
	.hilo(reg_hilo)
);

// LLbit register
RegWriteReq_t llbit_wr;
Bit_t reg_llbit;
ll_bit_reg ll_bit_instance(
	.clk,
	.rst(rst),
	.flush,
	.wr(llbit_wr),
	.ll_bit(reg_llbit)
);

// coprocesser 0
ExceptReq_t except_req;
CP0Regs_t cp0_regs;
RegAddr_t cp0_raddr1, cp0_raddr2;
RegWriteReq_t cp0_reg_wr;
Word_t cp0_rdata1, cp0_rdata2;
cp0 cp0_instance(
	.clk,
	.rst,
	.raddr1(cp0_raddr1),
	.raddr2(cp0_raddr2),
	.wr(cp0_reg_wr),
	.except_req,
	.rdata1(cp0_rdata1),
	.rdata2(cp0_rdata2),
	.regs(cp0_regs)
);

// stall control
Stall_t stall;
Bit_t flush_caused_by_alpha;
Bit_t stall_from_if;
Bit_t stall_from_id;
Bit_t stall_from_mem;
Bit_t stall_from_ex;
Bit_t stall_from_wb;
ctrl ctrl_instance(
	.rst,
	.stall_from_if,
	.stall_from_id,
	.stall_from_ex,
	.stall_from_mem,
	.stall_from_wb,
	.stall,
	.except_req,
	.flush,
	.flush_caused_by_alpha
);

// IF stage
InstPair_t if_inst_pair;
InstPair_t inst_pair_forward;
InstAddr_t if_pc, jump_to;
Bit_t is_branch, jump;
Bit_t is_pc_ahead, is_pc_hard_reset;

reg_pc pc_instance(
	.clk,
	.rst,
	.pc(if_pc),
	.inst2_taken(inst_pair_forward.inst2_taken),
	.jump,
	.jump_to,
	.except_req,
	.is_ahead(is_pc_ahead),
	.is_hard_reset(is_pc_hard_reset),
	.hold_pc(stall.hold_pc)
);

cpu_if stage_if(
	.rst,
	.pc(if_pc),
	.inst_bus,
	.stall_req(stall_from_if)
);

assign if_inst_pair.inst1 = inst_bus.data_rd;
assign if_inst_pair.inst2 = inst_bus.data_rd_2;

InstPair_t id_inst_pair;
InstAddr_t id_pc;
Bit_t      id_delayslot;
if_id stage_if_id(
	.clk,
	.rst,
	.if_pc,
	.if_delayslot(is_branch & ~inst_pair_forward.inst2_taken),
	.if_inst_pair,
	.id_pc,
	.id_inst_pair,
	.id_delayslot,
	.inst_pair_forward,
	.is_ahead(is_pc_ahead),
	.is_hard_reset(is_pc_hard_reset),
	.stall,
	.flush
);

Bit_t stall_from_id_a, stall_from_id_b;
assign stall_from_id = stall_from_id_a | stall_from_id_b;

// ID stage
cpu_id stage_id_a(
	.rst,
	.pc(id_pc),
	.inst(id_inst_pair.inst1),
	.delayslot(id_delayslot),
	.reg1_i(reg_rdata1),
	.reg2_i(reg_rdata2),
	.reg_raddr1(reg_raddr1),
	.reg_raddr2(reg_raddr2),
	.stall_req(stall_from_id_a),
	.data_id(data_id_a),
	.req_id(req_id_a),
	// data forward
	.ex_memory_req_a(req_ex_a.memory_req),
	.ex_memory_req_b(req_ex_b.memory_req),
	.mem_wr_a(req_mem_a.reg_wr),
	.mem_wr_b(req_mem_b.reg_wr),
	.ex_wr_a(req_ex_a.reg_wr),
	.ex_wr_b(req_ex_b.reg_wr)
);

cpu_id stage_id_b(
	.rst,
	.pc(id_pc + 32'h4),
	.inst(id_inst_pair.inst2),
	.delayslot(1'b0),    // both jump and delayslot will be in pipe-a.
	.reg1_i(reg_rdata3),
	.reg2_i(reg_rdata4),
	.reg_raddr1(reg_raddr3),
	.reg_raddr2(reg_raddr4),
	.stall_req(stall_from_id_b),
	.data_id(data_id_b),
	.req_id(req_id_b),
	// data forward
	.ex_memory_req_a(req_ex_a.memory_req),
	.ex_memory_req_b(req_ex_b.memory_req),
	.mem_wr_a(req_mem_a.reg_wr),
	.mem_wr_b(req_mem_b.reg_wr),
	.ex_wr_a(req_ex_a.reg_wr),
	.ex_wr_b(req_ex_b.reg_wr)
);

// Only pipe-alpha can have jump instructions
branch branch_instance(
	.rst,
	.data_id(data_id_a),
	.is_branch,
	.jump,
	.jump_to
);

assign inst_pair_forward.inst1 = id_inst_pair.inst1;
assign inst_pair_forward.inst2 = id_inst_pair.inst2;
superscalar_ctrl superscalar_ctrl_instance(
	.rst,
	.ena(1'b1),
	.data_a(data_id_a),
	.data_b(data_id_b),
	.req_a(req_id_a),
	.req_b(req_id_b),
	.inst2_taken(inst_pair_forward.inst2_taken)
);

id_ex stage_id_ex(
	.clk,
	.rst,
	.id_data_a(data_id_a),
	.id_data_b(data_id_b),
	.id_req_a(req_id_a),
	.id_req_b(req_id_b),
	.ex_data_a(data_idex_a),
	.ex_data_b(data_idex_b),
	.ex_req_a(req_idex_a),
	.ex_req_b(req_idex_b),
	.inst2_taken(inst_pair_forward.inst2_taken),
	.stall,
	.flush
);

// EX stage
Bit_t stall_from_ex_a, stall_from_ex_b;
assign stall_from_ex = stall_from_ex_a | stall_from_ex_b;

RegWriteReq_t empty_reg_wr;
HiloWriteReq_t empty_hilo_wr;
assign empty_hilo_wr.we   = 1'b0;
assign empty_hilo_wr.hilo = 'b0;
assign empty_reg_wr.we    = 1'b0;
assign empty_reg_wr.waddr = 'b0;
assign empty_reg_wr.wdata = 'b0;

cpu_ex stage_ex_a(
	.clk,
	.rst,
	.flush,
	.hilo_unsafe(reg_hilo),
	.cp0_rdata_unsafe(cp0_rdata1),
	.cp0_raddr(cp0_raddr1),
	.stall_req(stall_from_ex_a),

	.data_idex(data_idex_a),
	.data_ex(data_ex_a),
	.req_idex(req_idex_a),
	.req_ex(req_ex_a),

	.mem_hilo_wr_a(req_mem_a.hilo_wr),
	.mem_hilo_wr_b(req_mem_b.hilo_wr),
	.mem_cp0_reg_wr_a(req_mem_a.cp0_reg_wr),
	.mem_cp0_reg_wr_b(req_mem_b.cp0_reg_wr),

	.ex_hilo_wr_a(empty_hilo_wr),
	.ex_reg_wr_a(empty_reg_wr)
);

cpu_ex stage_ex_b(
	.clk,
	.rst,
	.flush,
	.hilo_unsafe(reg_hilo),
	.cp0_rdata_unsafe(cp0_rdata2),
	.cp0_raddr(cp0_raddr2),
	.stall_req(stall_from_ex_b),

	.data_idex(data_idex_b),
	.data_ex(data_ex_b),
	.req_idex(req_idex_b),
	.req_ex(req_ex_b),

	.mem_hilo_wr_a(req_mem_a.hilo_wr),
	.mem_hilo_wr_b(req_mem_b.hilo_wr),
	.mem_cp0_reg_wr_a(req_mem_a.cp0_reg_wr),
	.mem_cp0_reg_wr_b(req_mem_b.cp0_reg_wr),

	.ex_hilo_wr_a(req_ex_a.hilo_wr),
	.ex_reg_wr_a(req_ex_a.reg_wr)
);

ex_mem stage_ex_mem(
	.clk,
	.rst,
	.ex_data_a(data_ex_a),
	.ex_data_b(data_ex_b),
	.ex_req_a(req_ex_a),
	.ex_req_b(req_ex_b),
	.mem_data_a(data_exmem_a),
	.mem_data_b(data_exmem_b),
	.mem_req_a(req_exmem_a),
	.mem_req_b(req_exmem_b),
	.stall,
	.flush
);

// MEM stage
ExceptInfo_t mem_except_tmp;
Bit_t mem_llbit_reset, mem_alpha_taken;
cpu_mem stage_mem(
	.rst,
	.wr_a_i(req_exmem_a.reg_wr),
	.wr_b_i(req_exmem_b.reg_wr),
	.wr_a_o(req_mem_a.reg_wr),
	.wr_b_o(req_mem_b.reg_wr),
	.op_a(data_exmem_a.op),
	.op_b(data_exmem_b.op),
	.ll_bit(reg_llbit),
	.memory_req_a(req_mem_a.memory_req),
	.memory_req_b(req_mem_b.memory_req),
	.data_bus,
	.llbit_reset(mem_llbit_reset),
	.stall_req(stall_from_mem),
	.alpha_taken(mem_alpha_taken),
	.except(mem_except_tmp)
);

assign data_mem_a = data_exmem_a;
assign data_mem_b = data_exmem_b;

assign req_mem_a.llbit_set  = req_exmem_a.llbit_set;
assign req_mem_a.memory_req = req_exmem_a.memory_req;
assign req_mem_a.hilo_wr    = req_exmem_a.hilo_wr;
assign req_mem_a.cp0_reg_wr = req_exmem_a.cp0_reg_wr;

assign req_mem_b.llbit_set  = req_exmem_b.llbit_set;
assign req_mem_b.memory_req = req_exmem_b.memory_req;
assign req_mem_b.hilo_wr    = req_exmem_b.hilo_wr;
assign req_mem_b.cp0_reg_wr = req_exmem_b.cp0_reg_wr;

always_comb
begin
	if(mem_alpha_taken)
	begin
		req_mem_b.except = req_exmem_b.except;
		req_mem_a.except = req_exmem_a.except.occur ? req_exmem_a.except : mem_except_tmp;
	end else begin
		req_mem_a.except = req_exmem_a.except;
		req_mem_b.except = req_exmem_b.except.occur ? req_exmem_b.except : mem_except_tmp;
	end
end

except except_handler(
	.rst,
	.pc_a(data_mem_a.pc),
	.pc_b(data_mem_b.pc),
	.delayslot_a(data_mem_a.delayslot),
	.delayslot_b(data_mem_b.delayslot),
	.except_a(req_mem_a.except),
	.except_b(req_mem_b.except),
	.except_req,
	.cp0_regs
);

assign llbit_wr.we = req_mem_a.llbit_set | req_mem_b.llbit_set | mem_llbit_reset;
assign llbit_wr.wdata = { 30'b0, req_mem_a.llbit_set | req_mem_b.llbit_set };

mem_wb stage_mem_wb(
	.clk,
	.rst,
	.mem_req_a(req_mem_a),
	.mem_req_b(req_mem_b),
	.wb_req_a(req_memwb_a),
	.wb_req_b(req_memwb_b),
	.stall,
	.flush,
	.flush_caused_by_alpha
);

// WB stage
cpu_wb stage_wb(
	.rst,
	.req_a(req_memwb_a),
	.req_b(req_memwb_b),

	.reg_wr1,
	.reg_wr2,
	.hilo_wr,
	.cp0_reg_wr,

	.stall_req(stall_from_wb)
);

endmodule
