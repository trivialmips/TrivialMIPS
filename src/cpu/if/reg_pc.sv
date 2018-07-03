`include "cpu_defs.svh"

module reg_pc(
	input  clk, rst,
	input  Bit_t      jump,
	input  InstAddr_t jump_to,
	output Bit_t      ce,
	output InstAddr_t pc
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
	if(ce == 1'b0)
	begin
		pc <= 32'h0;
	end else begin
		pc <= jump ? jump_to : pc + 32'h4;
	end
end

endmodule
