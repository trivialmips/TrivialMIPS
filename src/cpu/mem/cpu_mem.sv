`include "cpu_defs.svh"

module cpu_mem(
	input  rst,

	input  MemAccessReq_t memory_req,
	input  RegWriteReq_t  wr_i,
	output RegWriteReq_t  wr_o,

	input  WishboneRes_t dbus_res,
	output WishboneReq_t dbus_req,

	output Bit_t         stall_req,
	output ExceptInfo_t  except
);

assign stall_req = 1'b0;
assign except.occur = 1'b0;

always_comb
begin
	if(rst == 1'b1)
	begin
		wr_o.we    = 1'b0;
		wr_o.waddr = `ZERO_WORD;
		wr_o.wdata = `ZERO_WORD;

		dbus_req.stb  = 1'b0;
		dbus_req.cyc  = 1'b0;
		dbus_req.we   = 1'b0;
		dbus_req.sel  = 4'b0000;
		dbus_req.addr = `ZERO_WORD;
		dbus_req.data = `ZERO_WORD;

		// except.occur = 1'b0;
	end else if(memory_req.ce) begin
		if(memory_req.we)
		begin
			// write memory
			dbus_req.stb  = 1'b1;
			dbus_req.cyc  = 1'b1;
			dbus_req.we   = 1'b1;
			dbus_req.sel  = memory_req.sel;
			dbus_req.addr = memory_req.addr;
			dbus_req.data = memory_req.wdata;

			wr_o.we    = 1'b0;
			wr_o.waddr = `ZERO_WORD;
			wr_o.wdata = `ZERO_WORD;
		end else begin
			// read memory
			dbus_req.stb  = 1'b1;
			dbus_req.cyc  = 1'b1;
			dbus_req.we   = 1'b0;
			dbus_req.sel  = memory_req.sel;
			dbus_req.addr = memory_req.addr;
			dbus_req.data = `ZERO_WORD;

			wr_o.we    = 1'b1;
			wr_o.waddr = wr_i.waddr;
			wr_o.wdata = dbus_res.data;
		end
	end else begin
		wr_o = wr_i;

		dbus_req.stb  = 1'b0;
		dbus_req.cyc  = 1'b0;
		dbus_req.we   = 1'b0;
		dbus_req.sel  = 4'b0000;
		dbus_req.addr = `ZERO_WORD;
		dbus_req.data = `ZERO_WORD;
	end
end

endmodule
