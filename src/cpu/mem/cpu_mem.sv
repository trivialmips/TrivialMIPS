`include "cpu_defs.svh"

module cpu_mem(
	input  rst,

	input  Bit_t          ll_bit,
	input  Oper_t         op,
	input  MemAccessReq_t memory_req,
	input  RegWriteReq_t  wr_i,
	output RegWriteReq_t  wr_o,

	Bus_if.master         data_bus,

	output Bit_t         llbit_reset,
	output Bit_t         stall_req,
	output ExceptInfo_t  except
);

assign stall_req = data_bus.stall;
assign llbit_reset = 1'b0;
assign except.occur = 1'b0;

Word_t data_rd, unaligned_data_rd, ext_sel;
Word_t signed_ext_byte, signed_ext_half_word;
Word_t zero_ext_byte, zero_ext_half_word;
Word_t unaligned_word;
assign data_rd = data_bus.data_rd;
assign ext_sel = {
	{8{memory_req.sel[3]}},
	{8{memory_req.sel[2]}},
	{8{memory_req.sel[1]}},
	{8{memory_req.sel[0]}}
};
assign signed_ext_byte      = { {24{data_rd[7]}},  data_rd[7:0] };
assign signed_ext_half_word = { {16{data_rd[15]}}, data_rd[15:0] };
assign zero_ext_byte      = { 24'b0, data_rd[7:0] };
assign zero_ext_half_word = { 16'b0, data_rd[15:0] };
// for LWL/LWR, memory_req.wdata = reg2
always_comb
begin
	if(op == OP_LWL)
	begin
		unaligned_data_rd = data_rd << ((3 - memory_req.addr[1:0]) * 8);
	end else begin
		unaligned_data_rd = data_rd >> (memory_req.addr[1:0] * 8);
	end
	unaligned_word = (memory_req.wdata & ~ext_sel) | (unaligned_data_rd & ext_sel);
end

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
			data_bus.address = { memory_req.addr[31:2], 2'b0 };
			data_bus.read    = `ZERO_BIT;
			data_bus.write   = 1'b1;
			data_bus.data_wr = memory_req.wdata;
			data_bus.mask    = memory_req.sel;

			if(op == OP_SC)
			begin
				data_bus.write = ll_bit;
				wr_o.we        = wr_i.we;
				wr_o.wdata     = { 30'b0, ll_bit };
				wr_o.waddr     = wr_i.waddr;
			end else begin
				wr_o.we    = 1'b0;
				wr_o.waddr = `ZERO_WORD;
				wr_o.wdata = `ZERO_WORD;
			end
		end else begin
			// read memory
			data_bus.address = { memory_req.addr[31:2], 2'b0 };
			data_bus.read    = 1'b1;
			data_bus.write   = `ZERO_BIT;
			data_bus.data_wr = `ZERO_WORD;
			data_bus.mask    = memory_req.sel;

			wr_o.we    = 1'b1;
			wr_o.waddr = wr_i.waddr;
			unique case(op)
				OP_LB:   wr_o.wdata = signed_ext_byte;
				OP_LH:   wr_o.wdata = signed_ext_half_word;
				OP_LBU:  wr_o.wdata = zero_ext_byte;
				OP_LHU:  wr_o.wdata = zero_ext_half_word;
				OP_LWL, OP_LWR: wr_o.wdata = unaligned_word;
				default: wr_o.wdata = data_rd;
			endcase
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
