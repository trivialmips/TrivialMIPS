`include "cpu_defs.svh"

module ex_mem(
	input  clk, rst,

	input  Bit_t      ex_reg_we,
	input  RegAddr_t  ex_reg_waddr,
	input  Word_t     ex_reg_wdata,

	output Bit_t      mem_reg_we,
	output RegAddr_t  mem_reg_waddr,
	output Word_t     mem_reg_wdata
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		mem_reg_we    <= 1'b0;
		mem_reg_waddr <= `ZERO_WORD;
		mem_reg_wdata <= `ZERO_WORD;
	end else begin
		mem_reg_we    <= ex_reg_we;
		mem_reg_waddr <= ex_reg_waddr;
		mem_reg_wdata <= ex_reg_wdata;
	end
end

endmodule
