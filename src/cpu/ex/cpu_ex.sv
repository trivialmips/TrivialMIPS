`include "cpu_defs.svh"

module cpu_ex(
	input  rst,
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

assign stall_req = 1'b0;

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

// write hilo
always_comb
begin
	if(rst)
	begin
		hilo_wr.we = 1'b0;
		hilo_wr.hilo = `ZERO_DWORD;
	end else begin
		case(op)
			OP_MTHI: begin
				hilo_wr.we = 1'b1;
				hilo_wr.hilo = { reg1, lo };
			end
			OP_MTLO: begin
				hilo_wr.we = 1'b1;
				hilo_wr.hilo = { hi, reg1 };
			end
			default: begin
				hilo_wr.we = 1'b0;
				hilo_wr.hilo = `ZERO_DWORD;
			end
		endcase
	end
end

always_comb
begin
	if(rst == 1'b1)
	begin
		ret = `ZERO_WORD;
	end else begin
		case(op)
		OP_ORI: ret = reg1 | reg2;
		OP_JAL: ret = pc + 32'd8;
		OP_MFHI: ret = hi;
		OP_MFLO: ret = lo;
		default: begin
            ret = `ZERO_WORD;
        end
		endcase
	end
end

endmodule
