`include "cpu_defs.svh"

module tlb_lookup(
	input  TLBFlatEntries_t flat_entries,
	input  MemAddr_t    virt_addr,
	input  wire [7:0]   asid,
	output TLBResult_t  result
);

TLBEntry_t entries[`TLB_ENTRIES_NUM - 1:0];

logic [`TLB_ENTRIES_NUM_LOG2 - 1:0] which_matched;
logic [`TLB_ENTRIES_NUM - 1:0] matched;
TLBEntry_t matched_entry;
assign matched_entry = entries[which_matched];

assign result.miss = (matched == 16'b0);
assign result.which = which_matched;
assign result.phy_addr[11:0]  = virt_addr[11:0];
always_comb
begin
	if(virt_addr[12])
	begin
		result.dirty = matched_entry.d1;
		result.valid = matched_entry.v1;
		result.cache_flag = matched_entry.c1;
		result.phy_addr[31:12] = matched_entry.pfn1[19:0];
	end else begin
		result.dirty = matched_entry.d0;
		result.valid = matched_entry.v0;
		result.cache_flag = matched_entry.c0;
		result.phy_addr[31:12] = matched_entry.pfn0[19:0];
	end
end

genvar i;
generate
for(i = 0; i < `TLB_ENTRIES_NUM; i = i + 1)
begin: gen_for_tlb_match
	assign entries[i] = flat_entries[i * $bits(TLBEntry_t) +: $bits(TLBEntry_t)];
	assign matched[i] = (
		entries[i].vpn2 == virt_addr[31:13] &&
		(entries[i].asid == asid || entries[i].G)
	);
end
endgenerate

always_comb
begin
	if(matched[0]) which_matched = 0;
	else if(matched[1]) which_matched = 1;
	else if(matched[2]) which_matched = 2;
	else if(matched[3]) which_matched = 3;
	else if(matched[4]) which_matched = 4;
	else if(matched[5]) which_matched = 5;
	else if(matched[6]) which_matched = 6;
	else if(matched[7]) which_matched = 7;
	else if(matched[8]) which_matched = 8;
	else if(matched[9]) which_matched = 9;
	else if(matched[10]) which_matched = 10;
	else if(matched[11]) which_matched = 11;
	else if(matched[12]) which_matched = 12;
	else if(matched[13]) which_matched = 13;
	else if(matched[14]) which_matched = 14;
	else if(matched[15]) which_matched = 15;
	else which_matched = 0;
end


endmodule 
