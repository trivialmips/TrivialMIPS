`include "cpu_defs.svh"

module inst_ibus(
	input  rst,
	input  WishboneReq_t ibus_req,
	output WishboneRes_t ibus_res
);

reg [`INST_WIDTH - 1:0] inst_mem[1023:0];

always_comb
begin
	if(rst == 1'b1 || ibus_req.cyc == 1'b0 || ibus_req.stb == 1'b0)
	begin
		ibus_res.data = `ZERO_WORD;
	end else begin
		Word_t data = inst_mem[ibus_req.addr[11:2]];
		ibus_res.data[31:24] = data[7:0];
		ibus_res.data[23:16] = data[15:8];
		ibus_res.data[15:8] = data[23:16];
		ibus_res.data[7:0] = data[31:24];
	end
end

endmodule 
