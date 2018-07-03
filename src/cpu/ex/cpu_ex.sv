`include "cpu_defs.svh"

module cpu_ex(
	input  clk, rst,
	input  Oper_t         op,
	input  InstAddr_t     pc,
	input  Word_t         reg1,
	input  Word_t         reg2,
	input  DoubleWord_t   hilo_unsafe,
	input  HiloWriteReq_t mem_hilo_wr,
	output HiloWriteReq_t hilo_wr,
	output Word_t         ret,
	output Bit_t          stall_req
);

DoubleWord_t hilo_safe;
Word_t hi, lo;
assign { hi, lo } = hilo_safe;
always_comb
begin
	if(rst)
	begin
		hilo_safe = `ZERO_DWORD;
	end else if(mem_hilo_wr.we) begin
		hilo_safe = mem_hilo_wr.hilo;
	end else begin
		hilo_safe = hilo_unsafe;
	end
end

DoubleWord_t mul_u;
assign mul_u = reg1 * reg2;

DoubleWord_t multi_cyc_ret;
ex_multi_cyc multi_cyc_instance(
	.clk,
	.rst,
	.op,
	.reg1,
	.reg2,
	.mul_u,
	.hilo(hilo_safe),
	.ret(multi_cyc_ret),
	.is_busy(stall_req)
);

always_comb
begin
	if(rst == 1'b1)
	begin
		ret = `ZERO_WORD;
		hilo_wr.we = 1'b0;
		hilo_wr.hilo = `ZERO_DWORD;
	end else begin
		hilo_wr.we = 1'b1;
		hilo_wr.hilo = hilo_safe;

		case(op)
		OP_ORI: ret = reg1 | reg2;
		OP_JAL: ret = pc + 32'd8;
		OP_MFHI: ret = hi;
		OP_MFLO: ret = lo;
		OP_MTHI: hilo_wr.hilo = { reg1, lo };
		OP_MTLO: hilo_wr.hilo = { hi, reg1 };
		OP_MADDU: hilo_wr.hilo = multi_cyc_ret;
		default: begin
            ret = `ZERO_WORD;
        end
		endcase
	end
end

endmodule
