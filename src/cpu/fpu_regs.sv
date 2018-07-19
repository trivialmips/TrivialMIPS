`include "cpu_defs.svh"

module fpu_regs(
	input  clk, rst,

	// write port
	input  FPURegWriteReq_t wr1,
	input  FPURegWriteReq_t wr2,

	// read port 1
	input  RegAddr_t raddr1,
	output FPUReg_t  rdata1,

	// read port 2
	input  RegAddr_t raddr2,
	output FPUReg_t  rdata2,

	// read port 3
	input  RegAddr_t raddr3,
	output FPUReg_t  rdata3,

	// read port 4
	input  RegAddr_t raddr4,
	output FPUReg_t  rdata4,

	// control registers
	input  Bit_t     fcsr_we,
	input  FCSRReg_t fcsr_wdata,
	output FCSRReg_t fcsr,
	output Word_t    fccr,

	// exception
	input  ExceptReq_t except_req
); 

/* control registers */
FCSRReg_t fcsr_reg;

always_comb
begin
	if(fcsr_we)
	begin
		fcsr = fcsr_wdata;
	end else begin
		fcsr = fcsr_reg;
	end

	if(except_req.flush && except_req.code == `EXCCODE_FPE)
		fcsr.cause = except_req.extra[$bits(FPUExcept_t) - 1:0];
end

// indicates that the single-precision floating point implemented
assign fccr = 32'h00010000;

always @(posedge clk)
begin
	// Note that the reset state is UNDEFINED
	fcsr_reg <= fcsr;
end

/* floating-point registers */
reg [31:0] registers[0:`REG_NUM - 1];
reg [$bits(FPURegFormat_t) - 1:0] registers_fmt[0:`REG_NUM - 1];

// write control
genvar i;
generate
	for(i = 0; i < `REG_NUM; i = i + 1)
	begin: gen_fpu_reg_assign
		always @(posedge clk)
		begin
			if(rst)
			begin
				registers[i]     <= `ZERO_WORD;
				registers_fmt[i] <= `FPU_REG_UNKNOWN;
			end else if(wr2.we && wr2.waddr == i) begin
				registers[i]     <= wr2.wdata.val;
				registers_fmt[i] <= wr2.wdata.fmt;
			end else if(wr1.we && wr1.waddr == i) begin
				registers[i]     <= wr1.wdata.val;
				registers_fmt[i] <= wr1.wdata.fmt;
			end
		end
	end
endgenerate

// read control 1
always_comb
begin
	if(rst == 1'b1)
	begin
		rdata1.val = `ZERO_WORD;
		rdata1.fmt = `FPU_REG_UNKNOWN;
	end else if(wr2.we && raddr1 == wr2.waddr) begin
		rdata1 = wr2.wdata;
	end else if(wr1.we && raddr1 == wr1.waddr) begin
		rdata1 = wr1.wdata;
	end else begin
		rdata1.val = registers[raddr1];
		rdata1.fmt = registers_fmt[raddr1];
	end
end

// read control 2
always_comb
begin
	if(rst == 1'b1)
	begin
		rdata2.val = `ZERO_WORD;
		rdata2.fmt = `FPU_REG_UNKNOWN;
	end else if(wr2.we && raddr2 == wr2.waddr) begin
		rdata2 = wr2.wdata;
	end else if(wr1.we && raddr2 == wr1.waddr) begin
		rdata2 = wr1.wdata;
	end else begin
		rdata2.val = registers[raddr2];
		rdata2.fmt = registers_fmt[raddr2];
	end
end

// read control 3
always_comb
begin
	if(rst == 1'b1)
	begin
		rdata3.val = `ZERO_WORD;
		rdata3.fmt = `FPU_REG_UNKNOWN;
	end else if(wr2.we && raddr3 == wr2.waddr) begin
		rdata3 = wr2.wdata;
	end else if(wr1.we && raddr3 == wr1.waddr) begin
		rdata3 = wr1.wdata;
	end else begin
		rdata3.val = registers[raddr3];
		rdata3.fmt = registers_fmt[raddr3];
	end
end

// read control 4
always_comb
begin
	if(rst == 1'b1)
	begin
		rdata4.val = `ZERO_WORD;
		rdata4.fmt = `FPU_REG_UNKNOWN;
	end else if(wr2.we && raddr4 == wr2.waddr) begin
		rdata4 = wr2.wdata;
	end else if(wr1.we && raddr4 == wr1.waddr) begin
		rdata4 = wr1.wdata;
	end else begin
		rdata4.val = registers[raddr4];
		rdata4.fmt = registers_fmt[raddr4];
	end
end

endmodule
