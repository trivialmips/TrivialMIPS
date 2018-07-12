`include "cpu_defs.svh"

module trivial_mips(
	Bus_if.master inst_bus,
	Bus_if.master data_bus
);

parameter mmu_enabled = 1;

wire clk, rst;
assign clk = inst_bus.clk.base;
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
RegAddr_t cp0_raddr;
logic [2:0] cp0_rsel;
CP0RegWriteReq_t cp0_reg_wr;
Word_t cp0_rdata;
logic [7:0] cp0_asid;
Bit_t cp0_user_mode;
TLBEntry_t tlbrw_rdata;
Word_t tlbp_index;
cp0 cp0_instance(
	.clk,
	.rst,
	.raddr(cp0_raddr),
	.rsel(cp0_rsel),
	.wr(cp0_reg_wr),
	.except_req,
	.int_req(data_bus.interrupt),

	.tlbp_req(req_memwb_a.tlbp),
	.tlbp_res(tlbp_index),
	.tlbr_req(req_memwb_a.tlb_read),
	.tlbr_res(tlbrw_rdata),

	.rdata(cp0_rdata),
	.regs(cp0_regs),
	.asid(cp0_asid),
	.user_mode(cp0_user_mode)
);

// MMU
InstAddr_t mmu_inst_vaddr;
MemAddr_t  mmu_data_vaddr;
MMUResult_t mmu_inst_result, mmu_data_result;
TLBIndex_t tlbrw_index;
Bit_t tlbrw_we;
TLBEntry_t tlbrw_wdata;
mmu #(
	.mmu_enabled(mmu_enabled)
) mmu_instance (
	.clk,
	.rst,
	.asid(cp0_asid),
	.is_user_mode(cp0_user_mode),
	.inst_vaddr(mmu_inst_vaddr),
	.data_vaddr(mmu_data_vaddr),
	.inst_result(mmu_inst_result),
	.data_result(mmu_data_result),

	.tlbrw_index,
	.tlbrw_we,
	.tlbrw_wdata,
	.tlbrw_rdata,

	.tlbp_entry_hi(cp0_regs.entry_hi),
	.tlbp_index
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
Bit_t is_branch, jump, pc_ce;
Bit_t is_pc_ahead, is_pc_hard_reset;

reg_pc pc_instance(
	.clk,
	.rst,
	.pc(if_pc),
	.inst2_taken(inst_pair_forward.inst2_taken),
	.jump,
	.jump_to,
	.except_req,
	.ce(pc_ce),
	.is_ahead(is_pc_ahead),
	.is_hard_reset(is_pc_hard_reset),
	.hold_pc(stall.hold_pc)
);

ExceptInfo_t if_except;
cpu_if stage_if(
	.rst,
	.pc(if_pc),
	.pc_ce,
	.mmu_inst_result,
	.mmu_inst_vaddr,
	.inst_bus,
	.except(if_except),
	.stall_req(stall_from_if)
);

assign if_inst_pair.inst1 = inst_bus.data_rd;
assign if_inst_pair.inst2 = inst_bus.data_rd_2;

ExceptInfo_t ifid_except;
Bit_t      id_inst_left, ifid_keep_inst, ifid_set_empty_inst;
InstPair_t id_inst_pair_old, id_inst_pair_new;
InstPair_t id_inst_pair;
InstAddr_t id_pc;
Bit_t      id_delayslot;
if_id stage_if_id(
	.clk,
	.rst,
	.if_pc,
	.if_except,
	.if_delayslot(is_branch & ~inst_pair_forward.inst2_taken),
	.if_inst_pair,
	.id_pc,
	.id_except(ifid_except),
	.id_inst_left,
	.id_inst_pair_new,
	.id_inst_pair_old,
	.id_delayslot,
	.keep_inst(ifid_keep_inst),
	.set_empty_inst(ifid_set_empty_inst),
	.inst_pair_forward,
	.is_ahead(is_pc_ahead),
	.is_hard_reset(is_pc_hard_reset),
	.stall,
	.flush
);

always_comb
begin
	id_inst_pair.inst2_taken = 1'b0;  // not used for now
	if(ifid_set_empty_inst)
	begin
		id_inst_pair.inst1 = `ZERO_WORD;
		id_inst_pair.inst2 = `ZERO_WORD;
	end else if(ifid_keep_inst) begin
		id_inst_pair = id_inst_pair_old;
	end else begin
		if(id_inst_left) 
		begin
			id_inst_pair.inst1 = id_inst_pair_old.inst2;
			id_inst_pair.inst2 = id_inst_pair_new.inst1;
		end else begin
			id_inst_pair = id_inst_pair_new;
		end
	end
end

Bit_t stall_from_id_a, stall_from_id_b;
assign stall_from_id = stall_from_id_a | stall_from_id_b;

// ID stage
cpu_id stage_id_a(
	.rst,
	.pc(id_pc),
	.inst(id_inst_pair.inst1),
	.delayslot(id_delayslot),
	.ifid_except(ifid_except),
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
	.ifid_except(ifid_except),
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

CP0RegWriteReq_t empty_cp0_reg_wr;
RegWriteReq_t empty_reg_wr;
HiloWriteReq_t empty_hilo_wr;
assign empty_reg_wr     = {$bits(RegWriteReq_t){1'b0}};
assign empty_hilo_wr    = {$bits(HiloWriteReq_t){1'b0}};
assign empty_cp0_reg_wr = {$bits(CP0RegWriteReq_t){1'b0}};

cpu_ex stage_ex_a(
	.clk,
	.rst,
	.flush,
	.hilo_unsafe(reg_hilo),
	.cp0_rdata_unsafe(cp0_rdata),
	.cp0_raddr(cp0_raddr),
	.cp0_rsel(cp0_rsel),
	.stall_req(stall_from_ex_a),

	.data_idex(data_idex_a),
	.data_ex(data_ex_a),
	.req_idex(req_idex_a),
	.req_ex(req_ex_a),

	.mem_hilo_wr_a(req_mem_a.hilo_wr),
	.mem_hilo_wr_b(req_mem_b.hilo_wr),
	.mem_cp0_reg_wr(req_mem_a.cp0_reg_wr),
	.wb_cp0_reg_wr(cp0_reg_wr),

	.ex_hilo_wr_a(empty_hilo_wr),
	.ex_reg_wr_a(empty_reg_wr)
);

cpu_ex stage_ex_b(
	.clk,
	.rst,
	.flush,
	.hilo_unsafe(reg_hilo),
	// only pipe-a will read CP0
	.cp0_rdata_unsafe(`ZERO_WORD),
	.cp0_raddr(),
	.cp0_rsel(),
	.stall_req(stall_from_ex_b),

	.data_idex(data_idex_b),
	.data_ex(data_ex_b),
	.req_idex(req_idex_b),
	.req_ex(req_ex_b),

	.mem_hilo_wr_a(req_mem_a.hilo_wr),
	.mem_hilo_wr_b(req_mem_b.hilo_wr),
	.mem_cp0_reg_wr(empty_cp0_reg_wr),
	.wb_cp0_reg_wr(cp0_reg_wr),

	.ex_hilo_wr_a(req_ex_a.hilo_wr),
	.ex_reg_wr_a(req_ex_a.reg_wr)
);

