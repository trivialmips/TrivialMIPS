`include "common_defs.svh"

module bootrom_controller(
    Bus_if.slave inst_bus
);

    wire clk, clk_bus, rst;
    assign clk_bus = inst_bus.clk.base;
    assign clk = inst_bus.clk.base_2x;
    assign rst = inst_bus.clk.rst;

    assign inst_bus.stall = `ZERO_BIT;

    Word_t inst_1, inst_2;

    BootroomAddress_t base_address, base_address_2;

    blk_mem_bootrom rom_instance(
        .clka(clk),
        .addra(base_address),
        .douta(inst_1),
        .clkb(clk),
        .addrb(base_address_2),
        .doutb(inst_2)
    );

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            base_address <= BootroomAddress_t'(`ZERO_WORD);
            base_address_2 <= BootroomAddress_t'(`ZERO_WORD);
        end else begin
            if (clk_bus == ~`BUS_CLK_POSEDGE) begin // falling edge
                base_address <= BootroomAddress_t'(data_bus.address);
                // the trailing 2 bit has already been stripped by inst bus
                base_address_2 <= BootroomAddress_t'(data_bus.address + 1'h1);
            end
        end
    end

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