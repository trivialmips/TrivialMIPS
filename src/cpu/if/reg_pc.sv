`include "cpu_defs.svh"

module reg_pc(
	input  clk, rst,
	input  Bit_t       hold_pc,
	input  Bit_t       jump,
	input  InstAddr_t  jump_to,
	input  ExceptReq_t except_req,
	output Bit_t       ce,
	output InstAddr_t  pc
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		ce <= 1'b0;
	end else begin
		ce <= 1'b1;
	end
end

always @(posedge clk)
begin
	if (ce == 1'b0)
	begin
		pc <= `PC_RESET_VECTOR;
	end else if(except_req.flush) begin
		pc <= except_req.jump_pc;
	end else if(~hold_pc) begin
		pc <= jump ? jump_to : pc + 32'h4;
	end else begin
		pc <= pc;
	end
end

endmodule
