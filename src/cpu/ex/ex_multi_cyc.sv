`include "cpu_defs.svh"

module ex_multi_cyc(
	input  clk, rst,
	input  Oper_t         op,
	input  Word_t         reg1,
	input  Word_t         reg2,
	input  DoubleWord_t   hilo,
	output DoubleWord_t   ret,
	output Bit_t          is_busy
);

/* multiply */
Bit_t is_signed;
assign is_signed = (
	op == OP_MADD ||
	op == OP_MSUB ||
	op == OP_MUL  ||
	op == OP_MULT
);

Word_t abs_reg1, abs_reg2;
assign abs_reg1 = (is_signed && reg1[31]) ? -reg1 : reg1;
assign abs_reg2 = (is_signed && reg2[31]) ? -reg2 : reg2;

DoubleWord_t mul_abs, mul_result;
assign mul_abs = abs_reg1 * abs_reg2;
assign mul_result = (is_signed && (reg1[31] ^ reg2[31])) ? -mul_abs : mul_abs;

/* multiply and add/substract */
DoubleWord_t mul_addsub_tmp;
wire is_mul_addsub;
reg  mul_addsub_finish;
assign is_mul_addsub = (
	op == OP_MADDU ||
	op == OP_MADD || 
	op == OP_MSUBU ||
	op == OP_MSUB
);

always @(posedge clk)
begin
	if(rst)
	begin
		mul_addsub_tmp    <= `ZERO_DWORD;
		mul_addsub_finish <= 1'b0;
	end if(is_mul_addsub) begin
		if(~mul_addsub_finish)
			mul_addsub_tmp <= mul_result;
		mul_addsub_finish <= ~mul_addsub_finish;
	end
end

/* set result */
always_comb
begin
	case(op)
	OP_MADDU, OP_MADD: ret = hilo + mul_addsub_tmp;
	OP_MSUBU, OP_MSUB: ret = hilo - mul_addsub_tmp;
	default: ret = mul_result;
	endcase
end

assign is_busy = is_mul_addsub && ~mul_addsub_finish;

endmodule
