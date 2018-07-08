`include "cpu_defs.svh"

module id_ex(
	input  clk, rst,

	input  PipelineData_t id_data,
	input  PipelineReq_t  id_req,

	output PipelineData_t ex_data,
	output PipelineReq_t  ex_req,

	input  Stall_t    stall,
	input  Bit_t      flush
);

always @(posedge clk)
begin
	if(rst || flush || (stall.stall_id && ~stall.stall_ex))
	begin
		ex_data.op        <= OP_NOP;
		ex_data.pc        <= `ZERO_WORD;
		ex_data.inst      <= `ZERO_WORD;
		ex_data.reg1      <= `ZERO_WORD;
		ex_data.reg2      <= `ZERO_WORD;
		ex_data.imm       <= `ZERO_WORD;
		ex_data.delayslot   <= 1'b0;
		ex_req.reg_wr.we    <= 1'b0;
		ex_req.reg_wr.waddr <= 5'b0;
		ex_req.except.occur <= 1'b0;
	end else if(~stall.stall_id) begin
		ex_data <= id_data;
		ex_req  <= id_req;
	end
end

endmodule
