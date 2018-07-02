`include "cpu_defs.svh"

module mem_wb(
	input  clk, rst,

	input  Bit_t      mem_reg_we,
	input  RegAddr_t  mem_reg_waddr,
	input  Word_t     mem_reg_wdata,

	output Bit_t      wb_reg_we,
	output RegAddr_t  wb_reg_waddr,
	output Word_t     wb_reg_wdata
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		wb_reg_we    <= 1'b0;
		wb_reg_waddr <= `ZERO_WORD;
		wb_reg_wdata <= `ZERO_WORD;
	end else begin
		wb_reg_we    <= mem_reg_we;
		wb_reg_waddr <= mem_reg_waddr;
		wb_reg_wdata <= mem_reg_wdata;
	end
end

endmodule
