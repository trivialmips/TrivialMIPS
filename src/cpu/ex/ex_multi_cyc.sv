`include "cpu_defs.svh"

module ex_multi_cyc(
	input  clk, rst,
	input  Bit_t          flush,
	input  Oper_t         op,
	input  Word_t         reg1,
	input  Word_t         reg2,
	input  DoubleWord_t   hilo,
	output DoubleWord_t   ret,
	output Bit_t          is_busy
);

parameter DIV_CYC = 36;

/* cycle control */
logic [5:0] cyc_number;
logic [DIV_CYC:0] cyc_stage;
assign is_busy = (cyc_number != 1 && ~cyc_stage[0]);
always @(posedge clk)
begin
	if(rst || flush) 
	begin
		cyc_stage <= 0;
	end else if(cyc_stage != 0) begin
		cyc_stage <= cyc_stage >> 1;
	end else begin
		cyc_stage <= ((1 << cyc_number) >> 2);
	end
end

always_comb
begin
	if(rst || flush)
	begin
		cyc_number = 1;
	end else begin
		unique case(op)
		OP_MADD, OP_MADDU, OP_MSUB, OP_MSUBU, OP_MUL:
			cyc_number = 2;
		OP_DIV, OP_DIVU:
			cyc_number = DIV_CYC;
		default:
			cyc_number = 1;
		endcase
	end
end

/* signed setting */
Bit_t is_signed, negate_result;
assign is_signed = (
	op == OP_MADD ||
	op == OP_MSUB ||
	op == OP_MUL  ||
	op == OP_MULT ||
	op == OP_DIV
);
assign negate_result = is_signed && (reg1[31] ^ reg2[31]);

Word_t abs_reg1, abs_reg2;
assign abs_reg1 = (is_signed && reg1[31]) ? -reg1 : reg1;
assign abs_reg2 = (is_signed && reg2[31]) ? -reg2 : reg2;

/* multiply */
DoubleWord_t mul_abs, mul_result;
assign mul_abs = abs_reg1 * abs_reg2;
assign mul_result = negate_result ? -mul_abs : mul_abs;

/* division */
Word_t abs_quotient, abs_remainder;
Word_t div_quotient, div_remainder;

/* Note that the document of MIPS32 says if the divisor is zero,
 * the result is UNDEFINED. */
div_uu #(
	.z_width(64)
) div_uu_instance (
	.clk,
	.ena(op == OP_DIV || op == OP_DIVU),
	.z( { 32'b0, abs_reg1 } ),
	.d(abs_reg2),
	.q(abs_quotient),
	.s(abs_remainder)
);

/* |b| = |aq| + |r|
 *   1) b > 0, a < 0 ---> b = (-a)(-q) + r
 *   2) b < 0, a > 0 ---> -b = a(-q) + (-r) */
assign div_quotient  = negate_result ? -abs_quotient : abs_quotient;
assign div_remainder = (is_signed && (reg1[31] ^ abs_remainder[31])) ? -abs_remainder : abs_remainder;

/* set result */
always_comb
begin
	unique case(op)
		OP_MADDU, OP_MADD: ret = hilo + mul_result;
		OP_MSUBU, OP_MSUB: ret = hilo - mul_result;
		OP_DIV, OP_DIVU: ret = { div_remainder, div_quotient };
		default: ret = mul_result;
	endcase
end

endmodule
