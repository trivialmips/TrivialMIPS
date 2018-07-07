`include "cpu_defs.svh"

`define PATH_PREFIX "../../../../../testbench/testcase/"

module test_cpu_tb();

reg clk50M;
reg rst;

initial begin
	clk50M = 1'b0;
end

always #10 clk50M = ~clk50M;


Bus_if data_bus_if();
Bus_if inst_bus_if();

fake_inst_bus fake_inst_bus_instance(
	.rst,
	.inst_bus(inst_bus_if.slave)
);

fake_data_bus fake_data_bus_instance(
	.clk(clk50M),
	.rst,
	.data_bus(data_bus_if.slave)
);

trivial_mips trivial_cpu_instance(
	.clk(clk50M),
	.rst,
	.inst_bus(inst_bus_if.master),
	.data_bus(data_bus_if.master)
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
	for(i = 0; i < $size(fake_inst_bus_instance.inst_mem); i = i + 1)
	fake_inst_bus_instance.inst_mem[i] = 32'h0;

	for(i = 0; i < $size(fake_data_bus_instance.inst_ram); i = i + 1)
	fake_data_bus_instance.inst_ram[i] = 32'h0;

	$readmemh({ `PATH_PREFIX, name, ".mem" }, fake_inst_bus_instance.inst_mem);

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
			if(out != ans && ans != "skip")
			begin
				$display("[Error] Expected: %0s, Got: %0s", ans, out);
				$stop;
			end
		end 

		if(hilo_wr.we) begin
			$fscanf(fans, "%s\n", ans);
			$sformat(out, "$hilo=0x%x", hilo_wr.hilo);
			$display("[%0d] %s", cycle, out);
			if(out != ans && ans != "skip")
			begin
				$display("[Error] Expected: %0s, Got: %0s", ans, out);
				$stop;
			end
		end 

		if(fake_data_bus_instance.data_bus.write) begin
			$fscanf(fans, "%s\n", ans);
			$sformat(out, "[0x%x]=0x%x", fake_data_bus_instance.data_bus.address[15:0], fake_data_bus_instance.data_w);
			$display("[%0d] %s", cycle, out);
			if(out != ans && ans != "skip")
			begin
				$display("[Error] Expected: %0s, Got: %0s", ans, out);
				$stop;
			end
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
	unittest("inst_mem");
	unittest("inst_mem_unaligned");
	unittest("inst_llsc");
	unittest("inst_jump");
	unittest("inst_multicyc");
	$display("[Done]");
	$finish;
end

endmodule
