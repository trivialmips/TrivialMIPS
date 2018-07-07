`include "cpu_defs.svh"

module cpu_if(
	input  rst,
	input  InstAddr_t    pc,
	Bus_if.master        inst_bus,
	output Bit_t         stall_req
);

// TODO: check AddressError

assign stall_req = inst_bus.stall;

assign inst_bus.data_wr = `ZERO_WORD;
assign inst_bus.write   = `ZERO_BIT;

always_comb
begin
	if(rst == 1'b1)
	begin
		inst_bus.read    = `ZERO_BIT;
		inst_bus.address = `ZERO_WORD;
		inst_bus.mask    = 4'b0000;
	end else begin
		inst_bus.read    = 1'b1;
		inst_bus.address = pc;
		inst_bus.mask    = 4'b1111;
	end
end

endmodule
