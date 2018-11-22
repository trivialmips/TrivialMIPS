`include "cpu_defs.svh"

`define PATH_PREFIX1 "../../../../../testbench/cpu/testcase/"
`define PATH_PREFIX2 "../../../../../../testbench/cpu/testcase/"

module test_cpu_tb();

Clock_t clk;

clock clock_instance(.clk);


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

FPURegWriteReq_t fpu_reg_wr1, fpu_reg_wr2;
RegWriteReq_t reg_wr1, reg_wr2;
HiloWriteReq_t hilo_wr1, hilo_wr2;
Bit_t mem_access_path1;
assign reg_wr1 = trivial_cpu_instance.reg_wr1;
assign reg_wr2 = trivial_cpu_instance.reg_wr2;
assign fpu_reg_wr1 = trivial_cpu_instance.fpu_reg_wr1;
assign fpu_reg_wr2 = trivial_cpu_instance.fpu_reg_wr2;
assign hilo_wr1 = trivial_cpu_instance.stage_wb.req_a.hilo_wr;
assign hilo_wr2 = trivial_cpu_instance.stage_wb.req_b.hilo_wr;
assign mem_access_path1 = trivial_cpu_instance.stage_mem.req_mem_a.memory_req.ce;

task judge(input integer fans, input integer cycle, input string out, input check_cyc);
	string ans, out_with_cyc;
	$fscanf(fans, "%s\n", ans);
	$sformat(out_with_cyc, "[%0d]%s", cycle, out);
	if(check_cyc) out = out_with_cyc;
	if(out != ans && ans != "skip")
	begin
		$display("[%0d] %s", cycle, out);
		$display("[Error] Expected: %0s, Got: %0s", ans, out);
		$stop;
	end else begin
		$display("[%0d] %s [%s]", cycle, out, ans == "skip" ? "skip" : "pass");
	end
endtask

Bit_t dbus_we_delay;
logic [15:0] dbus_addr_delay;
logic [31:0] dbus_data_delay;
always @(negedge clk.base)
begin
	dbus_we_delay <= fake_data_bus_instance.data_bus.write;
	dbus_addr_delay <= {fake_data_bus_instance.data_bus.address[15:2], 2'b0};
	dbus_data_delay <= fake_data_bus_instance.data_w;
end

assign data_bus_if.interrupt[5:1] = 5'b0;

task unittest(
	input [128 * 8 - 1:0] name,
	input check_cyc,
	input dump_fpu
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
		data_bus_if.interrupt[0] = (40 <= cycle && cycle <= 45);

		if(dbus_we_delay && mem_access_path1) begin
			$sformat(out, "[0x%x]=0x%x", dbus_addr_delay[15:0], dbus_data_delay);
			judge(fans, cycle, out, check_cyc);
		end 

		if(reg_wr1.we && reg_wr1.waddr)
		begin
			$sformat(out, "$%0d=0x%x", reg_wr1.waddr, reg_wr1.wdata);
			judge(fans, cycle, out, check_cyc);
		end 

		if(fpu_reg_wr1.we && dump_fpu)
		begin
			$sformat(out, "$f%0d=0x%x", fpu_reg_wr1.waddr, fpu_reg_wr1.wdata.val);
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

		if(fpu_reg_wr2.we && dump_fpu)
		begin
			$sformat(out, "$f%0d=0x%x", fpu_reg_wr2.waddr, fpu_reg_wr2.wdata.val);
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
	wait (clk.rst == 1'b0);
	unittest("inst_ori", 0, 0);
	unittest("inst_logical", 0, 0);
	unittest("inst_move", 0, 0);
	unittest("inst_shift", 0, 0);
	unittest("inst_trap", 0, 0);
	unittest("inst_arith", 0, 0);
	unittest("inst_mem_aligned", 0, 0);
	unittest("inst_mem_unaligned", 0, 0);
	unittest("inst_llsc", 0, 0);
	unittest("inst_jump", 0, 0);
	unittest("inst_multicyc", 0, 0);
	unittest("except", 0, 0);
	unittest("except_delayslot", 0, 0);
	unittest("interrupt", 0, 0);
	unittest("timer", 0, 0);
	unittest("usermode", 0, 0);
	unittest("across_tlb1", 0, 0);
	unittest("across_tlb2", 0, 0);
	unittest("across_tlb3", 0, 0);
	unittest("across_tlb4", 0, 0);
	unittest("across_tlb5", 0, 0);
	unittest("across_tlb6", 0, 0);
	unittest("superscalar", 1, 0);
	unittest("fpu_arith", 0, 0);
	unittest("fpu_arith2", 0, 0);
	unittest("fpu_test2", 0, 1);
	unittest("fpu_test3", 0, 0);
	unittest("fpu_compare", 0, 0);
	unittest("fpu_transfer", 0, 0);
	$display("[Done]", 0);
	$finish;
end

endmodule
