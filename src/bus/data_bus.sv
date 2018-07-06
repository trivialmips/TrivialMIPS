`include "common_defs.svh"

module data_bus(
    Bus_if.slave  cpu,
    Bus_if.master ram,
    Bus_if.master flash,
    Bus_if.master uart,
    Bus_if.master timer,
    Bus_if.master graphics,
    Bus_if.master ethernet
);

    assign ram.data_wr = cpu.data_wr;
    assign ram.address = cpu.address[`RAM_ADDRESS_WIDTH - 1:0];
    assign ram.mask = cpu.mask;

    // we do not write flash
    assign flash.data_wr = cpu.data_wr;
    assign flash.address = cpu.address[`FLASH_ADDRESS_WIDTH - 1:0];
    assign flash.mask = cpu.mask;

    // uart and timer are always one-byte
    assign uart.data_wr = cpu.data_wr;
    assign uart.address = cpu.address[`UART_ADDRESS_WIDTH - 1:0];

    assign timer.data_wr = cpu.data_wr;
    assign timer.address = cpu.address[`TIMER_ADDRESS_WIDTH - 1:0];

    assign graphics.data_wr = cpu.data_wr;
    assign graphics.address = cpu.address[`GRAPHICS_ADDRESS_WIDTH - 1:0];
    assign graphics.mask = cpu.mask;

    // TODO: NOT implemented
    assign ethernet.data_wr = cpu.data_wr;
    assign ethernet.address = cpu.address[`ETHERNET_ADDRESS_WIDTH - 1:0];

    always_comb begin

        ram.read <= `ZERO_BIT;
        ram.write <= `ZERO_BIT;
        flash.read <= `ZERO_BIT;
        flash.write <= `ZERO_BIT;
        uart.read <= `ZERO_BIT;
        uart.write <= `ZERO_BIT;
        timer.read <= `ZERO_BIT;
        timer.write <= `ZERO_BIT;
        graphics.read <= `ZERO_BIT;
        graphics.write <= `ZERO_BIT;
        ethernet.read <= `ZERO_BIT;
        ethernet.write <= `ZERO_BIT;

        cpu.data_rd <= `ZERO_WORD:
        cpu.data_rd_2 <= `ZERO_WORD; // we only process one word of r/w on dbus at every clock
        cpu.stall <= `ZERO_BIT;

        if (`MATCH_PREFIX(cpu.address, `RAM_ADDRESS_PREFIX)) begin

        end else if (`MATCH_PREFIX(cpu.address, `FLASH_ADDRESS_PREFIX)) begin
            ram.read <= cpu.read;
            ram.write <= cpu.write;
            cpu.data_rd <= ram.data_rd;
            cpu.stall <= ram.stall;
        end else if (`MATCH_PREFIX(cpu.address, `UART_ADDRESS_PREFIX)) begin
            flash.read <= cpu.read;
            flash.write <= cpu.write;
            cpu.data_rd <= flash.data_rd;
            cpu.stall <= flash.stall;
        end else if (`MATCH_PREFIX(cpu.address, `TIMER_ADDRESS_PREFIX)) begin
            timer.read <= cpu.read;
            timer.write <= cpu.write;
            cpu.data_rd <= timer.data_rd;
        end else if (`MATCH_PREFIX(cpu.address, `GRAPHICS_ADDRESS_PREFIX)) begin
            graphics.read <= cpu.read;
            graphics.write <= cpu.write;
            cpu.data_rd <= graphics.data_rd;
        end else if (`MATCH_PREFIX(cpu.address, `ETHERNET_ADDRESS_PREFIX)) begin
            ethernet.read <= cpu.read;
            ethernet.write <= cpu.write;
            cpu.data_rd <= ethernet.data_rd;
            cpu.stall <= ethernet.stall;
        end
    end

endmodule