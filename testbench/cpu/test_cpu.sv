`include "cpu_defs.svh"
`timescale 1ns/1ps

module test_cpu_tb();

reg clk50M;
reg rst;

initial begin
	clk50M = 1'b0;
end

always #10 clk50M = ~clk50M;

initial begin
	rst = 1'b1;
	#190 rst = 1'b0;
	#1000 $stop;
end

WishboneReq_t ibus_req, dbus_req;
WishboneRes_t ibus_res, dbus_res;

inst_ibus ibus_instance(
	.rst,
	.ibus_req,
	.ibus_res
);

inst_dbus dbus_instance(
	.clk(clk50M),
	.rst,
	.dbus_req,
	.dbus_res
);

trivial_mips trivial_cpu_instance(
	.clk(clk50M),
	.rst,
	.ibus_req,
	.ibus_res,
	.dbus_req,
	.dbus_res
);

endmodule
