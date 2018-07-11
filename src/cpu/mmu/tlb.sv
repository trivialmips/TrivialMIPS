`include "cpu_defs.svh"

module tlb(
	input  clk, rst,
	input  wire [7:0]  asid,
	input  InstAddr_t  inst_vaddr,
	input  MemAddr_t   data_vaddr,
	output TLBResult_t inst_result,
	output TLBResult_t data_result,

	// for TLBR/TLBWI/TLBWR
	input  TLBIndex_t tlbrw_index,
	input  Bit_t      tlbrw_we,
	input  TLBEntry_t tlbrw_wdata,
	output TLBEntry_t tlbrw_rdata,

	// for TLBP
	input  Word_t  tlbp_entry_hi,
	output Word_t  tlbp_index
);

TLBFlatEntries_t flat_entries;
TLBEntry_t entries[`TLB_ENTRIES_NUM - 1:0];

assign tlbrw_rdata = entries[tlbrw_index];

genvar i;
generate
	for(i = 0; i < `TLB_ENTRIES_NUM; i = i + 1)
	begin: gen_for_tlb
		assign entries[i] = flat_entries[i * $bits(TLBEntry_t) +: $bits(TLBEntry_t)];
		always @(posedge clk)
		begin
			if(rst)
			begin
				entries[i] <= {$bits(TLBEntry_t){1'b0}};
			end else begin
				if(tlbrw_we && i == tlbrw_index)
					entries[i] <= tlbrw_wdata;
			end
		end
	end
endgenerate

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

TLBResult_t tlbp_result;
tlb_lookup tlbp_lookup(
	.flat_entries,
	.virt_addr(tlbp_entry_hi),
	.asid(tlbp_entry_hi[7:0]),
	.result(tlbp_result)
);

assign tlbp_index = {
	tlbp_result.miss,
	{(32 - `TLB_ENTRIES_NUM_LOG2 - 1){1'b0}},
	tlbp_result.which
};

endmodule
