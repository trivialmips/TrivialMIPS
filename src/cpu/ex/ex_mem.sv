`include "cpu_defs.svh"

module ex_mem(
	input  clk, rst,

	input  PipelineData_t  ex_data_a,
	input  PipelineData_t  ex_data_b,
	input  PipelineReq_t   ex_req_a,
	input  PipelineReq_t   ex_req_b,
	output PipelineData_t  mem_data_a,
	output PipelineData_t  mem_data_b,
	output PipelineReq_t   mem_req_a,
	output PipelineReq_t   mem_req_b,

	input  MMUResult_t ex_mmu_data_result,
	output MMUResult_t mem_mmu_data_result,

	input  Stall_t stall,
	input  Bit_t   flush
);

`define RST_REQ_EXMEM(q) \
	q.reg_wr.we        <= 1'b0;           \
	q.reg_wr.waddr     <= `ZERO_WORD;     \
	q.reg_wr.wdata     <= `ZERO_WORD;     \
	q.cp0_reg_wr.we    <= 1'b0;           \
	q.cp0_reg_wr.waddr <= `ZERO_WORD;     \
	q.cp0_reg_wr.wdata <= `ZERO_WORD;     \
	q.cp0_reg_wr.sel   <= 3'b0;           \
	q.hilo_wr.we       <= 1'b0;           \
	q.hilo_wr.hilo     <= `ZERO_DWORD;    \
	q.memory_req.ce    <= 1'b0;           \
	q.memory_req.we    <= 1'b0;           \
	q.memory_req.addr  <= `ZERO_WORD;     \
	q.memory_req.wdata <= `ZERO_WORD;     \
	q.except           <= {$bits(ExceptInfo_t){1'b0}};  \
	q.llbit_set        <= 1'b0;           \
	q.tlb_read         <= 1'b0;           \
	q.tlbp             <= 1'b0;           \
	q.tlb_wr           <= 1'b0;           \
	q.tlb_wi           <= 1'b0;

`define RST_DATA_EXMEM(d) \
	d.pc         <= `ZERO_WORD; \
	d.inst       <= `ZERO_WORD; \
	d.op         <= OP_NOP;     \
	d.delayslot  <= 1'b0; 

always @(posedge clk)
begin
	if(rst || flush || (stall.stall_ex && ~stall.stall_mem))
	begin
		`RST_DATA_EXMEM(mem_data_a)
		`RST_DATA_EXMEM(mem_data_b)
		`RST_REQ_EXMEM(mem_req_a)
		`RST_REQ_EXMEM(mem_req_b)
		mem_mmu_data_result <= {$bits(MMUResult_t){1'b0}};
	end else if(~stall.stall_ex) begin
		mem_data_a <= ex_data_a;
		mem_data_b <= ex_data_b;
		mem_req_a  <= ex_req_a;
		mem_req_b  <= ex_req_b;
		mem_mmu_data_result <= ex_mmu_data_result;
	end
end

endmodule