// early lookup TLB
assign mmu_data_vaddr = req_ex_b.memory_req.ce ?
	req_ex_b.memory_req.addr : req_ex_a.memory_req.addr;

MMUResult_t mem_mmu_data_result;
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

	.ex_mmu_data_result(mmu_data_result),
	.mem_mmu_data_result,

	.stall,
	.flush
);

// MEM stage
Bit_t mem_llbit_reset, memory_data_we;
cpu_mem stage_mem(
	.rst,
	.ll_bit(reg_llbit),
	.data_ex_a(data_exmem_a),
	.data_ex_b(data_exmem_b),
	.req_ex_a(req_exmem_a),
	.req_ex_b(req_exmem_b),
	.req_mem_a(req_mem_a),
	.req_mem_b(req_mem_b),
	.mmu_data_result(mem_mmu_data_result),
//	.except_already_occur(req_exmem_a.except.occur | req_exmem_b.except.occur),
	.except_already_occur(flush),
	.data_bus,
	.memory_data_we,
	.llbit_reset(mem_llbit_reset),
	.stall_req(stall_from_mem)
);

assign data_mem_a = data_exmem_a;
assign data_mem_b = data_exmem_b;

except except_handler(
	.rst,
	.data_a(data_mem_a),
	.data_b(data_mem_b),
	.except_a(req_mem_a.except),
	.except_b(req_mem_b.except),
	.except_req,
	.memory_data_we,
	.data_vaddr(mem_mmu_data_result.virt_addr),
	.cp0_regs_unsafe(cp0_regs),
	.is_user_mode(cp0_user_mode),
	.wb_cp0_reg_wr(cp0_reg_wr)
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

assign tlbrw_we = (req_memwb_a.tlb_wi | req_memwb_a.tlb_wr);
assign tlbrw_index = req_memwb_a.tlb_wi ? cp0_regs.index : cp0_regs.random;
assign tlbrw_wdata.vpn2 = cp0_regs.entry_hi[31:13];
assign tlbrw_wdata.asid = cp0_regs.entry_hi[7:0];
assign tlbrw_wdata.pfn1 = cp0_regs.entry_lo1[29:6];
assign tlbrw_wdata.c1   = cp0_regs.entry_lo1[5:3];
assign tlbrw_wdata.d1   = cp0_regs.entry_lo1[2];
assign tlbrw_wdata.v1   = cp0_regs.entry_lo1[1];
assign tlbrw_wdata.pfn0 = cp0_regs.entry_lo0[29:6];
assign tlbrw_wdata.c0   = cp0_regs.entry_lo0[5:3];
assign tlbrw_wdata.d0   = cp0_regs.entry_lo0[2];
assign tlbrw_wdata.v0   = cp0_regs.entry_lo0[1];
assign tlbrw_wdata.G    = cp0_regs.entry_lo0[0];

endmodule
