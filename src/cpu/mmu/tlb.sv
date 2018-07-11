`include "cpu_defs.svh"

module tlb(
	input  clk, rst,
	input  wire [7:0]  asid,
	input  InstAddr_t  inst_vaddr,
	input  MemAddr_t   data_vaddr,
	output TLBResult_t inst_result,
	output TLBResult_t data_result
);

TLBFlatEntries_t flat_entries;
TLBEntry_t entries[`TLB_ENTRIES_NUM - 1:0];

tlb_lookup inst_lookup(
	.flat_entries,
	.virt_addr(inst_vaddr),
	.asid,
	.result(inst_result)
);

tlb_lookup data_lookup(
	.flat_entries,
	.virt_addr(data_vaddr),
	.asid,
	.result(data_result)
);

genvar i;
generate
for(i = 0; i < `TLB_ENTRIES_NUM; i = i + 1)
begin: gen_for_tlb
	assign entries[i] = flat_entries[i * $bits(TLBEntry_t) +: $bits(TLBEntry_t)];
end
endgenerate

endmodule
