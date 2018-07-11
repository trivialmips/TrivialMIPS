`include "common_defs.svh"

module peripheral_tb();

    reg Clock_t clk;
    clock clock_instance(.clk);

    Sram_if.master     base_ram;
    Sram_if.master     ext_ram; 
    Uart_if.master     uart;
    Flash_if.master    flash;
    USB_if.master      usb;
    Ethernet_if.master ethernet;
    VGA_if.master      vga;
    GPIO_if.master     gpio;

    reg[3:0]  touch_btn;
    reg[31:0] dip_sw;   

    wire[15:0] leds;    
    wire[7:0]  dpy0;    
    wire[7:0]  dpy1;

    assign gpio.dip_sw = dip_sw;
    assign gpio.leds = leds;
    assign gpio.dpy0 = gpy0;
    assign gpio.dpy1 = dpy1;

    parameter BASE_RAM_INIT_FILE = "";
    parameter EXT_RAM_INIT_FILE = "";
    parameter FLASH_INIT_FILE = "";

    sram_model base1(
        .DataIO(base_ram.data[15:0]),
        .Address(base_ram.address[19:0]),
        .OE_n(base_ram.oe_n),
        .CE_n(base_ram.ce_n),
        .WE_n(base_ram.we_n),
        .LB_n(base_ram.be_n[0]),
        .UB_n(base_ram.be_n[1]));

    sram_model base2(
        .DataIO(base_ram.data[31:16]),
        .Address(base_ram.address[19:0]),
        .OE_n(base_ram.oe_n),
        .CE_n(base_ram.ce_n),
        .WE_n(base_ram.we_n),
        .LB_n(base_ram.be_n[2]),
        .UB_n(base_ram.be_n[3]));

    sram_model ext1(
        .DataIO(ext_ram.data[15:0]),
        .Address(ext_ram.address[19:0]),
        .OE_n(ext_ram.oe_n),
        .CE_n(ext_ram.ce_n),
        .WE_n(ext_ram.we_n),
        .LB_n(ext_ram.be_n[0]),
        .UB_n(ext_ram.be_n[1]));

    sram_model ext2(
        .DataIO(ext_ram.data[31:16]),
        .Address(ext_ram.addr[19:0]),
        .OE_n(ext_ram.oe_n),
        .CE_n(ext_ram.ce_n),
        .WE_n(ext_ram.we_n),
        .LB_n(ext_ram.be_n[2]),
        .UB_n(ext_ram.be_n[3]));

    x28fxxxp30 #(.FILENAME_MEM(FLASH_INIT_FILE)) flash(
        .A(flash.address[1+:22]), 
        .DQ(flash.data), 
        .W_N(flash.we_n),    // Write Enable 
        .G_N(flash.oe_n),    // Output Enable
        .E_N(flash.ce_n),    // Chip Enable
        .L_N(1'b0),    // Latch Enable
        .K(1'b0),      // Clock
        .WP_N(flash.vpen),   // Write Protect
        .RP_N(flash.rp_n),   // Reset/Power-Down
        .VDD('d3300), 
        .VDDQ('d3300), 
        .VPP('d1800), 
        .Info(1'b1));

    initial begin 
        wait(flash.byte_n == 1'b0);
        $display("8-bit Flash interface is not supported in simulation!");
        $display("Please tie flash_byte_n to high");
        $stop;
    end

    Bus_if cpu_data_if(.clk);
    Bus_if cpu_inst_if(.clk);

    // data and instruction bus
    Bus_if ram_data_if(.clk);
    Bus_if ram_inst_if(.clk);
    Bus_if bootrom_if(.clk);
    Bus_if flash_if(.clk);
    Bus_if uart_if(.clk);
    Bus_if timer_if(.clk);
    Bus_if graphics_if(.clk);
    Bus_if ethernet_if(.clk);
    Bus_if gpio_if(.clk);
    Bus_if usb_if(.clk);

    data_bus data_bus_instance(
        .cpu(cpu_data_if.slave),
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
        .bootrom(bootrom_if.master)
    );

    // pheripheral

    bootrom_controller bootrom_controller_instance(
        .inst_bus(bootrom_if.slave)
    );

    sram_controller sram_controller_instance(
        .inst_bus(ram_inst_if.slave),
        .data_bus(ram_data_if.slave),
        .base_ram,
        .ext_ram
    );

    graphics_controller graphics_controller_instance(
        .data_bus(graphics_if.slave),
        .vga
    );

    gpio_controller gpio_controller_instance(
        .data_bus(gpio_if.slave),
        .gpio
    );

endmodule