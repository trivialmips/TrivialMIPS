`include "cpu_defs.svh"

module if_id(
	input  clk, rst,
	input  InstAddr_t if_pc,
	input  Inst_t     if_inst,
	output InstAddr_t id_pc,
	output Inst_t     id_inst
);

endmodule
