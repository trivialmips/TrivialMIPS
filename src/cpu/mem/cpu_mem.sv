`include "cpu_defs.svh"

module cpu_mem(
	input  rst,

	input  Bit_t          ll_bit,

	input  PipelineData_t data_ex_a,
	input  PipelineData_t data_ex_b,
	input  PipelineReq_t  req_ex_a,
	input  PipelineReq_t  req_ex_b,
	output PipelineReq_t  req_mem_a,
	output PipelineReq_t  req_mem_b,

	input  MMUResult_t    mmu_data_result,
	input  Bit_t         except_already_occur,

	Bus_if.master        data_bus,

	output Bit_t  memory_data_we,
	output Bit_t  llbit_reset,
	output Bit_t  stall_req
);

Oper_t op;
MemAccessReq_t memory_req;
RegWriteReq_t wr_i, wr_o;
FPURegWriteReq_t fpu_wr_i, fpu_wr_o;
ExceptInfo_t except_i, except_o;
assign memory_data_we = (memory_req.ce & memory_req.we);

always_comb
begin
	req_mem_a = req_ex_a;
	req_mem_b = req_ex_b;

	req_mem_a.fcsr    = req_ex_a.fcsr;
	req_mem_b.fcsr    = req_ex_b.fcsr;
	req_mem_a.fcsr_we = req_ex_a.fcsr_we;
	req_mem_b.fcsr_we = req_ex_b.fcsr_we;
	req_mem_a.fpu_except = req_ex_a.fpu_except;
	req_mem_b.fpu_except = req_ex_b.fpu_except;

	// Only one of pipe-a and pipe-b may access memory
	if(req_ex_b.memory_req.ce)
	begin
		memory_req       = req_ex_b.memory_req;
		op               = data_ex_b.op;
		except_i         = req_ex_b.except;
		wr_i             = req_ex_b.reg_wr;
		fpu_wr_i         = req_ex_b.freg_wr;
		req_mem_b.except = except_o;
		req_mem_a.except = req_ex_a.except;
		req_mem_b.reg_wr = wr_o;
		req_mem_a.reg_wr = req_ex_a.reg_wr;
		req_mem_b.freg_wr = fpu_wr_o;
		req_mem_a.freg_wr = req_ex_a.freg_wr;
	end else begin
		memory_req       = req_ex_a.memory_req;
		op               = data_ex_a.op;
		except_i         = req_ex_a.except;
		wr_i             = req_ex_a.reg_wr;
		fpu_wr_i         = req_ex_a.freg_wr;
		req_mem_a.except = except_o;
		req_mem_b.except = req_ex_b.except;
		req_mem_a.reg_wr = wr_o;
		req_mem_b.reg_wr = req_ex_b.reg_wr;
		req_mem_a.freg_wr = fpu_wr_o;
		req_mem_b.freg_wr = req_ex_b.freg_wr;
	end
end

// exception
always_comb
begin
	except_o = except_i;
	if(memory_req.ce)
	begin
		except_o.daddr_miss     = mmu_data_result.miss;
		except_o.daddr_invalid  = mmu_data_result.invalid;
		except_o.daddr_illegal  = mmu_data_result.illegal;
		except_o.daddr_readonly = memory_req.we & ~mmu_data_result.dirty;
	end else begin
		except_o.daddr_miss     = 1'b0;
		except_o.daddr_invalid  = 1'b0;
		except_o.daddr_illegal  = 1'b0;
		except_o.daddr_readonly = 1'b0;
	end
end

assign stall_req = data_bus.stall;
assign llbit_reset = 1'b0;
// assign except.occur = 1'b0;

logic [1:0] addr_offset;
Word_t aligned_data_rd, unaligned_data_rd, ext_sel;
Word_t signed_ext_byte, signed_ext_half_word;
Word_t zero_ext_byte, zero_ext_half_word;
Word_t unaligned_word;
assign aligned_data_rd = data_bus.data_rd >> (addr_offset * 8);
assign ext_sel = {
	{8{memory_req.sel[3]}},
	{8{memory_req.sel[2]}},
	{8{memory_req.sel[1]}},
	{8{memory_req.sel[0]}}
};
assign addr_offset          = mmu_data_result.phy_addr[1:0];
assign signed_ext_byte      = { {24{aligned_data_rd[7]}}, aligned_data_rd[7:0] };
assign signed_ext_half_word = { {16{aligned_data_rd[15]}}, aligned_data_rd[15:0] };
assign zero_ext_byte      = { 24'b0, aligned_data_rd[7:0] };
assign zero_ext_half_word = { 16'b0, aligned_data_rd[15:0] };
// for LWL/LWR, memory_req.wdata = reg2
assign unaligned_word = (memory_req.wdata & ~ext_sel) | (unaligned_data_rd & ext_sel);
always_comb
begin
	if(op == OP_LWL)
	begin
		unaligned_data_rd = data_bus.data_rd << ((3 - addr_offset) * 8);
	end else begin
		unaligned_data_rd = data_bus.data_rd >> (addr_offset * 8);
	end
end

assign data_bus.address = mmu_data_result.phy_addr;
assign data_bus.data_wr = memory_req.wdata;
assign data_bus.mask    = memory_req.sel;

always_comb
begin
	if(rst == 1'b1)
	begin
		wr_o.we    = 1'b0;
		wr_o.waddr = `ZERO_WORD;
		wr_o.wdata = `ZERO_WORD;

		fpu_wr_o    = fpu_wr_i;
		fpu_wr_o.we = 1'b0;

		data_bus.read    = `ZERO_BIT;
		data_bus.write   = `ZERO_BIT;
	end else if(memory_req.ce) begin
		if(memory_req.we)
		begin
			// write memory
			data_bus.read    = `ZERO_BIT;
			data_bus.write   = 1'b1;

			if(op == OP_SC)
			begin
				data_bus.write = ll_bit;
				wr_o.we        = wr_i.we;
				wr_o.wdata     = { 30'b0, ll_bit };
				wr_o.waddr     = wr_i.waddr;
			end else begin
				wr_o.we     = 1'b0;
				wr_o.waddr  = `ZERO_WORD;
				wr_o.wdata  = `ZERO_WORD;
			end
		end else begin
			// read memory
			data_bus.read    = 1'b1;
			data_bus.write   = `ZERO_BIT;

			wr_o.we    = (op != OP_LWC1);
			wr_o.waddr = wr_i.waddr;
			unique case(op)
				OP_LB:   wr_o.wdata = signed_ext_byte;
				OP_LH:   wr_o.wdata = signed_ext_half_word;
				OP_LBU:  wr_o.wdata = zero_ext_byte;
				OP_LHU:  wr_o.wdata = zero_ext_half_word;
				OP_LWL, OP_LWR: wr_o.wdata = unaligned_word;
				default: wr_o.wdata = aligned_data_rd;
			endcase
		end

		fpu_wr_o.we        = (op == OP_LWC1);
		fpu_wr_o.waddr     = fpu_wr_i.waddr;
		fpu_wr_o.wdata.val = aligned_data_rd;
		fpu_wr_o.wdata.fmt = `FPU_REG_UNINTERPRET;

		if(except_already_occur)
		begin
		/* If update 'wr_o' at this time, the data-forward will
		 * result a long data-path. At stage MEM/WB, when an exception
		 * occurs, the 'flush' signal will make the request empty. */
		// TODO: unittest
			data_bus.read    = `ZERO_BIT;
			data_bus.write   = `ZERO_BIT;
		end
	end else begin
		wr_o     = wr_i;
		fpu_wr_o = fpu_wr_i;

		data_bus.read    = `ZERO_BIT;
		data_bus.write   = `ZERO_BIT;
	end
end

endmodule
