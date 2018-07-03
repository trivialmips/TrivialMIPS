`include "cpu_defs.svh"

module inst_dbus(
	input  clk, rst,
	input  WishboneReq_t dbus_req,
	output WishboneRes_t dbus_res
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
	if(rst == 1'b1 || dbus_req.cyc == 1'b0 || dbus_req.stb == 1'b0)
	begin
		dbus_res.data = `ZERO_WORD;
	end else begin
		dbus_res.data = inst_ram[dbus_req.addr[15:2]];
	end
end

always_comb
begin
	if(dbus_req.we && dbus_req.cyc && dbus_req.stb)
	begin
		data_w = inst_ram[dbus_req.addr[15:2]];
		if(dbus_req.sel[0]) data_w[7:0]   = dbus_req.data[7:0];
		if(dbus_req.sel[1]) data_w[15:8]  = dbus_req.data[15:8];
		if(dbus_req.sel[2]) data_w[23:16] = dbus_req.data[23:16];
		if(dbus_req.sel[3]) data_w[31:24] = dbus_req.data[31:24];
	end else data_w = `ZERO_WORD;
end

always @(posedge clk)
begin
	if(dbus_req.cyc && dbus_req.stb && dbus_req.we) begin
		inst_ram[dbus_req.addr[15:2]] <= data_w;
	end
end

endmodule 
