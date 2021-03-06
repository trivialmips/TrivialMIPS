`include "common_defs.svh"

module ThinPad(
    input wire clk_50M,           // 50MHz clock
    input wire clk_11M0592,       // 11.0592MHz clock

    input wire clock_btn,         // BTN5 for manual clock
    input wire reset_btn,         // BTN6 for reset

    input wire[3:0] touch_btn,

    Sram_if.master     base_ram,
    Sram_if.master     ext_ram, 
    UART_if.master     uart,
    Flash_if.master    flash,
    USB_if.master      usb,
    Ethernet_if.master ethernet,
    VGA_if.master      vga,
    GPIO_if.master     gpio,

    // CPLD uart (not used)
    output wire uart_rdn, // read
    output wire uart_wrn, // write
    input wire uart_dataready,
    input wire uart_tbre, // busy sending
    input wire uart_tsre  // send done
);


    Clock_t clk;
    reg rst_reg_1, rst_reg_2;
    wire rst_n;
    assign clk.rst = rst_reg_2;
    assign clk._50M = clk_50M;
    assign clk._11M0592 = clk_11M0592;

    top_clk_wiz clk_wiz_instance(
        .out_60M_shift(clk.base_2x), // peripheral clock
        .out_60M(clk.base_2x_noshift),
        .out_30M(clk.base), // main clock
        .out_10M(clk._10M),
        .reset(reset_btn), 
        .locked(rst_n),
        .clk_in1(clk._50M)
    );

    // reset bridge
    always_ff @(posedge clk.base_2x or negedge rst_n) begin
        if (~rst_n) begin
            rst_reg_1 <= 1'b1;
            rst_reg_2 <= 1'b1;
        end else begin
            rst_reg_1 <= ~rst_n;
            rst_reg_2 <= rst_reg_1;
        end
    end


    Bus_if cpu_data_if(.clk);
    Bus_if cpu_inst_if(.clk);


    // cpu
    trivial_mips cpu(
        .inst_bus(cpu_inst_if.master),
        .data_bus(cpu_data_if.master)
    );


    // data and instruction bus
    Bus_if ram_data_if(.clk);
    Bus_if ram_inst_if(.clk);
    Bus_if bootrom_inst_if(.clk);
    Bus_if bootrom_data_if(.clk);
    Bus_if flash_if(.clk);
    Bus_if uart_if(.clk);
    Bus_if timer_if(.clk);
    Bus_if graphics_if(.clk);
    Bus_if ethernet_if(.clk);
    Bus_if gpio_if(.clk);
    Bus_if usb_if(.clk);

    data_bus data_bus_instance(
        .cpu(cpu_data_if.slave),
        .bootrom(bootrom_data_if.master),
        .ram(ram_data_if.master),
        .flash(flash_if.master),
        .uart(uart_if.master),
        .timer(timer_if.master),
        .graphics(graphics_if.master),
        .ethernet(ethernet_if.master),
        .gpio(gpio_if.master),
        .usb(usb_if.master)
    );

    instruction_bus instruction_bus_instance(
        .cpu(cpu_inst_if.slave),
        .ram(ram_inst_if.master),
        .bootrom(bootrom_inst_if.master)
    );


    // mandantory peripheral
    bootrom_controller bootrom_controller_instance(
        .inst_bus(bootrom_inst_if.slave),
        .data_bus(bootrom_data_if.slave)
    );

    sram_controller sram_controller_instance(
        .inst_bus(ram_inst_if.slave),
        .data_bus(ram_data_if.slave),
        .base_ram,
        .ext_ram
    );

    // optional peripheral
    generate

        if (`ENABLE_PERIPHERAL_GRAPHICS) begin
            graphics_controller graphics_controller_instance(
                .data_bus(graphics_if.slave),
                .vga
            );
        end else begin
            `GENERATE_DUMMY_CONTROLLER(graphics)
        end

        if (`ENABLE_PERIPHERAL_GPIO) begin
            gpio_controller gpio_controller_instance(
                .data_bus(gpio_if.slave),
                .gpio
            );
        end else begin
            `GENERATE_DUMMY_CONTROLLER(gpio)
        end

        if (`ENABLE_PERIPHERAL_TIMER) begin
            timer_controller timer_controller_instance(
                .data_bus(timer_if.slave)
            );
        end else begin
            `GENERATE_DUMMY_CONTROLLER(timer)
        end

        if (`ENABLE_PERIPHERAL_UART) begin
            uart_controller uart_controller_instance(
                .data_bus(uart_if.slave),
                .uart
            );
        end else begin
            `GENERATE_DUMMY_CONTROLLER(uart)
        end

        if (`ENABLE_PERIPHERAL_FLASH) begin
            flash_controller flash_controller_instance(
                .data_bus(flash_if.slave),
                .flash
            );
        end else begin
            `GENERATE_DUMMY_CONTROLLER(flash)
        end

        if (`ENABLE_PERIPHERAL_ETHERNET) begin
            ethernet_controller ethernet_controller_instance(
                .data_bus(ethernet_if.slave),
                .ethernet
            );
        end else begin
            `GENERATE_DUMMY_CONTROLLER(ethernet)
        end

        if (`ENABLE_PERIPHERAL_USB) begin
            usb_controller usb_controller_instance(
                .data_bus(usb_if.slave),
                .usb
            );
        end else begin
            `GENERATE_DUMMY_CONTROLLER(usb)
        end

    endgenerate

endmodule
