`include "cpu_defs.svh"

module ex_mem(
	input  clk, rst,

	input  RegWriteReq_t  ex_reg_wr,
	input  HiloWriteReq_t ex_hilo_wr,
	output RegWriteReq_t  mem_reg_wr,
	output HiloWriteReq_t mem_hilo_wr,

	input  Stall_t       stall
);

always @(posedge clk)
begin
	if(rst == 1'b1 || (stall.stall_ex && ~stall.stall_mem))
	begin
		mem_reg_wr.we    <= 1'b0;
		mem_reg_wr.waddr <= `ZERO_WORD;
		mem_reg_wr.wdata <= `ZERO_WORD;
		mem_hilo_wr.we   <= 1'b0;
		mem_hilo_wr.hilo <= `ZERO_DWORD;
	end else if(~stall.stall_ex) begin
		mem_reg_wr  <= ex_reg_wr;
		mem_hilo_wr <= ex_hilo_wr;
	end
end

endmodule
