`include "cpu_defs.svh"

module except(
	input  rst,
	input  InstAddr_t    pc_a,
	input  InstAddr_t    pc_b,
	input  Bit_t         delayslot_a,
	input  Bit_t         delayslot_b,
	input  ExceptInfo_t  except_a,
	input  ExceptInfo_t  except_b,
	input  CP0Regs_t     cp0_regs,
	output ExceptReq_t   except_req
);

InstAddr_t pc;
ExceptInfo_t except;
always_comb
begin
	if(except_a.occur)
	begin
		pc = pc_a;
		except = except_a;
		except_req.alpha_taken = 1'b1;
		except_req.delayslot = delayslot_a;
	end else begin
		pc = pc_b;
		except = except_b;
		except_req.alpha_taken = 1'b0;
		except_req.delayslot = delayslot_b;
	end
end

always_comb
begin
	if(rst || ~except.occur)
	begin
		except_req.flush   = 1'b0;
		except_req.code    = 5'b0;
		except_req.eret    = 1'b0;
		except_req.cur_pc  = `ZERO_WORD;
		except_req.jump_pc = `ZERO_WORD;
		except_req.extra   = `ZERO_WORD;
	end else begin
		except_req.flush  = 1'b1;
		except_req.code   = except.code;
		except_req.cur_pc = pc;
		except_req.eret   = except.eret;
		except_req.extra  = except.extra;
		if(except.eret)
		begin
			if(cp0_regs.status.erl)
				except_req.jump_pc = cp0_regs.error_epc;
			else except_req.jump_pc = cp0_regs.epc;
		end else begin
			HalfWord_t offset;
			if(cp0_regs.status.exl == 1'b0)
			begin
				if(except.code == `EXCCODE_TLBL || except.code == `EXCCODE_TLBS)
				begin
					offset = 16'h000;
				end else if(except.code == `EXCCODE_INT && cp0_regs.cause.iv) begin
					offset = 16'h200;
				end else begin
					offset = 16'h180;
				end
			end else begin
				offset = 16'h180;
			end

			if(cp0_regs.status.bev)
				except_req.jump_pc = 32'hbfc00200 + offset;
			else except_req.jump_pc = 32'h80000000 + offset;
		end
	end
end

endmodule
