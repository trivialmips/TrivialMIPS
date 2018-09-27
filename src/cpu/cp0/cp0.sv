`include "cpu_defs.svh"

module cp0(
	input  clk, rst,

	input  RegAddr_t     raddr,
	input  wire [2:0]    rsel,
	input  CP0RegWriteReq_t wr,
	input  ExceptReq_t   except_req,

	input  Bit_t         tlbr_req,
	input  TLBEntry_t    tlbr_res,
	input  Bit_t         tlbp_req,
	input  Word_t        tlbp_res,

	output Word_t        rdata,
	output CP0Regs_t     regs,
	output wire [7:0]    asid,
	output Bit_t         user_mode,
	output reg           timer_int
);

CP0Regs_t regs_new, regs_inner;
assign regs = regs_inner;
assign asid = regs.entry_hi[7:0];
assign user_mode = (regs.status[4:1] == 4'b1000);

logic [3:0] lfsr4_val;
lfsr4 lfsr4_instance(
	.clk,
	.rst,
	.val(lfsr4_val)
);

logic [31:0] lfsr32_val;
lfsr32 lfsr32_instance(
	.clk,
	.rst,
	.val(lfsr32_val)
);

always_comb
begin
	if(rsel == 3'b0)
	begin
		rdata = regs[raddr * `REG_DATA_WIDTH +: 32];
	end else begin
		rdata = 32'b0;
	end
end

always @(posedge clk)
begin
	if(rst)
	begin
		// TODO: the initial value of registers
		regs_inner.index     <= `ZERO_WORD;
		regs_inner.random    <= `TLB_ENTRIES_NUM - 1;
		regs_inner.entry_lo0 <= `ZERO_WORD;
		regs_inner.entry_lo1 <= `ZERO_WORD;
		regs_inner.context_  <= `ZERO_WORD;
		regs_inner.page_mask <= `ZERO_WORD;
		regs_inner.wired     <= `ZERO_WORD;
		regs_inner.bad_vaddr <= `ZERO_WORD;
		regs_inner.count     <= `ZERO_WORD;
		regs_inner.entry_hi  <= `ZERO_WORD;
		regs_inner.compare   <= `ZERO_WORD;
		regs_inner.status    <= 32'b0001_0000_0100_0000_0000_0000_0000_0000;
		regs_inner.cause     <= `ZERO_WORD;
		regs_inner.epc       <= `ZERO_WORD;
		regs_inner.prid      <= `ZERO_WORD;
		regs_inner.config0   <= `ZERO_WORD;
		regs_inner.error_epc <= `ZERO_WORD;
		regs_inner.ebase     <= 32'h80000001;
	end else begin
		regs_inner <= regs_new;
	end
end

Word_t wmask, wdata;
cp0_write_mask cp0_write_mask_instance(
	.rst,
	.sel(wr.sel),
	.addr(wr.waddr),
	.mask(wmask)
);

always @(posedge clk)
begin
	if(rst)
		timer_int <= 1'b0;
	else if(regs.compare != 32'b0 && regs.compare == regs.count)
		timer_int <= 1'b1;
	else if(wr.we && wr.sel == 3'b0 && wr.waddr == 5'd11)
		timer_int <= 1'b0;
end

always_comb
begin
	regs_new = regs_inner;
	regs_new.count  = regs_new.count + 32'b1;
	regs_new.random = lfsr4_val;
	regs_new.impl_lfsr32 = lfsr32_val;

	/* write register (WB stage) */
	if(wr.we)
	begin
		if(wr.sel == 3'b0)
		begin
			wdata = regs_new[wr.waddr * `REG_DATA_WIDTH +: 32];
			wdata = (wr.wdata & wmask) | (wdata & ~wmask);
			regs_new[wr.waddr * `REG_DATA_WIDTH +: 32] = wdata;
		end else if(wr.sel == 3'b1) begin
			if(wr.waddr == 5'd15)
				regs_new.ebase[29:12] = wr.wdata[29:12];
		end
	end

	/* TLBR/TLBP instruction (WB stage) */
	if(tlbr_req)
	begin
		regs_new.entry_hi[31:13] = tlbr_res.vpn2;
		regs_new.entry_hi[7:0]   = tlbr_res.asid;
		regs_new.entry_lo1 = {
			2'b0, tlbr_res.pfn1, tlbr_res.c1,
			tlbr_res.d1, tlbr_res.v1, tlbr_res.G };
		regs_new.entry_lo0 = {
			2'b0, tlbr_res.pfn0, tlbr_res.c0,
			tlbr_res.d0, tlbr_res.v0, tlbr_res.G };
	end

	if(tlbp_req) regs_new.index = tlbp_res;

	/* exception (MEM stage) */
	if(except_req.flush)
	begin
		if(except_req.eret)
		begin
			if(regs_new.status.erl)
				regs_new.status.erl = 1'b0;
			else regs_new.status.exl = 1'b0;
		end else begin
			if(regs_new.status.exl == 1'b0)
			begin
				if(except_req.delayslot)
				begin
					regs_new.epc = except_req.cur_pc - 32'h4;
					regs_new.cause.bd = 1'b1;
				end else begin
					regs_new.epc = except_req.cur_pc;
					regs_new.cause.bd = 1'b0;
				end
			end

			regs_new.status.exl = 1'b1;
			regs_new.cause.ce   = except_req.extra[1:0];
			regs_new.cause.exc_code = except_req.code;

			if(except_req.code == `EXCCODE_INT)
				regs_new.cause.ip = except_req.extra[7:0];

			if(except_req.code == `EXCCODE_ADEL || except_req.code == `EXCCODE_ADES)
			begin
				regs_new.bad_vaddr = except_req.extra;
			end else if(except_req.code == `EXCCODE_TLBL || except_req.code == `EXCCODE_TLBS) begin
				regs_new.bad_vaddr = except_req.extra;
				regs_new.context_[22:4] = except_req.extra[31:13];   // context.bad_vpn2
				regs_new.entry_hi[31:13] = except_req.extra[31:13];  // entry_hi.vpn2
			end
		end
	end
end


endmodule
