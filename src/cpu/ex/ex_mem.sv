`include "cpu_defs.svh"

module ex_mem(
	input  clk, rst,

	input  InstAddr_t     ex_pc,
	input  RegWriteReq_t  ex_reg_wr,
	input  RegWriteReq_t  ex_cp0_reg_wr,
	input  HiloWriteReq_t ex_hilo_wr,
	input  MemAccessReq_t ex_memory_req,
	input  ExceptInfo_t   ex_except,
	output InstAddr_t     mem_pc,
	output RegWriteReq_t  mem_reg_wr,
	output RegWriteReq_t  mem_cp0_reg_wr,
	output HiloWriteReq_t mem_hilo_wr,
	output MemAccessReq_t mem_memory_req,
	output ExceptInfo_t   mem_except,

	input  Stall_t stall,
	input  Bit_t   flush
);

always @(posedge clk)
begin
	if(rst || flush || (stall.stall_ex && ~stall.stall_mem))
	begin
		mem_pc               <= `ZERO_WORD;
		mem_reg_wr.we        <= 1'b0;
		mem_reg_wr.waddr     <= `ZERO_WORD;
		mem_reg_wr.wdata     <= `ZERO_WORD;
		mem_cp0_reg_wr.we    <= 1'b0;
		mem_cp0_reg_wr.waddr <= `ZERO_WORD;
		mem_cp0_reg_wr.wdata <= `ZERO_WORD;
		mem_hilo_wr.we       <= 1'b0;
		mem_hilo_wr.hilo     <= `ZERO_DWORD;
		mem_memory_req.ce    <= 1'b0;
		mem_memory_req.we    <= 1'b0;
		mem_memory_req.addr  <= `ZERO_WORD;
		mem_memory_req.wdata <= `ZERO_WORD;
		mem_except.occur     <= 1'b0;
	end else if(~stall.stall_ex) begin
		mem_pc         <= ex_pc;
		mem_reg_wr     <= ex_reg_wr;
		mem_cp0_reg_wr <= ex_cp0_reg_wr;
		mem_hilo_wr    <= ex_hilo_wr;
		mem_memory_req <= ex_memory_req;
		mem_except     <= ex_except;
	end
end

endmodule
