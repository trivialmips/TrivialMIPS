`include "cpu_defs.svh"

module fake_inst_bus(
	Bus_if.slave inst_bus
);

reg [`INST_WIDTH - 1:0] inst_mem[1023:0];

always_comb
begin
	if(inst_bus.clk.rst == 1'b1 || inst_bus.read == 1'b0)
	begin
		inst_bus.data_rd   = `ZERO_WORD;
		inst_bus.data_rd_2 = `ZERO_WORD;
	end else begin
		Word_t data = inst_mem[inst_bus.address[11:2]];
		Word_t data2 = inst_mem[inst_bus.address[11:2] + 1];
		inst_bus.data_rd = data;
		inst_bus.data_rd_2 = data2;
	end
end

endmodule 
