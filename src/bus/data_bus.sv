`include "common_defs.svh"

module data_bus(
    Bus_if.slave  cpu,
    Bus_if.master ram,
    Bus_if.master flash,
    Bus_if.master uart,
    Bus_if.master timer,
    Bus_if.master graphics,
    Bus_if.master ethernet,
    Bus_if.master gpio,
    Bus_if.master usb
);

    assign ram.data_wr = cpu.data_wr;
    assign ram.address = cpu.address[2 +: `RAM_ADDRESS_WIDTH];
    assign ram.mask = cpu.mask;

    // we do not write flash
    assign flash.data_wr = cpu.data_wr;
    assign flash.address = cpu.address[2 +: `FLASH_ADDRESS_WIDTH];
    assign flash.mask = cpu.mask;

    // uart and timer are always one-byte
    assign uart.data_wr = cpu.data_wr;
    assign uart.address = cpu.address[2 +: `UART_ADDRESS_WIDTH];

    assign timer.data_wr = cpu.data_wr;
    assign timer.address = cpu.address[2 +: `TIMER_ADDRESS_WIDTH];

    assign graphics.data_wr = cpu.data_wr;
    assign graphics.address = cpu.address[2 +: `GRAPHICS_ADDRESS_WIDTH];
    assign graphics.mask = cpu.mask;

    // TODO: NOT implemented
    assign ethernet.data_wr = cpu.data_wr;
    assign ethernet.address = cpu.address[2 +: `ETHERNET_ADDRESS_WIDTH];

    assign gpio.data_wr = cpu.data_wr;
    assign gpio.address = cpu.address[2 +: `GPIO_ADDRESS_WIDTH];
    assign gpio.mask    = cpu.mask;

    assign usb.data_wr = cpu.data_wr;
    assign usb.address = cpu.address[2 +: `USB_ADDRESS_WIDTH];

    always_comb begin

        ram.read       = `ZERO_BIT;
        ram.write      = `ZERO_BIT;
        flash.read     = `ZERO_BIT;
        flash.write    = `ZERO_BIT;
        uart.read      = `ZERO_BIT;
        uart.write     = `ZERO_BIT;
        timer.read     = `ZERO_BIT;
        timer.write    = `ZERO_BIT;
        graphics.read  = `ZERO_BIT;
        graphics.write = `ZERO_BIT;
        ethernet.read  = `ZERO_BIT;
        ethernet.write = `ZERO_BIT;
        gpio.read      = `ZERO_BIT;
        gpio.write     = `ZERO_BIT;
        usb.read       = `ZERO_BIT;
        usb.write      = `ZERO_BIT;

        cpu.data_rd   = `ZERO_WORD;
        cpu.data_rd_2 = `ZERO_WORD; // we only process one word of r/w on dbus at every clock
        cpu.stall     = `ZERO_BIT;

        unique case (cpu.address[(`ADDRESS_WIDTH - 1) -: `LONGEST_ADDRESS_PREFIX_WIDTH])
            `CONCAT_PREFIX(RAM): begin
                ram.read    = cpu.read;
                ram.write   = cpu.write;
                cpu.data_rd = ram.data_rd;
                cpu.stall   = ram.stall;
            end

            `CONCAT_PREFIX(FLASH): begin
                flash.read  = cpu.read;
                flash.write = cpu.write;
                cpu.data_rd = flash.data_rd;
                cpu.stall   = flash.stall;
            end

            `CONCAT_PREFIX(UART): begin
                uart.read   = cpu.read;
                uart.write  = cpu.write;
                cpu.data_rd = uart.data_rd;
            end

            `CONCAT_PREFIX(TIMER): begin
                timer.read  = cpu.read;
                timer.write = cpu.write;
                cpu.data_rd = timer.data_rd;
            end

            `CONCAT_PREFIX(GRAPHICS): begin
                graphics.read  = cpu.read;
                graphics.write = cpu.write;
                cpu.data_rd    = graphics.data_rd;
            end

            `CONCAT_PREFIX(ETHERNET): begin
                ethernet.read  = cpu.read;
                ethernet.write = cpu.write;
                cpu.data_rd    = ethernet.data_rd;
            end

            `CONCAT_PREFIX(GPIO): begin
                gpio.read   = cpu.read;
                gpio.write  = cpu.write;
                cpu.data_rd = gpio.data_rd;
            end

            `CONCAT_PREFIX(USB): begin
                usb.read    = cpu.read;
                usb.write   = cpu.write;
                cpu.data_rd = usb.data_rd;
            end

        endcase
    end

endmodule