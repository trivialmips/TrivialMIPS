`include "cpu_defs.svh"

module cpu_id(
	input  rst,
	input  InstAddr_t pc,
	input  Inst_t     inst,
	output Oper_t     op,
	output Word_t     reg_s,
	output Word_t     reg_t,
	output Word_t     reg_d,
	// immediate number
	output Word_t     imm,
	// whether to write register
	output Bit_t      reg_we,
	// the address of register to be written
	output RegAddr_t  reg_waddr
);

endmodule
