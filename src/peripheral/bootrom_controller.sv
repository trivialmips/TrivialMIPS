`include "common_defs.svh"

module bootrom_controller(
    Bus_if.slave inst_bus
);

    wire clk, clk2x, rst;
    assign clk = inst_bus.clk.base;
    assign clk2x = inst_bus.clk.base_2x;
    assign rst = inst_bus.clk.rst;

    assign inst_bus.stall = `ZERO_BIT;

    Word_t inst_1, inst_2;

    blk_mem_bootrom rom_instance(
        .clka(clk2x),
        .addra(BootroomAddress_t'(inst_bus.address)),
        .douta(inst_1),
        .clkb(clk2x),
        .addrb(BootroomAddress_t'(inst_bus.address) + 1'h1), // the trailing 2 bit has already been stripped by inst bus
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