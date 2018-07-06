`include "common_defs.svh"

module ThinPad(
    input wire clk_50M,           // 50MHz clock
    input wire clk_11M0592,       // 11.0592MHz clock

    input wire clock_btn,         // BTN5 for manual clock
    input wire reset_btn,         // BTN6 for reset

    input  wire[3:0]  touch_btn,
    input  wire[31:0] dip_sw,  
    output wire[15:0] leds,     
    output wire[7:0]  dpy0,      
    output wire[7:0]  dpy1,

    // CPLD uart
    output wire uart_rdn, // read
    output wire uart_wrn, // write
    input wire uart_dataready,
    input wire uart_tbre, // busy sending
    input wire uart_tsre, // send done

    // BaseRAM
    inout wire[31:0] base_ram_data,
    output wire[19:0] base_ram_addr,
    output wire[3:0] base_ram_be_n,
    output wire base_ram_ce_n,     
    output wire base_ram_oe_n,     
    output wire base_ram_we_n,     

    // ExtRAM
    inout wire[31:0] ext_ram_data,
    output wire[19:0] ext_ram_addr,
    output wire[3:0] ext_ram_be_n, 
    output wire ext_ram_ce_n,      
    output wire ext_ram_oe_n,      
    output wire ext_ram_we_n,      

    // uart
    output wire txd,
    input  wire rxd,

    // Flash chip
    output wire [22:0]flash_a,
    inout  wire [15:0]flash_d,
    output wire flash_rp_n,   
    output wire flash_vpen,   
    output wire flash_ce_n,   
    output wire flash_oe_n,    
    output wire flash_we_n,    
    output wire flash_byte_n,

    // USB controller
    output wire sl811_a0,
    inout  wire[7:0] sl811_d,
    output wire sl811_wr_n,
    output wire sl811_rd_n,
    output wire sl811_cs_n,
    output wire sl811_rst_n,
    output wire sl811_dack_n,
    input  wire sl811_intrq,
    input  wire sl811_drq_n,

    // Ethernet
    output wire dm9k_cmd,
    inout  wire[15:0] dm9k_sd,
    output wire dm9k_iow_n,
    output wire dm9k_ior_n,
    output wire dm9k_cs_n,
    output wire dm9k_pwrst_n,
    input  wire dm9k_int,

    // VGA
    output wire[2:0] video_red,
    output wire[2:0] video_green,
    output wire[1:0] video_blue,
    output wire video_hsync,
    output wire video_vsync,
    output wire video_clk,
    output wire video_de
);


Bus_if cpu_data_if();
Bus_if cpu_inst_if();

trivial_mips cpu(
    .clk(clk_50M),
    .rst(reset_btn),
	.inst_bus(cpu_data_if.master),
	.data_bus(cpu_inst_if.master) 
);

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

endmodule
