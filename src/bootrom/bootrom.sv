`include "common_defs.svh"

module bootrom(
    Bus_if.slave inst_bus
);

    wire clk, rst;
    assign clk = inst_bus.clk.base;
    assign rst = inst_bus.clk.rst;

    assign inst_bus.stall = `ZERO_BIT;

    Word_t inst_1, inst_2;

    blk_mem_bootrom rom_instance(
        .clka(~clk),
        .addra(inst_bus.address),
        .douta(inst_1),
        .clkb(~clk),
        .addrb(inst_bus.address + 4'h4),
        .doutb(inst_2)
    );

    always_comb begin
        if (inst_bus.read == 0 || inst_bus.clk.rst) begin
            inst_bus.data_rd   = `ZERO_WORD;
            inst_bus.data_rd_2 = `ZERO_WORD; 
        end else begin
            inst_bus.data_rd   = inst_1;
            inst_bus.data_rd_2 = inst_2; 
        end

    end

endmodule