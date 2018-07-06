`include "cpu_defs.svh"

module cpu_mem(
	input  rst,

	input  MemAccessReq_t memory_req,
	input  RegWriteReq_t  wr_i,
	output RegWriteReq_t  wr_o,

	Bus_if.master         data_bus,

	output Bit_t         stall_req,
	output ExceptInfo_t  except
);

// TODO: use the stall bit in data_bus
assign stall_req = 1'b0;
assign except.occur = 1'b0;

always_comb
begin
	if(rst == 1'b1)
	begin
		wr_o.we    = 1'b0;
		wr_o.waddr = `ZERO_WORD;
		wr_o.wdata = `ZERO_WORD;

		data_bus.address = `ZERO_WORD;
		data_bus.read    = `ZERO_BIT;
		data_bus.write   = `ZERO_BIT;
		data_bus.data_wr = `ZERO_WORD;
		data_bus.mask    = 4'b0000;

		// except.occur = 1'b0;
	end else if(memory_req.ce) begin
		if(memory_req.we)
		begin
			// write memory
			data_bus.address = memory_req.addr;
			data_bus.read    = `ZERO_BIT;
			data_bus.write   = 1'b1;
			data_bus.data_wr = memory_req.wdata;
			data_bus.mask    = memory_req.sel;

			wr_o.we    = 1'b0;
			wr_o.waddr = `ZERO_WORD;
			wr_o.wdata = `ZERO_WORD;
		end else begin
			// read memory
			data_bus.address = memory_req.addr;
			data_bus.read    = 1'b1;
			data_bus.write   = `ZERO_BIT;
			data_bus.data_wr = `ZERO_WORD;
			data_bus.mask    = memory_req.sel;

			wr_o.we    = 1'b1;
			wr_o.waddr = wr_i.waddr;
			wr_o.wdata = dbus_res.data;
		end
	end else begin
		wr_o = wr_i;

		data_bus.address = `ZERO_WORD;
		data_bus.read    = `ZERO_BIT;
		data_bus.write   = `ZERO_BIT;
		data_bus.data_wr = `ZERO_WORD;
		data_bus.mask    = 4'b0000;
	end
end

endmodule
