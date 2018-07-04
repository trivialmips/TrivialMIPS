`include "cpu_defs.svh"

module cp0(
	input  clk, rst,

	input  RegAddr_t     raddr,
	input  RegWriteReq_t wr,
	input  ExceptReq_t   except_req,
	output Word_t        rdata,
	output CP0Regs_t     regs
);

CP0Regs_t regs_new, regs_inner;
assign regs  = regs_new;
assign rdata = regs_new[`CP0_REG_COUNT * `REG_DATA_WIDTH +: 32];

always @(posedge clk)
begin
	if(rst)
	begin
		// TODO: the initial value of registers
		regs_inner.count  <= `ZERO_WORD;
		regs_inner.status <= `ZERO_WORD;
		regs_inner.cause  <= `ZERO_WORD;
	end else begin
		regs_inner <= regs_new;
	end
end

always_comb
begin
	regs_new = regs_inner;
	regs_new.count = regs_new.count + 32'b1;

	/* write register (WB stage) */
	if(wr.we)
	begin
		case(wr.waddr)
			// TODO: add mask for writing operation
			`CP0_REG_COUNT:   regs_new.count = wr.wdata;
			`CP0_REG_COMPARE: regs_new.compare = wr.wdata;
			`CP0_REG_STATUS:  regs_new.status = wr.wdata;
			`CP0_REG_CAUSE:   regs_new.cause = wr.wdata;
		endcase
	end

	/* exception (MEM stage) */
	if(except_req.flush)
	begin
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
		regs_new.cause.ce   = 2'b0;  // TODO: not sure
		regs_new.cause.exc_code = except_req.exc_code;
	end
end


endmodule
