`include "cpu_defs.svh"

module cp0(
	input  clk, rst,

	input  RegAddr_t     raddr,
	input  RegWriteReq_t wr,
	output Word_t        rdata,
	output CP0Regs_t     regs
);

CP0Regs_t regs_new;
assign rdata = regs_new[`CP0_REG_COUNT * `REG_DATA_WIDTH +: 32];

always @(posedge clk)
begin
	if(rst)
	begin
		regs.count <= `ZERO_WORD;
	end else begin
		regs <= regs_new;
	end
end

always_comb
begin
	regs_new = regs;

	regs_new.count = regs.count + 32'b1;

	if(wr.we)
	begin
		case(wr.waddr)
			`CP0_REG_COUNT:
				regs_new.count = wr.wdata;
		endcase
	end
end


endmodule
