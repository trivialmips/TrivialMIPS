`include "cpu_defs.svh"

module id_ex(
	input  clk, rst,
	// signals from id
	input  Oper_t     id_op,
	input  InstAddr_t id_pc,
	input  Inst_t     id_inst,
	input  Word_t     id_reg1,
	input  Word_t     id_reg2,
	input  Word_t     id_imm,
	input  Bit_t      id_reg_we,
	input  Bit_t      id_delayslot,
	input  RegAddr_t  id_reg_waddr,
	input  ExceptInfo_t id_except,
	// signals to ex
	output Oper_t     ex_op,
	output InstAddr_t ex_pc,
	output Inst_t     ex_inst,
	output Word_t     ex_reg1,
	output Word_t     ex_reg2,
	output Word_t     ex_imm,
	output Bit_t      ex_reg_we,
	output Bit_t      ex_delayslot,
	output RegAddr_t  ex_reg_waddr,
	output ExceptInfo_t ex_except,

	input  Stall_t    stall,
	input  Bit_t      flush
);

always @(posedge clk)
begin
	if(rst || flush || (stall.stall_id && ~stall.stall_ex))
	begin
		ex_op        <= OP_NOP;
		ex_pc        <= `ZERO_WORD;
		ex_inst      <= `ZERO_WORD;
		ex_reg1      <= `ZERO_WORD;
		ex_reg2      <= `ZERO_WORD;
		ex_imm       <= `ZERO_WORD;
		ex_reg_we    <= 1'b0;
		ex_reg_waddr <= 5'b0;
		ex_delayslot <= 1'b0;
		ex_except.occur <= 1'b0;
	end else if(~stall.stall_id) begin
		ex_op        <= id_op;
		ex_pc        <= id_pc;
		ex_inst      <= id_inst;
		ex_reg1      <= id_reg1;
		ex_reg2      <= id_reg2;
		ex_imm       <= id_imm;
		ex_reg_we    <= id_reg_we;
		ex_reg_waddr <= id_reg_waddr;
		ex_delayslot <= id_delayslot;
		ex_except    <= id_except;
	end
end

endmodule
