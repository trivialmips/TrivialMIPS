`include "cpu_defs.svh"

`define PATH_PREFIX1 "../../../../../testbench/testcase/"
`define PATH_PREFIX2 "../../../../../../testbench/testcase/"

module test_cpu_tb();

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

RegWriteReq_t reg_wr1, reg_wr2;
HiloWriteReq_t hilo_wr1, hilo_wr2;
Bit_t mem_access_path1;
assign reg_wr1 = trivial_cpu_instance.reg_wr1;
assign reg_wr2 = trivial_cpu_instance.reg_wr2;
assign hilo_wr1 = trivial_cpu_instance.stage_wb.req_a.hilo_wr;
assign hilo_wr2 = trivial_cpu_instance.stage_wb.req_b.hilo_wr;
assign mem_access_path1 = trivial_cpu_instance.stage_mem.memory_req_a.ce;

task judge(input integer fans, input integer cycle, input string out, input check_cyc);
	string ans, out_with_cyc;
	$fscanf(fans, "%s\n", ans);
	$sformat(out_with_cyc, "[%0d]%s", cycle, out);
	$display("[%0d] %s", cycle, out);
	if(check_cyc) out = out_with_cyc;
	if(out != ans && ans != "skip")
	begin
		$display("[Error] Expected: %0s, Got: %0s", ans, out);
		$stop;
	end
endtask

Bit_t dbus_we_delay;
logic [15:0] dbus_addr_delay;
logic [31:0] dbus_data_delay;
always @(negedge clk.base)
begin
	dbus_we_delay <= fake_data_bus_instance.data_bus.write;
	dbus_addr_delay <= fake_data_bus_instance.data_bus.address;
	dbus_data_delay <= fake_data_bus_instance.data_w;
end

task unittest(
	input [128 * 8 - 1:0] name,
	input check_cyc
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
		clk.rst = 1'b1;
		#50 clk.rst = 1'b0;
	end

	$display("======= unittest: %0s =======", name);

	cycle = 0;
	while(!$feof(fans))
	begin @(negedge clk.base);
		cycle = cycle + 1;

		if(dbus_we_delay && mem_access_path1) begin
			$sformat(out, "[0x%x]=0x%x", dbus_addr_delay[15:0], dbus_data_delay);
			judge(fans, cycle, out, check_cyc);
		end 

		if(reg_wr1.we && reg_wr1.waddr)
		begin
			$sformat(out, "$%0d=0x%x", reg_wr1.waddr, reg_wr1.wdata);
			judge(fans, cycle, out, check_cyc);
		end 

		if(hilo_wr1.we) begin
			$sformat(out, "$hilo=0x%x", hilo_wr1.hilo);
			judge(fans, cycle, out, check_cyc);
		end 

		if(dbus_we_delay && ~mem_access_path1) begin
			$sformat(out, "[0x%x]=0x%x", dbus_addr_delay[15:0], dbus_data_delay);
			judge(fans, cycle, out, check_cyc);
		end 

		if(reg_wr2.we && reg_wr2.waddr)
		begin
			$sformat(out, "$%0d=0x%x", reg_wr2.waddr, reg_wr2.wdata);
			judge(fans, cycle, out, check_cyc);
		end 

		if(hilo_wr2.we) begin
			$sformat(out, "$hilo=0x%x", hilo_wr2.hilo);
			judge(fans, cycle, out, check_cyc);
		end 
	end

	$display("[OK] %0s\n", name);

endtask

initial
begin
	unittest("inst_ori", 0);
	unittest("inst_logical", 0);
	unittest("inst_move", 0);
	unittest("inst_shift", 0);
	unittest("inst_except", 0);
	unittest("inst_trap", 0);
	unittest("inst_arith", 0);
	unittest("inst_mem_aligned", 0);
	unittest("inst_mem_unaligned", 0);
	unittest("inst_llsc", 0);
	unittest("inst_jump", 0);
	unittest("inst_multicyc", 0);
	unittest("superscalar", 1);
	$display("[Done]");
	$finish;
end

endmodule
