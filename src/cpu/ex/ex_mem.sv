`include "cpu_defs.svh"

module ex_mem(
	input  clk, rst,

	input  PipelineData_t  ex_data,
	input  PipelineReq_t   ex_req,
	output PipelineData_t  mem_data,
	output PipelineReq_t   mem_req,

	input  Stall_t stall,
	input  Bit_t   flush
);

always @(posedge clk)
begin
	if(rst || flush || (stall.stall_ex && ~stall.stall_mem))
	begin
		mem_data.delayslot       <= 1'b0;
		mem_data.pc              <= `ZERO_WORD;
		mem_data.op              <= OP_NOP;
		mem_req.reg_wr.we        <= 1'b0;
		mem_req.reg_wr.waddr     <= `ZERO_WORD;
		mem_req.reg_wr.wdata     <= `ZERO_WORD;
		mem_req.cp0_reg_wr.we    <= 1'b0;
		mem_req.cp0_reg_wr.waddr <= `ZERO_WORD;
		mem_req.cp0_reg_wr.wdata <= `ZERO_WORD;
		mem_req.hilo_wr.we       <= 1'b0;
		mem_req.hilo_wr.hilo     <= `ZERO_DWORD;
		mem_req.memory_req.ce    <= 1'b0;
		mem_req.memory_req.we    <= 1'b0;
		mem_req.memory_req.addr  <= `ZERO_WORD;
		mem_req.memory_req.wdata <= `ZERO_WORD;
		mem_req.except.occur     <= 1'b0;
		mem_req.llbit_set        <= 1'b0;
	end else if(~stall.stall_ex) begin
		mem_data <= ex_data;
		mem_req  <= ex_req;
	end
end

endmodule
