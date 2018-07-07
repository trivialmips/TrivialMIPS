`include "cpu_defs.svh"

module fake_data_bus(
	input  clk, rst,
	Bus_if.slave data_bus
);

`define MEM_SIZE 8192
reg [31:0] inst_ram[`MEM_SIZE - 1:0];

initial
begin
	integer i;
	for(i = 0; i < `MEM_SIZE; i = i + 1)
		inst_ram[i] = `ZERO_WORD;
end

Word_t data_w;

always_comb
begin
	if(rst == 1'b1 || data_bus.read == 1'b0)
	begin
		data_bus.data_rd = `ZERO_WORD;
	end else begin
		data_bus.data_rd = inst_ram[data_bus.address[13:0]];
	end
end

always_comb
begin
	if(data_bus.write)
	begin
		data_w = inst_ram[data_bus.address[13:0]];
		if(data_bus.mask[0]) data_w[7:0]   = data_bus.data_wr[7:0];
		if(data_bus.mask[1]) data_w[15:8]  = data_bus.data_wr[15:8];
		if(data_bus.mask[2]) data_w[23:16] = data_bus.data_wr[23:16];
		if(data_bus.mask[3]) data_w[31:24] = data_bus.data_wr[31:24];
	end else data_w = `ZERO_WORD;
end

always @(posedge clk)
begin
	if(data_bus.write) begin
		inst_ram[data_bus.address[13:0]] <= data_w;
	end
end

endmodule 
