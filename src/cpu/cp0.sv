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
assign rdata = regs_new[raddr * `REG_DATA_WIDTH +: 32];

always @(posedge clk)
begin
	if(rst)
	begin
		// TODO: the initial value of registers
		regs_inner.count <= `ZERO_WORD;
		regs_inner.cause <= `ZERO_WORD;
		regs_inner.status <= 32'b00010000000000000000000000000000;
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
		/* 
		case(wr.waddr)
			// TODO: add mask for writing operation
			`CP0_REG_COUNT:   regs_new.count = wr.wdata;
			`CP0_REG_COMPARE: regs_new.compare = wr.wdata;
			`CP0_REG_STATUS:  regs_new.status = wr.wdata;
			`CP0_REG_CAUSE:   regs_new.cause = wr.wdata;
			`CP0_REG_EPC:     regs_new.epc = wr.wdata;
		endcase */
	   regs_new[wr.waddr * `REG_DATA_WIDTH +: 32] = wr.wdata;
	end

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
			regs_new.cause.ce   = 2'b0;  // TODO: not sure
			regs_new.cause.exc_code = except_req.code;

			if(except_req.code == `EXCCODE_ADEL || except_req.code == `EXCCODE_ADES)
				regs_new.bad_vaddr = except_req.extra;
		end
	end
end


endmodule
