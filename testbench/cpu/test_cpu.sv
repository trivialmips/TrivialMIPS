`include "cpu_defs.svh"

`define PATH_PREFIX1 "../../../../../testbench/testcase/"
`define PATH_PREFIX2 "../../../../../../testbench/testcase/"

module test_cpu_tb();

reg clk50M;
reg rst;

initial begin
	clk50M = 1'b0;
end

always #10 clk50M = ~clk50M;

Clock_t clk;
assign clk._50M = clk50M;
assign clk.rst = rst;


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

RegWriteReq_t reg_wr1, reg_wr2;
HiloWriteReq_t hilo_wr1, hilo_wr2;
Bit_t mem_access_path1;
assign reg_wr1 = trivial_cpu_instance.reg_wr1;
assign reg_wr2 = trivial_cpu_instance.reg_wr2;
assign hilo_wr1 = trivial_cpu_instance.stage_wb.req_a.hilo_wr;
assign hilo_wr2 = trivial_cpu_instance.stage_wb.req_b.hilo_wr;
assign mem_access_path1 = trivial_cpu_instance.stage_mem.memory_req_a.ce;

task judge(input integer fans, input string out);
	string ans;
	$fscanf(fans, "%s\n", ans);
	if(out != ans && ans != "skip")
	begin
		$display("[Error] Expected: %0s, Got: %0s", ans, out);
		$stop;
	end
endtask

Bit_t dbus_we_delay;
logic [15:0] dbus_addr_delay;
logic [31:0] dbus_data_delay;
always @(negedge clk50M)
begin
	dbus_we_delay <= fake_data_bus_instance.data_bus.write;
	dbus_addr_delay <= fake_data_bus_instance.data_bus.address;
	dbus_data_delay <= fake_data_bus_instance.data_w;
end

task unittest(
	input [128 * 8 - 1:0] name
);
	integer i, fans, cycle = 0, is_event = 0;
	string ans, out, info;

	for(i = 0; i < $size(fake_inst_bus_instance.inst_mem); i = i + 1)
	fake_inst_bus_instance.inst_mem[i] = 32'h0;

	for(i = 0; i < $size(fake_data_bus_instance.inst_ram); i = i + 1)
	fake_data_bus_instance.inst_ram[i] = 32'h0;

	fans = $fopen({ `PATH_PREFIX1, name, ".ans"}, "r");
	if(fans)
	begin
		$readmemh({ `PATH_PREFIX1, name, ".mem" }, fake_inst_bus_instance.inst_mem);
	end else begin
		fans = $fopen({ `PATH_PREFIX2, name, ".ans"}, "r");
		$readmemh({ `PATH_PREFIX2, name, ".mem" }, fake_inst_bus_instance.inst_mem);
	end

	begin
		rst = 1'b1;
		#50 rst = 1'b0;
	end

	$display("======= unittest: %0s =======", name);

	cycle = 0;
	while(!$feof(fans))
	begin @(negedge clk50M);
		cycle = cycle + 1;

		if(dbus_we_delay && mem_access_path1) begin
			$sformat(out, "[0x%x]=0x%x", dbus_addr_delay[15:0], dbus_data_delay);
			$display("[%0d] %s", cycle, out);
			judge(fans, out);
		end 

		if(reg_wr1.we && reg_wr1.waddr)
		begin
			$sformat(out, "$%0d=0x%x", reg_wr1.waddr, reg_wr1.wdata);
			$display("[%0d] %s", cycle, out);
			judge(fans, out);
		end 

		if(hilo_wr1.we) begin
			$sformat(out, "$hilo=0x%x", hilo_wr1.hilo);
			$display("[%0d] %s", cycle, out);
			judge(fans, out);
		end 

		if(dbus_we_delay && ~mem_access_path1) begin
			$sformat(out, "[0x%x]=0x%x", dbus_addr_delay[15:0], dbus_data_delay);
			$display("[%0d] %s", cycle, out);
			judge(fans, out);
		end 

		if(reg_wr2.we && reg_wr2.waddr)
		begin
			$sformat(out, "$%0d=0x%x", reg_wr2.waddr, reg_wr2.wdata);
			$display("[%0d] %s", cycle, out);
			judge(fans, out);
		end 

		if(hilo_wr2.we) begin
			$sformat(out, "$hilo=0x%x", hilo_wr2.hilo);
			$display("[%0d] %s", cycle, out);
			judge(fans, out);
		end 
	end

	$display("[OK] %0s\n", name);

endtask

initial
begin
	unittest("inst_ori");
	unittest("inst_logical");
	unittest("inst_move");
	unittest("inst_shift");
	unittest("inst_except");
	unittest("inst_trap");
	unittest("inst_arith");
	unittest("inst_mem_aligned");
	unittest("inst_mem_unaligned");
	unittest("inst_llsc");
	unittest("inst_jump");
	unittest("inst_multicyc");
	unittest("superscalar");
	$display("[Done]");
	$finish;
end

endmodule
