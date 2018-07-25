`include "cpu_defs.svh"

module mem_wb(
	input  clk, rst,

	input  PipelineReq_t  mem_req_a,
	input  PipelineReq_t  mem_req_b,
	output PipelineReq_t  wb_req_a,
	output PipelineReq_t  wb_req_b,

	input  Stall_t      stall,
	input  Bit_t        flush,
	input  Bit_t        flush_caused_by_alpha
);

`define RST_REQ_MEMWB(q) \
	q.reg_wr.we    <= 1'b0;        \
	q.reg_wr.waddr <= `ZERO_WORD;  \
	q.reg_wr.wdata <= `ZERO_WORD;  \
	q.fcsr_we       <= 1'b0;        \
	q.fcsr          <= `ZERO_WORD;  \
	q.freg_wr.we    <= 1'b0;        \
	q.freg_wr.waddr <= `ZERO_WORD;  \
	q.freg_wr.wdata <= {$bits(FPUReg_t){1'b0}};  \
	q.hilo_wr.we    <= 1'b0;        \
	q.hilo_wr.hilo  <= `ZERO_DWORD; \
	q.cp0_reg_wr.we    <= 1'b0;        \
	q.cp0_reg_wr.sel   <= 3'b0;        \
	q.cp0_reg_wr.waddr <= `ZERO_WORD;  \
	q.cp0_reg_wr.wdata <= `ZERO_WORD;  \
	q.tlb_read         <= 1'b0;        \
	q.tlbp             <= 1'b0;        \
	q.tlb_wr           <= 1'b0;        \
	q.tlb_wi           <= 1'b0;

always @(posedge clk)
begin
	if(rst || (stall.stall_mem && ~stall.stall_wb))
	begin
		`RST_REQ_MEMWB(wb_req_a)
		`RST_REQ_MEMWB(wb_req_b)
	end else if(flush) begin
		`RST_REQ_MEMWB(wb_req_b)

		if(flush_caused_by_alpha)
		begin
			`RST_REQ_MEMWB(wb_req_a)
		end else begin
			wb_req_a <= mem_req_a;
		end
	end else if(~stall.stall_mem) begin
		wb_req_a <= mem_req_a;
		wb_req_b <= mem_req_b;
	end
end

endmodule
