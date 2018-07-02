`include "cpu_defs.svh"

module trivial_mips(
	input  clk, rst,
	// assume ibus can return data in one clock.
	output WishboneReq_t ibus_req,
	input  WishboneRes_t ibus_res,
	output WishboneReq_t dbus_req,
	input  WishboneRes_t dbus_res
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

endmodule
