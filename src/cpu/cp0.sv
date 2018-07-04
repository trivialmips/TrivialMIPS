`include "cpu_defs.svh"

module cp0(
	input  clk, rst,

	input  RegAddr_t     raddr,
	input  RegWriteReq_t wr,
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
		regs_inner.count   <= `ZERO_WORD;
	end else begin
		regs_inner <= regs_new;
	end
end

always_comb
begin
	regs_new = regs_inner;
	regs_new.count = regs_new.count + 32'b1;

	if(wr.we)
	begin
		case(wr.waddr)
			`CP0_REG_COUNT: regs_new.count = wr.wdata;
			`CP0_REG_COMPARE: regs_new.compare = wr.wdata;
		endcase
	end
end


endmodule
