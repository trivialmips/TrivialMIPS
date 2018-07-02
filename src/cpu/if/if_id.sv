`include "cpu_defs.svh"

module if_id(
	input  clk, rst,
	input  InstAddr_t if_pc,
	input  Inst_t     if_inst,
	output InstAddr_t id_pc,
	output Inst_t     id_inst
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		id_pc   <= `ZERO_WORD;
		id_inst <= `ZERO_WORD;
	end else begin
		id_pc   <= if_pc;
		id_inst <= if_inst;
	end
end

endmodule
