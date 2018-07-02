`include "cpu_defs.svh"

module reg_pc(
	input  clk, rst,
	output InstAddr_t pc
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		pc <= 32'h0;
	end else begin
		pc <= pc + 32'h4;
	end
end

endmodule
