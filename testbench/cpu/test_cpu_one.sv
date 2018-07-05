`include "cpu_defs.svh"

`define PATH_PREFIX "../../../../../testbench/testcase/"

module test_cpu_one_tb();

reg clk50M;
reg rst;

initial begin
	clk50M = 1'b0;
end

always #10 clk50M = ~clk50M;

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

initial begin
    integer i;
    for(i = 0; i < $size(ibus_instance.inst_mem); i = i + 1)
	   ibus_instance.inst_mem[i] = 32'h0;

    for(i = 0; i < $size(dbus_instance.inst_ram); i = i + 1)
	   dbus_instance.inst_ram[i] = 32'h0;

    $readmemh({ `PATH_PREFIX, "inst", ".mem" }, ibus_instance.inst_mem);

	rst = 1'b1;
	#50 rst = 1'b0;
	#1000 $stop;
end

endmodule
