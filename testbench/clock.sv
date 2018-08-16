`include "common_defs.svh"
`timescale 1ps / 1ps

module clock(
    output Clock_t clk
);
    initial begin
        clk._11M0592 = 1;
        clk._50M = 1;
        clk.base = 1;
        clk.base_2x_noshift = 1;
        clk._10M = 1;
    end

    initial begin
        #10938 clk.base_2x = 1;
        while (1) begin
            #6250 clk.base_2x = ~clk.base_2x;
        end
    end

    initial begin
        clk.rst = 1'b0;
        @(posedge clk.base_2x) 
        @(posedge clk.base_2x) 
        clk.rst = 1'b1;
        @(posedge clk.base_2x) 
        @(posedge clk.base_2x) 
        clk.rst = 1'b0;
    end

    always #10000   clk._50M = ~clk._50M;
    always #12500   clk.base = ~clk.base;
    always #6250    clk.base_2x_noshift = ~clk.base_2x_noshift;
    always #45211   clk._11M0592 = ~clk._11M0592;
    always #50000   clk._10M = ~clk._10M;


endmodule

`timescale 1ns / 1ps