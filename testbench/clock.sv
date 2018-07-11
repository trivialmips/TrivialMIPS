`include "common_defs.svh"
`timescale 1ps / 1ps

module clock(
    output Clock_t clk
);
    initial begin
        clk._11M0592 = 0;
        clk._50M = 0;
        clk.base = 0;
        clk.base_2x = 0;
        clk._10M = 0;
        clk.rst = 0;
    end

    always #10000   clk._50M = ~clk._50M;
    always #12500   clk.base = ~clk.base;
    always #6250    clk.base_2x = ~clk.base_2x;
    always #45211   clk._11M0592 = ~clk._11M0592;
    always #50000   clk._10M = ~clk._10M;

endmodule
