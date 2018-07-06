`include "cpu_defs.svh"

module cpu_if(
	input  rst,
	input  InstAddr_t    pc,
	Bus_if.master        inst_bus,
	output Bit_t         stall_req
);

// TODO: use the stall bit in inst_bus
assign stall_req = 1'b0;

assign inst_bus.data_wr = `ZERO_WORD;

always_comb
begin
	if(rst == 1'b1)
	begin
		inst_bus.read    = `ZERO_BIT;
		inst_bus.write   = `ZERO_BIT;
		inst_bus.address = `ZERO_WORD;
		inst_bus.mask    = 4'b0000;
	end else begin
		inst_bus.read    = `ZERO_BIT;
		inst_bus.write   = `ZERO_BIT;
		inst_bus.address = pc;
		inst_bus.mask    = 4'b1111;
	end
end

endmodule
