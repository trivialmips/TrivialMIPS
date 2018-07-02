`include "cpu_defs.svh"

module cpu_id(
	input  rst,
	input  InstAddr_t pc,
	input  Inst_t     inst,

	input  Word_t     reg1_i,
	input  Word_t     reg2_i,

	output RegAddr_t  reg_raddr1,
	output RegAddr_t  reg_raddr2,

	output Oper_t     op,
	output Word_t     reg1_o,
	output Word_t     reg2_o,
	// whether to write register
	output Bit_t      reg_we,
	// the address of register to be written
	output RegAddr_t  reg_waddr
);

endmodule
