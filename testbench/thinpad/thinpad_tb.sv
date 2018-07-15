`include "common_defs.svh"

module thinpad_sv();

    Clock_t clk;
    clock clock_instance(.clk);

    Sram_if     base_ram();
    Sram_if     ext_ram(); 
    UART_if     uart();
    Flash_if    flash();
    USB_if      usb();
    Ethernet_if ethernet();
    VGA_if      vga();
    GPIO_if     gpio();

    ThinPad thinpad_instance(
        .clk_50M(clk._50M),
        .clk_11M0592(clk._11M0592),
        .reset_btn(clk.rst),
        .base_ram,
        .ext_ram, 
        .uart,
        .flash,
        .usb,
        .ethernet,
        .vga,
        .gpio
    );

    reg[3:0]  touch_btn;
    reg[31:0] dip_sw;   

    wire[15:0] leds;    
    wire[7:0]  dpy0;    
    wire[7:0]  dpy1;

    assign gpio.dip_sw = dip_sw;
    assign leds = gpio.leds;
    assign dpy0 = gpio.dpy0;
    assign dpy1 = gpio.dpy1;

    parameter BASE_RAM_INIT_FILE = "../../../../../testbench/thinpad/mem_init/base.bin";
    parameter EXT_RAM_INIT_FILE = "../../../../../testbench/thinpad/mem_init/ext.bin";
    parameter FLASH_INIT_FILE = "../../../../../testbench/thinpad/mem_init/flash.bin";

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
        .Address(ext_ram.address[19:0]),
        .OE_n(ext_ram.oe_n),
        .CE_n(ext_ram.ce_n),
        .WE_n(ext_ram.we_n),
        .LB_n(ext_ram.be_n[2]),
        .UB_n(ext_ram.be_n[3]));

    x28fxxxp30 #(.FILENAME_MEM(FLASH_INIT_FILE)) flash_behav(
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

    initial begin 
        reg [31:0] tmp_array[0:1048575];
        integer n_File_ID, n_Init_Size;
        n_File_ID = $fopen(BASE_RAM_INIT_FILE, "rb");
        if(!n_File_ID)begin 
            n_Init_Size = 0;
            $display("Failed to open BaseRAM init file");
        end else begin
            n_Init_Size = $fread(tmp_array, n_File_ID);
            n_Init_Size /= 4;
            $fclose(n_File_ID);
        end
        $display("BaseRAM Init Size(words): %d",n_Init_Size);
        for (integer i = 0; i < n_Init_Size; i++) begin
            base1.mem_array0[i] = tmp_array[i][24+:8];
            base1.mem_array1[i] = tmp_array[i][16+:8];
            base2.mem_array0[i] = tmp_array[i][8+:8];
            base2.mem_array1[i] = tmp_array[i][0+:8];
        end
    end
    
    initial begin 
        reg [31:0] tmp_array[0:1048575];
        integer n_File_ID, n_Init_Size;
        n_File_ID = $fopen(EXT_RAM_INIT_FILE, "rb");
        if(!n_File_ID)begin 
            n_Init_Size = 0;
            $display("Failed to open ExtRAM init file");
        end else begin
            n_Init_Size = $fread(tmp_array, n_File_ID);
            n_Init_Size /= 4;
            $fclose(n_File_ID);
        end
        $display("ExtRAM Init Size(words): %d",n_Init_Size);
        for (integer i = 0; i < n_Init_Size; i++) begin
            ext1.mem_array0[i] = tmp_array[i][24+:8];
            ext1.mem_array1[i] = tmp_array[i][16+:8];
            ext2.mem_array0[i] = tmp_array[i][8+:8];
            ext2.mem_array1[i] = tmp_array[i][0+:8];
        end
    end

    wire uart_clk;
    assign uart_clk = clk.base_2x;

    integer count;

    task uart_send_char(
        input Byte_t char
    );
        count = 0;
        @(negedge uart_clk);
        uart.rxd = 0;
        while (count < 8) begin
            @(negedge uart_clk);
            uart.rxd = char[count];
            count = count + 1;
        end
        @(negedge uart_clk);
        uart.rxd = 1;
        @(negedge uart_clk);
        uart.rxd = 1;

    endtask

    integer wait_clock;

    initial begin
        wait(thinpad_instance.clk.rst == 0);
        uart.rxd = 1;

        $stop;

        wait_clock = 0;
        while (wait_clock < 20) begin
            @(posedge clk.base);
            wait_clock = wait_clock + 1;
        end

        // uart_send_char("H");
        // uart_send_char("E");
        // uart_send_char("L");
        // uart_send_char("L");
        // uart_send_char("O");

    end


endmodule