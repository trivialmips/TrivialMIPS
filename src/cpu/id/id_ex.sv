`include "cpu_defs.svh"

module id_ex(
	input  clk, rst,
	// signals from id
	input  Oper_t     id_op,
	input  Word_t     id_rs,
	input  Word_t     id_rt,
	input  Word_t     id_rd,
	input  Word_t     id_imm,
	input  Bit_t      id_reg_we,
	input  RegAddr_t  id_reg_waddr,
	// signals to ex
	output Oper_t     ex_op,
	output Word_t     ex_rs,
	output Word_t     ex_rt,
	output Word_t     ex_rd,
	output Word_t     ex_imm,
	output Bit_t      ex_reg_we,
	output RegAddr_t  ex_reg_waddr,
);

endmodule
