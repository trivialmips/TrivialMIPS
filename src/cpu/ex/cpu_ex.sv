`include "cpu_defs.svh"

module cpu_ex(
	input  clk, rst,
	input  Oper_t         op,
	input  InstAddr_t     pc,
	input  Word_t         reg1,
	input  Word_t         reg2,
	input  Word_t         imm,
	input  DoubleWord_t   hilo_unsafe,
	input  HiloWriteReq_t mem_hilo_wr,
	output HiloWriteReq_t hilo_wr,
	output MemAccessReq_t memory_req,
	output Word_t         ret,
	output Bit_t          stall_req,
	output ExceptInfo_t   except
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

// unsigned register arithmetic
DoubleWord_t mul_u;
assign mul_u = reg1 * reg2;

// memory operation
Bit_t is_load_memory_inst;
Bit_t is_save_memory_inst;
assign is_load_memory_inst = (op == OP_LW);
assign is_save_memory_inst = (op == OP_SW);
assign memory_req.ce = is_load_memory_inst | is_save_memory_inst;
assign memory_req.we = is_save_memory_inst;
assign memory_req.addr = reg1 + imm;
assign memory_req.wdata = reg2;
always_comb
begin
	if(op == OP_LW || op == OP_SW)
	begin
		memory_req.sel = 4'b1111;
	end else begin
		memory_req.sel = 4'b0000;
	end
end

// whether to write hilo
Bit_t we_hilo;
assign we_hilo = (
	op == OP_MTHI ||
	op == OP_MTLO ||
	op == OP_MADDU
);

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
		hilo_wr.we = we_hilo;
		hilo_wr.hilo = hilo_safe;

		case(op)
		OP_ORI: ret = reg1 | imm;
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
