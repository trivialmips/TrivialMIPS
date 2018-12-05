`include "common_defs.svh"

module bootrom_controller(
    Bus_if.slave inst_bus,
    Bus_if.slave data_bus
);

    wire clk, bus_clk, rst, rom_clock;
    assign bus_clk = inst_bus.clk.base;
    assign rom_clk = inst_bus.clk.base_2x_noshift;
    assign clk = inst_bus.clk.base_2x;
    assign rst = inst_bus.clk.rst;

    assign inst_bus.stall = `ZERO_BIT;

    logic last_stall, last_data_bus_read;

    Word_t data_out_1, data_out_2;

    BootroomAddress_t base_address_1, base_address_2;

    blk_mem_bootrom rom_instance(
        .clka(rom_clk),
        .addra(base_address_1),
        .douta(data_out_1),
        .clkb(rom_clk),
        .addrb(base_address_2),
        .doutb(data_out_2)
    );

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            last_stall <= `ZERO_BIT;
            last_data_bus_read <= `ZERO_BIT;
            data_bus.stall <= `ZERO_BIT;
            data_bus.data_rd <= `ZERO_WORD;
            inst_bus.data_rd <= `ZERO_WORD;
            inst_bus.data_rd_2 <= `ZERO_WORD;
            base_address_1 <= BootroomAddress_t'(`ZERO_WORD);
            base_address_2 <= BootroomAddress_t'(`ZERO_WORD);
        end else begin
            if (bus_clk == `BUS_CLK_POSEDGE) begin // rising edge of bus_clk, latch the request of last clock
                last_stall <= data_bus.stall;
                last_data_bus_read <= data_bus.read;

                inst_bus.data_rd <= inst_bus.read ? data_out_1 : `ZERO_WORD;
                inst_bus.data_rd_2 <= inst_bus.read ? data_out_2 : `ZERO_WORD;

                if (data_bus.stall) begin // unprocessed read from data bus
                    base_address_1 <= data_bus.address;
                end

            end else begin // falling edge of bus_clk, read instruction
                 // latch the result of dbus read request
                data_bus.data_rd <= last_data_bus_read ? data_out_1 : `ZERO_WORD;

                // if there is dbus request in this clock, stall the pipeline
                // otherwise, let the pipeline to continue running
                if (last_stall) data_bus.stall <= `ZERO_BIT;
                else data_bus.stall <= data_bus.read;
                base_address_1 <= BootroomAddress_t'(inst_bus.address);
                base_address_2 <= BootroomAddress_t'(inst_bus.address + 1'h1);
            end

        end

    end

endmodule