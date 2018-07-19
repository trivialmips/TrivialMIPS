`include "cpu_defs.svh"

`define INST(typ, r1, r2, we_, w1) \
begin \
	op = typ; \
	raddr1 = r1; \
	raddr2 = r2; \
	waddr = w1; \
	we = we_; \
end

`define INST_W(typ, r1, r2, w) `INST(typ, r1, r2, 1'b1, w)
`define INST_R(typ, r1, r2) `INST(typ, r1, r2, 1'b0, 5'b0)

module fpu_id(
	input  Inst_t    inst,
	output FPUOper_t op,
	output RegAddr_t raddr1,
	output RegAddr_t raddr2,
	output Bit_t     we,
	output RegAddr_t waddr
);

RegAddr_t ft, fs, fd;
assign ft = inst[20:16];
assign fs = inst[15:11];
assign fd = inst[10:6];

always_comb
begin
	we = 1'b0;
	waddr  = 5'b0;
	raddr1 = 5'b0;
	raddr2 = 5'b0;
	unique case(inst[31:26])
		/* load and store */
		6'b110001: `INST_W(FPU_OP_LW, 5'b0, 5'b0, ft)
		6'b111001: `INST_R(FPU_OP_SW, ft, 5'b0)
		6'b010001:  // COP1
		begin
			unique case(inst[25:21])
			5'b00000: `INST_R(FPU_OP_MFC, 5'b0, fs)
			5'b00010: `INST_R(FPU_OP_CFC, 5'b0, fs)
			5'b00100: `INST_W(FPU_OP_MTC, 5'b0, 5'b0, fs)
			5'b00110: `INST_W(FPU_OP_CTC, 5'b0, 5'b0, fs)
			default: op = FPU_OP_INVALID;
			endcase
		end
		default: op = FPU_OP_INVALID;
	endcase
end

endmodule
