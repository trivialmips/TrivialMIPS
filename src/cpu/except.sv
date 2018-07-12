`include "cpu_defs.svh"

module except(
	input  rst,
	input  PipelineData_t data_a,
	input  PipelineData_t data_b,
	input  ExceptInfo_t  except_a,
	input  ExceptInfo_t  except_b,
	input  CP0Regs_t     cp0_regs_unsafe,
	input  Bit_t         is_user_mode,
	input  MemAddr_t     data_vaddr,
	input  Bit_t         memory_data_we,
	input  CP0RegWriteReq_t wb_cp0_reg_wr,
	input  wire [7:0]    interrupt_flag,
	output ExceptReq_t   except_req
);

Word_t wb_cp0_reg_wmask, wb_cp0_reg_wdata;
cp0_write_mask cp0_write_mask_instance(
	.rst,
	.sel(wb_cp0_reg_wr.sel),
	.addr(wb_cp0_reg_wr.waddr),
	.mask(wb_cp0_reg_wmask)
);

CP0Regs_t cp0_regs;
always_comb
begin
	cp0_regs = cp0_regs_unsafe;
	if(wb_cp0_reg_wr.we)
	begin
		wb_cp0_reg_wdata = cp0_regs[wb_cp0_reg_wr.waddr * `REG_DATA_WIDTH +: 32];
		wb_cp0_reg_wdata = (wb_cp0_reg_wr.wdata & wb_cp0_reg_wmask) | (wb_cp0_reg_wdata & ~wb_cp0_reg_wmask);
		cp0_regs[wb_cp0_reg_wr.waddr * `REG_DATA_WIDTH +: 32] = wb_cp0_reg_wdata;
	end
end

InstAddr_t pc;
ExceptInfo_t except;

Bit_t interrupt_occur;
assign interrupt_occur = (
	// TODO: check whether DM bit in debug is zero
	cp0_regs.status.ie &&
	~cp0_regs.status.exl && ~cp0_regs.status.erl &&
	interrupt_flag != 8'b0
);

Bit_t except_occur;
logic [4:0] except_code;
always_comb
begin
	except = except_a | except_b;
	except.priv_inst = except.priv_inst & is_user_mode;
	except_occur = (|except) | interrupt_occur;
	except_req.extra = `ZERO_WORD;

	// see MIPS32 Spec Vol3 Sec6.2.1 for exception priority
	if(interrupt_occur)
	begin
		except_code = `EXCCODE_INT;
		except_req.alpha_taken = 1'b1;
		except_req.extra = interrupt_flag;
		//$display("[Exception] Interrupt");
	end else if(except.iaddr_illegal) begin
		except_code = `EXCCODE_ADEL;
		except_req.alpha_taken = except_a.iaddr_illegal;
		except_req.extra = except_req.alpha_taken ? data_a.pc : data_b.pc;
		//$display("[Exception] Illegal Instruction Address");
	end else if(except.iaddr_miss) begin
		except_code = `EXCCODE_TLBL;
		except_req.alpha_taken = except_a.iaddr_miss;
		except_req.extra = except_req.alpha_taken ? data_a.pc : data_b.pc;
		//$display("[Exception] TLB Miss (pcruction)");
	end else if(except.iaddr_invalid) begin
		except_code = `EXCCODE_TLBL;
		except_req.alpha_taken = except_a.iaddr_invalid;
		except_req.extra = except_req.alpha_taken ? data_a.pc : data_b.pc;
		//$display("[Exception] TLB Invalid (instruction)");
	end else if(except.syscall) begin
		except_code = `EXCCODE_SYS;
		except_req.alpha_taken = except_a.syscall;
		//$display("[Exception] Syscall");
	end else if(except.break_) begin
		except_code = `EXCCODE_BP;
		except_req.alpha_taken = except_a.break_;
		//$display("[Exception] Breakpoint");
	end else if(except.overflow) begin
		except_code = `EXCCODE_OV;
		except_req.alpha_taken = except_a.overflow;
		//$display("[Exception] Overflow");
	end else if(except.trap) begin
		except_code = `EXCCODE_TR;
		except_req.alpha_taken = except_a.trap;
		//$display("[Exception] Trap");
	end else if(except.eret) begin
		except_code = 5'b0;
		except_req.alpha_taken = except_a.eret;
		//$display("[ERET]");
	end else if(except.priv_inst) begin
		except_code = `EXCCODE_CpU;
		except_req.alpha_taken = except_a.priv_inst;
		except_req.extra = 32'd1;
		//$display("[Exception] Privileged Instruction");
	end else if(except.invalid_inst) begin
		except_code = `EXCCODE_RI;
		except_req.alpha_taken = except_a.invalid_inst;
		//$display("[Exception] Invalid Instruction");
	end else if(except.daddr_unaligned || except.daddr_illegal) begin
		except_code = memory_data_we ? `EXCCODE_ADES : `EXCCODE_ADEL;
		except_req.alpha_taken = except_a.daddr_unaligned | except_a.daddr_illegal;
		except_req.extra = data_vaddr;
		//$display("[Exception] Illegal Address (data)");
	end else if(except.daddr_miss) begin
		except_code = memory_data_we ? `EXCCODE_TLBS : `EXCCODE_TLBL;
		except_req.alpha_taken = except_a.daddr_miss;
		except_req.extra = data_vaddr;
		//$display("[Exception] TLB Miss (data)");
	end else if(except.daddr_invalid) begin
		except_code = memory_data_we ? `EXCCODE_TLBS : `EXCCODE_TLBL;
		except_req.alpha_taken = except_a.daddr_invalid;
		except_req.extra = data_vaddr;
		//$display("[Exception] TLB Invalid (data)");
	end else if(except.daddr_readonly) begin
		except_code = `EXCCODE_MOD;
		except_req.alpha_taken = except_a.daddr_readonly;
		except_req.extra = data_vaddr;
		//$display("[Exception] TLB Modification (data)");
	end else begin
		except_code = 5'b0;
		except_req.alpha_taken = 1'b0;
	end
end

always_comb
begin
	if(except_req.alpha_taken)
	begin
		pc = data_a.pc;
		except_req.delayslot = data_a.delayslot;
	end else begin
		pc = data_b.pc;
		except_req.delayslot = data_b.delayslot;
	end
end

always_comb
begin
	if(rst || ~except_occur)
	begin
		except_req.flush   = 1'b0;
		except_req.code    = 5'b0;
		except_req.eret    = 1'b0;
		except_req.cur_pc  = `ZERO_WORD;
		except_req.jump_pc = `ZERO_WORD;
	end else begin
		except_req.flush  = 1'b1;
		except_req.code   = except_code;
		except_req.cur_pc = pc;
		except_req.eret   = except_a.eret; // ERET only occurs in pipe-a
		if(except.eret)
		begin
			if(cp0_regs.status.erl)
				except_req.jump_pc = cp0_regs.error_epc;
			else except_req.jump_pc = cp0_regs.epc;
		end else begin
			HalfWord_t offset;
			if(cp0_regs.status.exl == 1'b0)
			begin
				if(except_code == `EXCCODE_TLBL || except_code == `EXCCODE_TLBS)
				begin
					offset = 16'h000;
				end else if(except_code == `EXCCODE_INT && cp0_regs.cause.iv) begin
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
