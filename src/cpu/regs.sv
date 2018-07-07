`include "cpu_defs.svh"

module regs(
	input  clk, rst,

	// write port
	input  RegWriteReq_t wr1,
	input  RegWriteReq_t wr2,

	// read port 1
	input  RegAddr_t raddr1,
	output Word_t    rdata1,

	// read port 2
	input  RegAddr_t raddr2,
	output Word_t    rdata2,

	// read port 3
	input  RegAddr_t raddr3,
	output Word_t    rdata3,

	// read port 4
	input  RegAddr_t raddr4,
	output Word_t    rdata4
); 

reg [`REG_DATA_WIDTH - 1:0] registers[0:`REG_NUM - 1];

Word_t wdata1, wdata2;
assign wdata1 = (wr1.waddr != 5'b0) ? wr1.wdata : `ZERO_WORD;
assign wdata2 = (wr2.waddr != 5'b0) ? wr2.wdata : `ZERO_WORD;

// write control
genvar i;
generate
	for(i = 0; i < `REG_NUM; i = i + 1)
	begin: gen_reg_assign
		always @(posedge clk)
		begin
			if(rst)
			begin
				registers[i] <= `ZERO_WORD;
			end else begin
				if(wr2.we && wr2.waddr == i)
				begin
					registers[i] <= wdata2;
				end else if(wr1.we && wr1.waddr == i) begin
					registers[i] <= wdata1;
				end
			end
		end
	end
endgenerate

// read control 1
always_comb
begin
	if(rst == 1'b1 || raddr1 == 5'b0)
	begin
		rdata1 = `ZERO_WORD;
	end else if(wr2.we && raddr1 == wr2.waddr) begin
		rdata1 = wr2.wdata;
	end else if(wr1.we && raddr1 == wr1.waddr) begin
		rdata1 = wr1.wdata;
	end else rdata1 = registers[raddr1];
end

// read control 2
always_comb
begin
	if(rst == 1'b1 || raddr2 == 5'b0)
	begin
		rdata2 = `ZERO_WORD;
	end else if(wr2.we && raddr2 == wr2.waddr) begin
		rdata2 = wr2.wdata;
	end else if(wr1.we && raddr2 == wr1.waddr) begin
		rdata2 = wr1.wdata;
	end else rdata2 = registers[raddr2];
end

// read control 3
always_comb
begin
	if(rst == 1'b1 || raddr3 == 5'b0)
	begin
		rdata3 = `ZERO_WORD;
	end else if(wr2.we && raddr3 == wr2.waddr) begin
		rdata3 = wr2.wdata;
	end else if(wr1.we && raddr3 == wr1.waddr) begin
		rdata3 = wr1.wdata;
	end else rdata3 = registers[raddr3];
end

// read control 4
always_comb
begin
	if(rst == 1'b1 || raddr4 == 5'b0)
	begin
		rdata4 = `ZERO_WORD;
	end else if(wr2.we && raddr4 == wr2.waddr) begin
		rdata4 = wr2.wdata;
	end else if(wr1.we && raddr4 == wr1.waddr) begin
		rdata4 = wr1.wdata;
	end else rdata4 = registers[raddr4];
end

endmodule
