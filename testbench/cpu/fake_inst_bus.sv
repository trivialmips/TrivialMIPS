`include "cpu_defs.svh"

module fake_inst_bus(
	Bus_if.slave inst_bus
);

reg [`INST_WIDTH - 1:0] inst_mem[1023:0];

always_comb
begin
	if(inst_bus.clk.rst == 1'b1 || inst_bus.read == 1'b0)
	begin
		inst_bus.data_rd = `ZERO_WORD;
	end else begin
		Word_t data = inst_mem[inst_bus.address[11:2]];
		// TODO: implement 64-bit read at once
		inst_bus.data_rd[31:24] = data[7:0];
		inst_bus.data_rd[23:16] = data[15:8];
		inst_bus.data_rd[15:8]  = data[23:16];
		inst_bus.data_rd[7:0]   = data[31:24];
	end
end

endmodule 
