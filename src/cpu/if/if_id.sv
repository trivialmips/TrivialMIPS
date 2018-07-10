`include "cpu_defs.svh"

module if_id(
	input  clk, rst,
	input  InstAddr_t if_pc,
	input  Bit_t      if_delayslot,
	input  InstPair_t if_inst_pair,
	output InstAddr_t id_pc,
	output Bit_t      id_delayslot,

	output Bit_t      id_inst_left,
	output InstPair_t id_inst_pair_new,
	output InstPair_t id_inst_pair_old,

	input  Bit_t      is_ahead,
	input  Bit_t      is_hard_reset,
	input  InstPair_t inst_pair_forward,
	input  Stall_t    stall,
	input  Bit_t      flush
);

// TODO: Solve the case when 'sw' writes to the address to be read in IF
// stage.

always @(posedge clk)
begin
	if(rst || flush || (stall.stall_if && ~stall.stall_id))
	begin
		id_pc              <= `ZERO_WORD;
		id_delayslot       <= 1'b0;
		id_inst_pair_new.inst1 <= `ZERO_WORD;
		id_inst_pair_new.inst2 <= `ZERO_WORD;
		id_inst_pair_new.inst2_taken <= `ZERO_WORD;
		id_inst_pair_old.inst1 <= `ZERO_WORD;
		id_inst_pair_old.inst2 <= `ZERO_WORD;
		id_inst_pair_old.inst2_taken <= `ZERO_WORD;
	end else if(~stall.stall_if) begin
		id_delayslot <= if_delayslot;
/*		if(~inst_pair_forward.inst2_taken && ~is_hard_reset)
		begin
			id_inst_pair.inst1 <= inst_pair_forward.inst2;
			id_inst_pair.inst2 <= if_inst_pair.inst1;
		end else begin
			id_inst_pair <= if_inst_pair;
		end */
		id_inst_pair_new <= if_inst_pair;
		id_inst_pair_old <= inst_pair_forward;
		id_inst_left <= ~inst_pair_forward.inst2_taken & ~is_hard_reset;

		if(is_ahead)
		begin
			id_pc <= if_pc - 32'h4;
		end else begin
			id_pc <= if_pc;
		end
	end
end

endmodule
