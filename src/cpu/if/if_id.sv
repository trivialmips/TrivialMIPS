`include "cpu_defs.svh"

module if_id(
	input  clk, rst,
	input  InstAddr_t if_pc,
	input  Bit_t      if_delayslot,
	input  Inst_t     if_inst,
	output InstAddr_t id_pc,
	output Bit_t      id_delayslot,
	output Inst_t     id_inst,

	input  Stall_t    stall,
	input  Bit_t      flush
);

always @(posedge clk)
begin
	if(rst || flush || (stall.stall_if && ~stall.stall_id))
	begin
		id_pc   <= `ZERO_WORD;
		id_inst <= `ZERO_WORD;
		id_delayslot <= 1'b0;
	end else if(~stall.stall_if) begin
		id_pc   <= if_pc;
		id_inst <= if_inst;
		id_delayslot <= if_delayslot;
	end
end

endmodule
