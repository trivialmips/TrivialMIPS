`include "cpu_defs.svh"

module cpu_wb(
	input  rst,

	input  PipelineReq_t  req_a,
	input  PipelineReq_t  req_b,

	output RegWriteReq_t  reg_wr1,
	output RegWriteReq_t  reg_wr2,
	output HiloWriteReq_t hilo_wr,
	output CP0RegWriteReq_t  cp0_reg_wr,

	output Bit_t         stall_req
);

assign stall_req = 1'b0;

`define RST_REG_WR(w) \
	w.we    = 1'b0; \
	w.waddr = `ZERO_WORD; \
	w.wdata = `ZERO_WORD;

always_comb
begin
	if(rst == 1'b1)
	begin
		`RST_REG_WR(reg_wr1)
		`RST_REG_WR(reg_wr2)
		`RST_REG_WR(cp0_reg_wr)
		hilo_wr.we   = 1'b0;
		hilo_wr.hilo = `ZERO_DWORD;
	end else begin
		reg_wr1 = req_a.reg_wr;
		reg_wr2 = req_b.reg_wr;
		hilo_wr = req_b.hilo_wr.we ? req_b.hilo_wr : req_a.hilo_wr;
		// only pipe-a will access CP0
		cp0_reg_wr = req_a.cp0_reg_wr;
	end
end

endmodule
