module LedDecoder(
	input   [3:0]	hex,
	output  [7:0]	segments
);

	logic [6:0] oSEG;

	always_comb begin
		unique case(hex)
			4'h1: oSEG = 7'b1110110;
			4'h2: oSEG = 7'b0100001;
			4'h3: oSEG = 7'b0100100;
			4'h4: oSEG = 7'b0010110;
			4'h5: oSEG = 7'b0001100;
			4'h6: oSEG = 7'b0001000;
			4'h7: oSEG = 7'b1100110;
			4'h8: oSEG = 7'b0000000;
			4'h9: oSEG = 7'b0000110;
			4'ha: oSEG = 7'b0000010;
			4'hb: oSEG = 7'b0011000;
			4'hc: oSEG = 7'b1001001;
			4'hd: oSEG = 7'b0110000;
			4'he: oSEG = 7'b0001001;
			4'hf: oSEG = 7'b0001011;
			4'h0: oSEG = 7'b1000000;
		endcase
	end

	assign segments = {~oSEG,1'b0};

endmodule // LedDecoder
