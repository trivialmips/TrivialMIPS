`include "cpu_defs.svh"

module trivial_mips(
	input  clk, rst,
	Bus_if.master inst_bus,
	Bus_if.master data_bus 
);

Bit_t flush;

// general registers
RegAddr_t reg_raddr1, reg_raddr2;
Word_t    reg_rdata1, reg_rdata2;
RegWriteReq_t reg_wr;

regs general_regs_instance(
	.clk,
	.rst,
	.wr(reg_wr),
	.raddr1(reg_raddr1),
	.raddr2(reg_raddr2),
	.rdata1(reg_rdata1),
	.rdata2(reg_rdata2)
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
InstAddr_t if_pc, jump_to;
Bit_t is_branch, jump;

reg_pc pc_instance(
	.clk,
	.rst,
	.pc(if_pc),
	.jump,
	.jump_to,
	.except_req,
	.hold_pc(stall.hold_pc)
);

cpu_if stage_if(
	.rst,
	.pc(if_pc),
	.inst_bus,
	.stall_req(stall_from_if)
);

Inst_t     id_inst;
InstAddr_t id_pc;
if_id stage_if_id(
	.clk,
	.rst,
	.if_pc,
	.if_delayslot(is_branch),
	.if_inst(inst_bus.data_rd), // TODO: use inst_bus.data_rd_2 for the second instruction
	.id_pc,
	.id_inst,
	.id_delayslot,
	.stall,
	.flush
);

// ID stage
Oper_t id_op;
Word_t id_reg1, id_reg2, id_imm;
Bit_t id_delayslot;
Bit_t id_reg_we;
RegAddr_t id_reg_waddr;
RegWriteReq_t ex_reg_wr;
RegWriteReq_t memwb_reg_wr;
MemAccessReq_t ex_memory_req;
ExceptInfo_t id_except;

cpu_id stage_id(
	.rst,
	.pc(id_pc),
	.inst(id_inst),
	.reg1_i(reg_rdata1),
	.reg2_i(reg_rdata2),
	.reg_raddr1,
	.reg_raddr2,
	.op(id_op),
	.reg1_o(id_reg1),
	.reg2_o(id_reg2),
	.imm_o(id_imm),
	.reg_we(id_reg_we),
	.reg_waddr(id_reg_waddr),
	.stall_req(stall_from_id),
	.except(id_except),
	// data forward
	.ex_memory_req,
	.mem_wr(memwb_reg_wr),
	.ex_wr(ex_reg_wr)
);

branch branch_instance(
	.rst,
	.pc(id_pc),
	.inst(id_inst),
	.reg1(id_reg1),
	.reg2(id_reg2),
	.is_branch,
	.jump,
	.jump_to
);

Bit_t  ex_delayslot;
Oper_t ex_op;
Word_t ex_reg1, ex_reg2, ex_imm;
Inst_t ex_inst;
InstAddr_t ex_pc;
ExceptInfo_t idex_except;

id_ex stage_id_ex(
	.clk,
	.rst,
	.id_op,
	.id_pc,
	.id_inst,
	.id_reg1,
	.id_reg2,
	.id_imm,
	.id_reg_we,
	.id_reg_waddr,
	.id_delayslot,
	.id_except,
	.ex_op,
	.ex_pc,
	.ex_inst,
	.ex_reg1,
	.ex_reg2,
	.ex_imm,
	.ex_delayslot,
	.ex_reg_we(ex_reg_wr.we),
	.ex_reg_waddr(ex_reg_wr.waddr),
	.ex_except(idex_except),
	.stall,
	.flush
);

// EX stage
HiloWriteReq_t ex_hilo_wr;
HiloWriteReq_t memwb_hilo_wr;
RegWriteReq_t mem_cp0_reg_wr;
RegWriteReq_t ex_cp0_reg_wr;
Bit_t ex_llbit_set;
ExceptInfo_t ex_except;
cpu_ex stage_ex(
	.clk,
	.rst,
	.op(ex_op),
	.pc(ex_pc),
	.flush,
	.inst(ex_inst),
	.reg1(ex_reg1),
	.reg2(ex_reg2),
	.imm(ex_imm),
	.hilo_unsafe(reg_hilo),
	.hilo_wr(ex_hilo_wr),
	.cp0_reg_wr(ex_cp0_reg_wr),
	.cp0_rdata_unsafe(cp0_rdata),
	.cp0_raddr(cp0_raddr),
	.llbit_set(ex_llbit_set),
	.memory_req(ex_memory_req),
	.ret(ex_reg_wr.wdata),
	.stall_req(stall_from_ex),
	.except(ex_except),
	.mem_hilo_wr(memwb_hilo_wr),
	.mem_cp0_reg_wr(mem_cp0_reg_wr)
);

Bit_t mem_delayslot;
Oper_t mem_op;
InstAddr_t mem_pc;
RegWriteReq_t mem_reg_wr;
Bit_t mem_llbit_set;
HiloWriteReq_t mem_hilo_wr;
MemAccessReq_t mem_memory_req;
ExceptInfo_t exmem_except;
ex_mem stage_ex_mem(
	.clk,
	.rst,
	.ex_pc,
	.ex_op,
	.ex_reg_wr,
	.ex_cp0_reg_wr,
	.ex_llbit_set,
	.ex_hilo_wr,
	.ex_memory_req,
	.ex_delayslot,
	.ex_except(idex_except.occur ? idex_except : ex_except),
	.mem_pc,
	.mem_op,
	.mem_reg_wr,
	.mem_llbit_set,
	.mem_hilo_wr,
	.mem_cp0_reg_wr,
	.mem_memory_req,
	.mem_delayslot,
	.mem_except(exmem_except),
	.stall,
	.flush
);

// MEM stage
ExceptInfo_t mem_except;
cpu_mem stage_mem(
	.rst,
	.wr_i(mem_reg_wr),
	.wr_o(memwb_reg_wr),
	.op(mem_op),
	.ll_bit(reg_llbit),
	.memory_req(mem_memory_req),
	.data_bus,
	.llbit_reset(mem_llbit_reset),
	.stall_req(stall_from_mem),
	.except(mem_except)
);

except except_handler(
	.rst,
	.pc(mem_pc),
	.delayslot(mem_delayslot),
	.except(exmem_except.occur ? exmem_except : mem_except),
	.except_req,
	.cp0_regs
);

assign memwb_hilo_wr = mem_hilo_wr;
assign llbit_wr.we    = mem_llbit_set | mem_llbit_reset;
assign llbit_wr.wdata = { 30'b0, mem_llbit_set };

RegWriteReq_t wb_reg_wr;
mem_wb stage_mem_wb(
	.clk,
	.rst,
	.mem_pc,
	.mem_cp0_reg_wr,
	.mem_reg_wr(memwb_reg_wr),
	.mem_hilo_wr(memwb_hilo_wr),
	.wb_reg_wr,
	.wb_hilo_wr(hilo_wr),
	.wb_cp0_reg_wr(cp0_reg_wr),
	.stall,
	.flush
);

// WB stage
cpu_wb stage_wb(
	.rst,
	.wr_i(wb_reg_wr),
	.wr_o(reg_wr),
	.stall_req(stall_from_wb)
);

endmodule
