`include "cpu_defs.svh"

module cpu_if(
	input  rst,
	input  InstAddr_t    pc,
	output WishboneReq_t ibus
);

always_comb
begin
	if(rst == 1'b1)
	begin
		ibus.stb  = 1'b0;
		ibus.cyc  = 1'b0;
		ibus.we   = 1'b0;
		ibus.sel  = 4'h0;
		ibus.addr = `ZERO_WORD;
		ibus.data = `ZERO_WORD;
	end else begin
		ibus.stb  = 1'b1;
		ibus.cyc  = 1'b1;
		ibus.we   = 1'b0;
		ibus.sel  = 4'b1111;
		ibus.addr = pc;
		ibus.data = `ZERO_WORD;
	end
end

endmodule
