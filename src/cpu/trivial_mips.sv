`include "cpu_defs.svh"

module trivial_mips(
	input  clk, rst,
	// assume ibus can return data in one clock.
	output WishboneReq_t ibus_req,
	input  WishboneRes_t ibus_res,
	output WishboneReq_t dbus_req,
	input  WishboneRes_t dbus_res
);

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

// IF stage
InstAddr_t if_pc, jump_to;
Bit_t is_branch, jump;

reg_pc pc_instance(
	.clk,
	.rst,
	.pc(if_pc),
	.jump,
	.jump_to
);

cpu_if stage_if(
	.rst,
	.pc(if_pc),
	.ibus(ibus_req)
);

Inst_t     id_inst;
InstAddr_t id_pc;
if_id stage_if_id(
	.clk,
	.rst,
	.if_pc,
	.if_inst(ibus_res.data),
	.id_pc,
	.id_inst
);

// ID stage
Oper_t id_op;
Word_t id_reg1, id_reg2;
Word_t safe_rs, safe_rt;
Bit_t id_reg_we;
RegAddr_t id_reg_waddr;
RegWriteReq_t ex_reg_wr;
RegWriteReq_t memwb_reg_wr;

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
	.safe_rs,
	.safe_rt,
	.reg_we(id_reg_we),
	.reg_waddr(id_reg_waddr),
	// data forward
	.mem_wr(memwb_reg_wr),
	.ex_wr(ex_reg_wr)
);

branch branch_instance(
	.rst,
	.pc(id_pc),
	.inst(id_inst),
	.rs(safe_rs),
	.rt(safe_rt),
	.is_branch,
	.jump,
	.jump_to
);

Oper_t ex_op;
Word_t ex_reg1, ex_reg2;
InstAddr_t ex_pc;

id_ex stage_id_ex(
	.clk,
	.rst,
	.id_op,
	.id_pc,
	.id_reg1,
	.id_reg2,
	.id_reg_we,
	.id_reg_waddr,
	.ex_op,
	.ex_pc,
	.ex_reg1,
	.ex_reg2,
	.ex_reg_we(ex_reg_wr.we),
	.ex_reg_waddr(ex_reg_wr.waddr)
);

// EX stage
cpu_ex stage_ex(
	.rst,
	.op(ex_op),
	.pc(ex_pc),
	.reg1(ex_reg1),
	.reg2(ex_reg2),
	.ret(ex_reg_wr.wdata)
);

RegWriteReq_t mem_reg_wr;
ex_mem stage_ex_mem(
	.clk,
	.rst,
	.ex_wr(ex_reg_wr),
	.mem_wr(mem_reg_wr)
);

// MEM stage
cpu_mem stage_mem(
	.rst,
	.wr_i(mem_reg_wr),
	.wr_o(memwb_reg_wr)
);

RegWriteReq_t wb_reg_wr;
mem_wb stage_mem_wb(
	.clk,
	.rst,
	.mem_wr(memwb_reg_wr),
	.wb_wr(wb_reg_wr)
);

// WB stage
cpu_wb stage_wb(
	.clk,
	.rst,
	.wr_i(wb_reg_wr),
	.wr_o(reg_wr)
);

endmodule
