`include "common_defs.svh"

module ThinPad(
    input wire clk_50M,           // 50MHz clock
    input wire clk_11M0592,       // 11.0592MHz clock

    input wire clock_btn,         // BTN5 for manual clock
    input wire reset_btn,         // BTN6 for reset

    input wire[3:0] touch_btn,

    Sram_if.master     base_ram,
    Sram_if.master     ext_ram, 
    Uart_if.master     uart,
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
    input wire uart_tsre, // send done
);


Bus_if cpu_data_if();
Bus_if cpu_inst_if();


// cpu
trivial_mips cpu(
    .clk(clk_50M),
    .rst(reset_btn),
	.inst_bus(cpu_data_if.master),
	.data_bus(cpu_inst_if.master) 
);


// data and instruction bus
Bus_if ram_data_if();
Bus_if ram_inst_if();
Bus_if bootrom_if();
Bus_if flash_if();
Bus_if uart_if();
Bus_if timer_if();
Bus_if graphics_if();
Bus_if ethernet_if();

data_bus data_bus_instance(
    .cpu(cpu_data_if.slave),
    .ram(ram_data_if.master),
    .flash(flash_if.master),
    .uart(uart_if.master),
    .timer(timer_if.master),
    .graphics(graphics_if.master),
    .ethernet(ethernet_if.master)
);

instruction_bus instruction_bus_instance(
    .cpu(cpu_inst_if.slave),
    .ram(ram_inst_if.master),
    .bootrom(bootrom_if.master)
);


// pheripheral

sram_controller sram_controller_instance(
    .inst_bus(ram_inst_if.slave),
    .data_bus(ram_data_if.slave),
    .base_ram,
    .ext_ram
);



endmodule
