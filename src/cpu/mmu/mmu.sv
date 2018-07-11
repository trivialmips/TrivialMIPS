`include "cpu_defs.svh"

module mmu(
	input clk, rst,
	input wire [7:0] asid,
	input wire       is_user_mode,
	input InstAddr_t  inst_vaddr,
	input MemAddr_t   data_vaddr,

	output MMUResult_t inst_result,
	output MMUResult_t data_result
);

parameter mmu_enabled = 1;

generate if(mmu_enabled)
begin: generate_mmu_enabled_code

	Bit_t inst_mapped, data_mapped;
	TLBResult_t inst_tlb_result, data_tlb_result;

	function logic is_vaddr_mapped(
		input MemAddr_t vaddr
	);
		// useg (0xx), kseg2 (110), kseg3 (111)
		return (~vaddr[31] || vaddr[31:30] == 2'b11);
	endfunction

	assign inst_mapped = is_vaddr_mapped(inst_vaddr);
	assign data_mapped = is_vaddr_mapped(data_vaddr);

	assign inst_result.dirty    = 1'b0;
	assign inst_result.miss     = (inst_mapped & inst_tlb_result.miss);
	assign inst_result.invalid  = (is_user_mode & inst_vaddr[31]);
	assign inst_result.illegal  = (inst_mapped & ~inst_tlb_result.valid);
	assign inst_result.phy_addr = inst_mapped ? inst_tlb_result.phy_addr : { 3'b0, inst_vaddr[28:0] };

	// note that dirty = 1 when writable
	assign data_result.dirty    = (~data_mapped | data_tlb_result.dirty);
	assign data_result.miss     = (data_mapped & data_tlb_result.miss);
	assign data_result.invalid  = (is_user_mode & data_vaddr[31]);
	assign data_result.illegal  = (data_mapped & ~data_tlb_result.valid);
	assign data_result.phy_addr = data_mapped ? data_tlb_result.phy_addr : { 3'b0, data_vaddr[28:0] };

	tlb tlb_instance(
		.clk,
		.rst,
		.asid,
		.inst_vaddr,
		.data_vaddr,
		.inst_result(inst_tlb_result),
		.data_result(data_tlb_result)
	);

end else begin: generate_mmu_disabled_code
	always_comb
	begin
		inst_result = {$bits(MMUResult_t){1'b0}};
		data_result = {$bits(MMUResult_t){1'b0}};
		inst_result.dirty = 1'b0;
		data_result.dirty = 1'b1;
		inst_result.phy_addr = inst_vaddr;
		data_result.phy_addr = data_vaddr;
	end
end
endgenerate

endmodule
