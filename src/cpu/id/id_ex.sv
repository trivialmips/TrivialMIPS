`include "cpu_defs.svh"

module id_ex(
	input  clk, rst,
	// signals from id
	input  Oper_t     id_op,
	input  InstAddr_t id_pc,
	input  Word_t     id_reg1,
	input  Word_t     id_reg2,
	input  Bit_t      id_reg_we,
	input  RegAddr_t  id_reg_waddr,
	// signals to ex
	output Oper_t     ex_op,
	output InstAddr_t ex_pc,
	output Word_t     ex_reg1,
	output Word_t     ex_reg2,
	output Bit_t      ex_reg_we,
	output RegAddr_t  ex_reg_waddr
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		ex_op        <= OP_NOP;
		ex_pc        <= `ZERO_WORD;
		ex_reg1      <= `ZERO_WORD;
		ex_reg2      <= `ZERO_WORD;
		ex_reg_we    <= 1'b0;
		ex_reg_waddr <= 5'b0;
	end else begin
		ex_op        <= id_op;
		ex_pc        <= id_pc;
		ex_reg1      <= id_reg1;
		ex_reg2      <= id_reg2;
		ex_reg_we    <= id_reg_we;
		ex_reg_waddr <= id_reg_waddr;
	end
end

endmodule
