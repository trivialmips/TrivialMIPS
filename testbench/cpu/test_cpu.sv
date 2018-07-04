`include "cpu_defs.svh"

`define PATH_PREFIX "../../../../../testbench/testcase/"

module test_cpu_tb();

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

RegWriteReq_t reg_wr;
HiloWriteReq_t hilo_wr;
assign reg_wr = trivial_cpu_instance.reg_wr;
assign hilo_wr = trivial_cpu_instance.hilo_wr;

task unittest(
	input [128 * 8 - 1:0] name
);

	integer i, fans, cycle = 0, is_event = 0;
	string ans, out, info;
	for(i = 0; i < $size(ibus_instance.inst_mem); i = i + 1)
		ibus_instance.inst_mem[i] = 32'h0;

	for(i = 0; i < $size(dbus_instance.inst_ram); i = i + 1)
		dbus_instance.inst_ram[i] = 32'h0;

	$readmemh({ `PATH_PREFIX, name, ".mem" }, ibus_instance.inst_mem);

	begin
		rst = 1'b1;
		#50 rst = 1'b0;
	end

	$display("======= unittest: %0s =======", name);

	fans = $fopen({ `PATH_PREFIX, name, ".ans"}, "r");

	cycle = 0;
	while(!$feof(fans))
	begin @(negedge clk50M);
		cycle = cycle + 1;
		if(reg_wr.we && reg_wr.waddr)
		begin
			$fscanf(fans, "%s\n", ans);
			$sformat(out, "$%0d=0x%x", reg_wr.waddr, reg_wr.wdata);
			$display("[%0d] %s", cycle, out);
			is_event = 1;
		end else if(hilo_wr.we) begin
			$fscanf(fans, "%s\n", ans);
			$sformat(out, "$hilo=0x%x", hilo_wr.hilo);
			$display("[%0d] %s", cycle, out);
			is_event = 1;
		end else begin
			is_event = 0;
		end

		if(is_event && out != ans)
		begin
			$display("[Error] Expected: %0s, Got: %0s", ans, out);
			$stop;
		end
	end

	$display("[OK] %0s\n", name);

endtask

initial
begin
	unittest("inst_ori");
	unittest("inst_mem");
	unittest("inst_jump");
	unittest("inst_multicyc");
	$finish;
end

endmodule
