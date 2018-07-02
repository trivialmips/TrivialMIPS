`include "cpu_defs.svh"

module regs(
	input  clk, rst,

	// write port
	input  RegWriteReq_t wr,

	// read port 1
	input  RegAddr_t raddr1,
	output Word_t    rdata1,

	// read port 2
	input  RegAddr_t raddr2,
	output Word_t    rdata2
); 

reg [`REG_DATA_WIDTH - 1:0] registers[0:`REG_NUM - 1];

Bit_t we;
RegAddr_t waddr;
Word_t wdata;
assign we    = wr.we;
assign waddr = wr.waddr;
assign wdata = wr.wdata;

// write control
always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		registers[0]  <= `ZERO_WORD;
		registers[1]  <= `ZERO_WORD;
		registers[2]  <= `ZERO_WORD;
		registers[3]  <= `ZERO_WORD;
		registers[4]  <= `ZERO_WORD;
		registers[5]  <= `ZERO_WORD;
		registers[6]  <= `ZERO_WORD;
		registers[7]  <= `ZERO_WORD;
		registers[8]  <= `ZERO_WORD;
		registers[9]  <= `ZERO_WORD;
		registers[10] <= `ZERO_WORD;
		registers[11] <= `ZERO_WORD;
		registers[12] <= `ZERO_WORD;
		registers[13] <= `ZERO_WORD;
		registers[14] <= `ZERO_WORD;
		registers[15] <= `ZERO_WORD;
		registers[16] <= `ZERO_WORD;
		registers[17] <= `ZERO_WORD;
		registers[18] <= `ZERO_WORD;
		registers[19] <= `ZERO_WORD;
		registers[20] <= `ZERO_WORD;
		registers[21] <= `ZERO_WORD;
		registers[22] <= `ZERO_WORD;
		registers[23] <= `ZERO_WORD;
		registers[24] <= `ZERO_WORD;
		registers[25] <= `ZERO_WORD;
		registers[26] <= `ZERO_WORD;
		registers[27] <= `ZERO_WORD;
		registers[28] <= `ZERO_WORD;
		registers[29] <= `ZERO_WORD;
		registers[30] <= `ZERO_WORD;
		registers[31] <= `ZERO_WORD;
	end else if(we == 1'b1 && waddr != 5'b0) begin
		// $0 is always zero
		registers[waddr] <= wdata;
	end
end

// read control 1
always_comb
begin
	if(rst == 1'b1 || raddr1 == 5'b0)
	begin
		rdata1 = `ZERO_WORD;
	end else if(we == 1'b1 && raddr1 == waddr) begin
		rdata1 = wdata;
	end else rdata1 = registers[raddr1];
end

// read control 2
always_comb
begin
	if(rst == 1'b1 || raddr2 == 5'b0)
	begin
		rdata2 = `ZERO_WORD;
	end else if(we == 1'b1 && raddr2 == waddr) begin
		rdata2 = wdata;
	end else rdata2 = registers[raddr2];
end

endmodule
