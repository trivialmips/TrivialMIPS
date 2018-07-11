`include "cpu_defs.svh"

module cp0(
	input  clk, rst,

	input  RegAddr_t     raddr1,
	input  RegAddr_t     raddr2,
	input  wire [2:0]    rsel1,
	input  wire [2:0]    rsel2,
	input  CP0RegWriteReq_t wr,
	input  ExceptReq_t   except_req,
	input  wire [5:0]    int_req,

	input  Bit_t         tlbr_req,
	input  TLBEntry_t    tlbr_res,
	input  Bit_t         tlbp_req,
	input  Word_t        tlbp_res,

	output Word_t        rdata1,
	output Word_t        rdata2,
	output CP0Regs_t     regs,
	output wire [7:0]    asid,
	output Bit_t         user_mode
);

CP0Regs_t regs_new, regs_inner;
assign regs = regs_inner;
assign asid = regs.entry_hi[7:0];
assign user_mode = (regs.status[4:1] == 4'b1000);

function Word_t read_cp0(
	input CP0Regs_t cp0_regs,
	input RegAddr_t raddr,
	input [2:0] sel
);
	if(sel == 3'b0)
	begin
		read_cp0 = cp0_regs[raddr * `REG_DATA_WIDTH +: 32];
	end else begin
		read_cp0 = 32'b0;
	end
endfunction

assign rdata1 = read_cp0(regs_new, raddr1, rsel1);
assign rdata2 = read_cp0(regs_new, raddr2, rsel2);

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

always_comb
begin
	regs_new = regs_inner;
	regs_new.count = regs_new.count + 32'b1;
	regs_new.cause.ip[7:2] = int_req;

	/* write register (WB stage) */
	if(wr.we)
	begin
		wdata = regs_new[wr.waddr * `REG_DATA_WIDTH +: 32];
		wdata = (wr.wdata & wmask) | (wdata & ~wmask);
		regs_new[wr.waddr * `REG_DATA_WIDTH +: 32] = wdata;
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
