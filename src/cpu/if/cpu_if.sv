`include "cpu_defs.svh"

module cpu_if(
	input  rst,
	input  InstAddr_t    pc,
	input  Bit_t         pc_ce,

	input  MMUResult_t   mmu_inst_result,
	output MemAddr_t     mmu_inst_vaddr,
	output Bit_t         inst2_avail,

	Bus_if.master        inst_bus,
	output Bit_t         stall_req,
	output ExceptInfo_t  except
);

assign stall_req = inst_bus.stall;

assign inst_bus.data_wr = `ZERO_WORD;
assign inst_bus.write   = `ZERO_BIT;
assign inst_bus.address = mmu_inst_result.phy_addr;
assign mmu_inst_vaddr   = pc;
assign inst2_avail      = (pc & 12'hfff) != 12'hffc;

always_comb
begin
	except = {$bits(ExceptInfo_t){1'b0}};
	except.iaddr_miss    = mmu_inst_result.miss;
	except.iaddr_invalid = mmu_inst_result.invalid;
	except.iaddr_illegal = mmu_inst_result.illegal || (pc[1:0] != 2'b0);

	if(rst == 1'b1 || ~pc_ce)
	begin
		inst_bus.read    = 1'b0;
		inst_bus.mask    = 4'b0000;
	end else begin
//		inst_bus.read    = ~except.iaddr_miss; // & ~except.iaddr_illegal & ~except.iaddr_invalid;
		inst_bus.read    = 1'b1;
		inst_bus.mask    = 4'b1111;
	end
end

endmodule
