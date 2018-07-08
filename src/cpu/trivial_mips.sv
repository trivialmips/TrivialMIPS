`include "cpu_defs.svh"

module trivial_mips(
	input  clk, rst,
	Bus_if.master inst_bus,
	Bus_if.master data_bus 
);

Bit_t flush;
PipelineData_t data_id, data_idex;
PipelineData_t data_ex, data_exmem;
PipelineData_t data_mem;
PipelineReq_t req_id, req_idex;
PipelineReq_t req_ex, req_exmem;
PipelineReq_t req_mem, req_memwb;

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
RegAddr_t cp0_raddr;
RegWriteReq_t cp0_reg_wr;
Word_t cp0_rdata;
cp0 cp0_instance(
	.clk,
	.rst,
	.raddr(cp0_raddr),
	.wr(cp0_reg_wr),
	.except_req,
	.rdata(cp0_rdata),
	.regs(cp0_regs)
);

// stall control
Stall_t stall;
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
	.flush
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
	.if_delayslot(is_branch),
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

assign inst_pair_forward.inst1 = id_inst_pair.inst1;
assign inst_pair_forward.inst2 = id_inst_pair.inst2;
assign inst_pair_forward.inst2_taken = 1'b0;

// ID stage
cpu_id stage_id(
	.rst,
	.pc(id_pc),
	.inst_pair(id_inst_pair),
	.delayslot(id_delayslot),
	.reg1_i(reg_rdata1),
	.reg2_i(reg_rdata2),
	.reg_raddr1(reg_raddr1),
	.reg_raddr2(reg_raddr2),
	.stall_req(stall_from_id),
	.data_id,
	.req_id,
	// data forward
	.ex_memory_req(req_ex.memory_req),
	.mem_wr(req_mem.reg_wr),
	.ex_wr(req_ex.reg_wr)
);

branch branch_instance(
	.rst,
	.data_id,
	.is_branch,
	.jump,
	.jump_to
);

id_ex stage_id_ex(
	.clk,
	.rst,
	.id_data(data_id),
	.id_req(req_id),
	.ex_data(data_idex),
	.ex_req(req_idex),
	.stall,
	.flush
);

// EX stage
cpu_ex stage_ex(
	.clk,
	.rst,
	.flush,
	.hilo_unsafe(reg_hilo),
	.cp0_rdata_unsafe(cp0_rdata),
	.cp0_raddr(cp0_raddr),
	.stall_req(stall_from_ex),
	.mem_hilo_wr(req_mem.hilo_wr),
	.mem_cp0_reg_wr(req_mem.cp0_reg_wr),

	.data_idex(data_idex),
	.data_ex(data_ex),
	.req_idex(req_idex),
	.req_ex(req_ex)
);

ex_mem stage_ex_mem(
	.clk,
	.rst,
	.ex_data(data_ex),
	.ex_req(req_ex),
	.mem_data(data_exmem),
	.mem_req(req_exmem),
	.stall,
	.flush
);

// MEM stage
ExceptInfo_t mem_except_tmp;
Bit_t mem_llbit_reset;
cpu_mem stage_mem(
	.rst,
	.wr_i(req_exmem.reg_wr),
	.wr_o(req_mem.reg_wr),
	.op(data_exmem.op),
	.ll_bit(reg_llbit),
	.memory_req(req_mem.memory_req),
	.data_bus,
	.llbit_reset(mem_llbit_reset),
	.stall_req(stall_from_mem),
	.except(mem_except_tmp)
);

assign data_mem = data_exmem;
assign req_mem.llbit_set = req_exmem.llbit_set;
assign req_mem.memory_req = req_exmem.memory_req;
assign req_mem.hilo_wr = req_exmem.hilo_wr;
assign req_mem.cp0_reg_wr = req_exmem.cp0_reg_wr;
assign req_mem.except = req_exmem.except.occur ? req_exmem.except : mem_except_tmp;

except except_handler(
	.rst,
	.pc(data_mem.pc),
	.delayslot(data_mem.delayslot),
	.except(req_mem.except),
	.except_req,
	.cp0_regs
);

assign llbit_wr.we    = req_mem.llbit_set | mem_llbit_reset;
assign llbit_wr.wdata = { 30'b0, req_mem.llbit_set };

mem_wb stage_mem_wb(
	.clk,
	.rst,
	.mem_pc(data_mem.pc),
	.mem_cp0_reg_wr(req_mem.cp0_reg_wr),
	.mem_reg_wr(req_mem.reg_wr),
	.mem_hilo_wr(req_mem.hilo_wr),
	.wb_reg_wr(req_memwb.reg_wr),
	.wb_hilo_wr(req_memwb.hilo_wr),
	.wb_cp0_reg_wr(req_memwb.cp0_reg_wr),
	.stall,
	.flush
);

assign hilo_wr = req_memwb.hilo_wr;
assign cp0_reg_wr = req_memwb.cp0_reg_wr;

// WB stage
cpu_wb stage_wb(
	.rst,
	.wr_i(req_memwb.reg_wr),
	.wr_o(reg_wr1),
	.stall_req(stall_from_wb)
);

endmodule
