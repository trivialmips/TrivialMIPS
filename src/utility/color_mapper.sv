`include "common_defs.svh"

module color_mapper(
    input  VgaColorNumber_t color_number,
    output VgaColor_t       color
);

// TODO: determine the color mapping
always_comb begin
    unique case (color_number)
        4'h0: color = 8'b000_000_00;
        4'h1: color = 8'b000_000_00;
        4'h2: color = 8'b000_000_00;
        4'h3: color = 8'b000_000_00;
        4'h4: color = 8'b000_000_00;
        4'h5: color = 8'b000_000_00;
        4'h6: color = 8'b000_000_00;
        4'h7: color = 8'b000_000_00;
        4'h8: color = 8'b000_000_00;
        4'h9: color = 8'b000_000_00;
        4'ha: color = 8'b000_000_00;
        4'hb: color = 8'b000_000_00;
        4'hc: color = 8'b000_000_00;
        4'hd: color = 8'b000_000_00;
        4'he: color = 8'b000_000_00;
        4'hf: color = 8'b111_111_11;
    endcase
end

endmodule