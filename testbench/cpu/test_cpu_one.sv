`include "cpu_defs.svh"

`define PATH_PREFIX "../../../../../testbench/testcase/"

module test_cpu_one_tb();

Clock_t clk;

initial begin
	clk.base = 1'b0;
end

always #10 clk.base = ~clk.base;

Bus_if data_bus_if(.clk);
Bus_if inst_bus_if(.clk);

fake_inst_bus fake_inst_bus_instance(
	.inst_bus(inst_bus_if.slave)
);

fake_data_bus fake_data_bus_instance(
	.data_bus(data_bus_if.slave)
);

trivial_mips trivial_cpu_instance(
	.inst_bus(inst_bus_if.master),
	.data_bus(data_bus_if.master)
);

initial begin
    integer i;

	for(i = 0; i < $size(fake_inst_bus_instance.inst_mem); i = i + 1)
	fake_inst_bus_instance.inst_mem[i] = 32'h0;

	for(i = 0; i < $size(fake_data_bus_instance.inst_ram); i = i + 1)
	fake_data_bus_instance.inst_ram[i] = 32'h0;

	$readmemh({ `PATH_PREFIX, "inst", ".mem" }, fake_inst_bus_instance.inst_mem);

	clk.rst = 1'b1;
	#50 clk.rst = 1'b0;
	#2000 $stop;
end

endmodule
