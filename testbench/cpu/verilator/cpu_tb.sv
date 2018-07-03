`include "cpu_defs.svh"
`timescale 1ns/1ps

module cpu_tb(rst, clk);

input rst;
input clk;

WishboneReq_t ibus_req, dbus_req;
WishboneRes_t ibus_res, dbus_res;

inst_ibus ibus_instance(
	.rst,
	.ibus_req,
	.ibus_res
);

trivial_mips trivial_cpu_instance(
        .clk,
	.rst,
	.ibus_req,
	.ibus_res,
	.dbus_req,
	.dbus_res
);

endmodule
