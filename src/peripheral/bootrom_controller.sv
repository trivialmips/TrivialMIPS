`include "common_defs.svh"

module bootrom_controller(
    Bus_if.slave inst_bus,
    Bus_if.slave data_bus
);

    wire clk, bus_clk, rst, rom_clk;
    assign bus_clk = inst_bus.clk.base;
    assign rom_clk = inst_bus.clk.base_2x_noshift;
    assign clk = inst_bus.clk.base_2x;
    assign rst = inst_bus.clk.rst;

    assign inst_bus.stall = `ZERO_BIT;

    logic need_read_data;

    Word_t data_out_1, data_out_2;
    Word_t inst_cache_1, inst_cache_2;

    BootroomAddress_t base_address_1, base_address_2;

    blk_mem_bootrom rom_instance(
        .clka(rom_clk),
        .addra(base_address_1),
        .douta(data_out_1),
        .clkb(rom_clk),
        .addrb(base_address_2),
        .doutb(data_out_2)
    );

    always_comb begin
        if (need_read_data) begin
            base_address_1 = BootroomAddress_t'(data_bus.address);
            base_address_2 = BootroomAddress_t'(data_bus.address + 1'h1);
        end else begin
            base_address_1 = BootroomAddress_t'(inst_bus.address);
            base_address_2 = BootroomAddress_t'(inst_bus.address + 1'h1);
        end

        if (rst) begin
            data_bus.data_rd = `ZERO_WORD;
            data_bus.data_rd_2 = `ZERO_WORD;
            inst_bus.data_rd = `ZERO_WORD;
            inst_bus.data_rd_2 = `ZERO_WORD;
        end else begin
            data_bus.data_rd = data_out_1;
            data_bus.data_rd_2 = data_out_2;
            if (~data_bus.stall & need_read_data) begin
                // falling edge of next cpu clock after data_bus.read is asserted
                inst_bus.data_rd = inst_cache_1;
                inst_bus.data_rd_2 = inst_cache_2;
            end else begin
                inst_bus.data_rd = data_out_1;
                inst_bus.data_rd_2 = data_out_2;
            end
        end
    end

    always_ff @(posedge rom_clk or posedge rst) begin
        if (rst) begin
            data_bus.stall <= `ZERO_BIT;
            need_read_data <= `ZERO_BIT;
        end else begin
            data_bus.stall <= ~need_read_data & data_bus.read;
            need_read_data <= data_bus.stall;
            if (data_bus.stall & need_read_data) begin 
                // rising edge of next cpu clock after data_bus.read is asserted
                inst_cache_1 <= data_out_1;
                inst_cache_2 <= data_out_2;
            end
        end
    end

endmodule