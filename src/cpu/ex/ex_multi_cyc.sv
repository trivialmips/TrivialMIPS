`include "cpu_defs.svh"

module ex_multi_cyc(
	input  clk, rst,
	input  Oper_t         op,
	input  Word_t         reg1,
	input  Word_t         reg2,
	input  DoubleWord_t   mul_u,
	input  DoubleWord_t   hilo,
	output DoubleWord_t   ret,
	output Bit_t          is_busy
);

/* multiply and add/substract */
DoubleWord_t mul_addsub_tmp;
wire is_mul_addsub;
reg  mul_addsub_finish;
assign is_mul_addsub = (op == OP_MADDU);

always @(posedge clk)
begin
	if(rst)
	begin
		mul_addsub_tmp    <= `ZERO_DWORD;
		mul_addsub_finish <= 1'b0;
	end if(is_mul_addsub) begin
		if(~mul_addsub_finish)
			mul_addsub_tmp <= mul_u;
		mul_addsub_finish <= ~mul_addsub_finish;
	end
end

always_comb
begin
	ret = `ZERO_DWORD;
	if(mul_addsub_finish)
	begin
		case(op)
		OP_MADDU: ret = mul_addsub_tmp + hilo;
		endcase
	end
end

assign is_busy = is_mul_addsub && ~mul_addsub_finish;

endmodule
