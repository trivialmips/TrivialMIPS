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
Bit_t     reg_we;
RegAddr_t reg_waddr, reg_raddr1, reg_raddr2;
Word_t    reg_wdata, reg_rdata1, reg_rdata2;

regs general_regs_instance(
	.clk,
	.rst,
	.we(reg_we),
	.waddr(reg_waddr),
	.wdata(reg_wdata),
	.raddr1(reg_raddr1),
	.raddr2(reg_raddr2),
	.rdata1(reg_rdata1),
	.rdata2(reg_rdata2)
);

// IF stage
InstAddr_t if_pc;

reg_pc pc_instance(
	.clk,
	.rst,
	.pc(if_pc)
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
Bit_t id_reg_we;
RegAddr_t id_reg_waddr;

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
	.reg_we(id_reg_we),
	.reg_waddr(id_reg_waddr)
);

Oper_t ex_op;
Word_t ex_reg1, ex_reg2;
Bit_t ex_reg_we;
RegAddr_t ex_reg_waddr;

id_ex stage_id_ex(
	.clk,
	.rst,
	.id_op,
	.id_reg1,
	.id_reg2,
	.id_reg_we,
	.id_reg_waddr,
	.ex_op,
	.ex_reg1,
	.ex_reg2,
	.ex_reg_we,
	.ex_reg_waddr
);

// EX stage
Word_t ex_ret;
cpu_ex stage_ex(
	.rst,
	.op(ex_op),
	.reg1(ex_reg1),
	.reg2(ex_reg2),
	.ret(ex_ret)
);

Bit_t      mem_reg_we;
RegAddr_t  mem_reg_waddr;
Word_t     mem_reg_wdata;
ex_mem stage_ex_mem(
	.clk,
	.rst,
	.ex_reg_we,
	.ex_reg_waddr,
	.ex_reg_wdata(ex_ret),
	.mem_reg_we,
	.mem_reg_waddr,
	.mem_reg_wdata
);

// MEM stage
Bit_t      memwb_reg_we;
RegAddr_t  memwb_reg_waddr;
Word_t     memwb_reg_wdata;
cpu_mem stage_mem(
	.rst,
	.we_i(mem_reg_we),
	.waddr_i(mem_reg_waddr),
	.wdata_i(mem_reg_wdata),

	.we_o(memwb_reg_we),
	.waddr_o(memwb_reg_waddr),
	.wdata_o(memwb_reg_wdata)
);

Bit_t      wb_reg_we;
RegAddr_t  wb_reg_waddr;
Word_t     wb_reg_wdata;
mem_wb stage_mem_wb(
	.clk,
	.rst,
	.mem_reg_we(memwb_reg_we),
	.mem_reg_waddr(memwb_reg_waddr),
	.mem_reg_wdata(memwb_reg_wdata),
	.wb_reg_we(wb_reg_we),
	.wb_reg_waddr(wb_reg_waddr),
	.wb_reg_wdata(wb_reg_wdata)
);

// WB stage
cpu_wb stage_wb(
	.clk,
	.rst,
	.we_i(wb_reg_we),
	.waddr_i(wb_reg_waddr),
	.wdata_i(wb_reg_wdata),
	.we_o(reg_we),
	.waddr_o(reg_waddr),
	.wdata_o(reg_wdata)
);

endmodule
