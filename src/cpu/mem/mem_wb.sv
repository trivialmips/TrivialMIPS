`include "cpu_defs.svh"

module mem_wb(
	input  clk, rst,

	input  RegWriteReq_t  mem_reg_wr,
	input  HiloWriteReq_t mem_hilo_wr,
	output RegWriteReq_t  wb_reg_wr,
	output HiloWriteReq_t wb_hilo_wr,

	input  Stall_t       stall
);

always @(posedge clk)
begin
	if(rst == 1'b1 || (stall.stall_mem && ~stall.stall_wb))
	begin
		wb_reg_wr.we    <= 1'b0;
		wb_reg_wr.waddr <= `ZERO_WORD;
		wb_reg_wr.wdata <= `ZERO_WORD;
		wb_hilo_wr.we   <= 1'b0;
		wb_hilo_wr.hilo <= `ZERO_DWORD;
	end else if(~stall.stall_mem) begin
		wb_reg_wr  <= mem_reg_wr;
		wb_hilo_wr <= mem_hilo_wr;
	end
end

endmodule
