`include "common_defs.svh"

module peripheral_tb();

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

    reg[3:0]  touch_btn;
    reg[31:0] dip_sw;   

    wire[15:0] leds;    
    wire[7:0]  dpy0;    
    wire[7:0]  dpy1;

    assign gpio.dip_sw = dip_sw;
    assign leds = gpio.leds;
    assign dpy0 = gpio.dpy0;
    assign dpy1 = gpio.dpy1;

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
        .base_ram(base_ram.master),
        .ext_ram(ext_ram.master)
    );

    graphics_controller graphics_controller_instance(
        .data_bus(graphics_if.slave),
        .vga(vga.master)
    );

    gpio_controller gpio_controller_instance(
        .data_bus(gpio_if.slave),
        .gpio(gpio.master)
    );

    timer_controller timer_controller_instance(
        .data_bus(timer_if.slave)
    );

    uart_controller #(
        .IRQ_NUMBER(`IRQ_UART)
    ) uart_controller_instance(
        .data_bus(uart_if.slave),
        .uart(uart.master)
    );

    task test_data_bus(
        input Word_t address,
        input Word_t data,
        input logic read,
        input logic write,
        input ByteMask_t mask
    );

    cpu_data_if.read = read;
    cpu_data_if.write = write;
    cpu_data_if.address = address;
    cpu_data_if.data_wr = data;
    cpu_data_if.mask = mask;

    endtask

    task test_inst_bus(
        input Word_t address
    );

    cpu_inst_if.read = 1'b1;
    cpu_inst_if.write = 1'b0;
    cpu_inst_if.address = address;

    endtask

    task assert_value(
        input string name,
        input integer expected,
        input integer result
    );
    assert (result == expected) $display("[%s] OK, is 0x%x", name, expected);
    else begin
        $error("[%s] Failed, shoule be 0x%x, got 0x%x", name, expected, result);
        $stop;
    end

    endtask

    reg[7:0] next_data[7:0];
    reg[2:0] data_ptr;

    always @(uart.txd) begin
        uart.rxd <= uart.txd;
    end

    initial begin
        wait (clk.rst == 1'b1);
        wait (clk.rst == 1'b0);

        // bootrom
        $display("[Bootrom] test begin");
        @(negedge clk.base_2x);
        begin
            test_inst_bus(
                .address(32'h1FC00000)
            );
        end

        @(posedge clk.base);
        assert_value("Read instruction 1", 32'h3C04BFC0, cpu_inst_if.data_rd);
        assert_value("Read instruction 2", 32'h3C038000, cpu_inst_if.data_rd_2);
        $display("[Bootrom] test ended");


        // GPIO
        $display("[GPIO] test begin");
        @(negedge clk.base_2x);
        begin
            dip_sw = 32'h12345678;
            test_data_bus(
                .address(32'h06000000),
                .data(0),
                .read(1),
                .write(0),
                .mask(4'b1111)
            );
        end

        @(posedge clk.base);
        assert_value("Read dip_sw", 32'h12345678, cpu_data_if.data_rd);


        @(negedge clk.base_2x);
        begin
            test_data_bus(
                .address(32'h06000004),
                .data(32'h0000CAFE),
                .read(0),
                .write(1),
                .mask(4'b1111)
            );
        end

        @(posedge clk.base);
        assert_value("Write 7-segment low", 8'hFE, dpy0);
        assert_value("Write 7-segment high", 8'hCA, dpy1);


        @(negedge clk.base_2x);
        begin
            test_data_bus(
                .address(32'h06000004),
                .data(32'h800000FE),
                .read(0),
                .write(1),
                .mask(4'b1111)
            );
        end

        @(posedge clk.base);
        assert_value("Write 7-segment low", 8'hEC, dpy0);
        assert_value("Write 7-segment high", 8'hE8, dpy1);


        @(negedge clk.base_2x);
        begin
            test_data_bus(
                .address(32'h06000008),
                .data(32'h00002333),
                .read(0),
                .write(1),
                .mask(4'b1111)
            );
        end

        @(posedge clk.base);
        assert_value("Write leds", 16'h2333, leds);
        $display("[GPIO] test ended");


        // sram
        $display("[SRAM] test begin");
        @(negedge clk.base_2x);
        begin
            test_data_bus(
                .address(32'h00000000),
                .data(32'h66666666),
                .read(0),
                .write(1),
                .mask(4'b1111)
            );
        end

        @(posedge clk.base);
        assert_value("Data bus stall this clock", 1'b1, cpu_data_if.stall);

        @(negedge clk.base_2x);
        begin
            test_inst_bus(
                .address(32'h00000000)
            );
        end

        @(posedge clk.base);
        assert_value("Data bus stall next clock", 1'b0, cpu_data_if.stall);
        assert_value("Inst 1 read this clock", 32'h66666666, cpu_inst_if.data_rd);

        @(negedge clk.base_2x);
        begin
            test_data_bus(
                .address(32'h00000004),
                .data(32'h77777777),
                .read(0),
                .write(1),
                .mask(4'b1111)
            );
            test_inst_bus(
                .address(32'h00000000)
            );
        end

        @(posedge clk.base);
        assert_value("Data bus stall this clock", 1'b1, cpu_data_if.stall);
        assert_value("Inst 1 read this clock", 32'h66666666, cpu_inst_if.data_rd);

        @(posedge clk.base);
        assert_value("Data bus stall next clock", 1'b0, cpu_data_if.stall);
        assert_value("Inst 1 read next clock", 32'h66666666, cpu_inst_if.data_rd);
        assert_value("Inst 2 read next clock", 32'h77777777, cpu_inst_if.data_rd_2);


        @(negedge clk.base_2x);
        begin
            test_data_bus(
                .address(32'h00000004),
                .data(32'h11223344),
                .read(0),
                .write(1),
                .mask(4'b1010)
            );
            test_inst_bus(
                .address(32'h00000000)
            );
        end

        @(posedge clk.base);
        assert_value("Data bus stall this clock", 1'b1, cpu_data_if.stall);
        assert_value("Inst 1 read this clock", 32'h66666666, cpu_inst_if.data_rd);
        assert_value("Inst 2 read this clock", 32'h77777777, cpu_inst_if.data_rd_2);

        @(posedge clk.base);
        assert_value("Data bus stall next clock", 1'b0, cpu_data_if.stall);
        assert_value("Inst 1 read next clock", 32'h66666666, cpu_inst_if.data_rd);
        assert_value("Inst 2 read next clock", 32'h11773377, cpu_inst_if.data_rd_2);

        @(negedge clk.base_2x);
        cpu_data_if.write = 1'b0;

        $display("[SRAM] test ended");


        // uart
        $display("[UART] test begin");

        data_ptr = 0;
        next_data[0] = 8'haa;
        next_data[1] = 8'h00;
        next_data[2] = 8'h55;
        next_data[3] = 8'hff;
        next_data[4] = 8'h01;
        next_data[5] = 8'h80;
        next_data[6] = 8'h92;
        next_data[7] = 8'ha7;

        do begin
            do begin
                @(posedge clk.base);
                test_data_bus(
                    .address(32'h03000000),
                    .data(32'h11223344),
                    .read(1),
                    .write(0),
                    .mask(4'b1111)
                );
                @(negedge clk.base);
                @(negedge clk.base_2x);
            end while(cpu_data_if.data_rd[0]!=1'b1);

            $display("[UART] writing one byte");

            @(posedge clk.base);
            test_data_bus(
                .address(32'h03000004),
                .data(next_data[data_ptr]),
                .read(0),
                .write(1),
                .mask(4'b1111)
            );
            @(negedge clk.base);
            @(negedge clk.base_2x);

            
            $display("[UART] waiting for data to write back");

            do begin
                @(posedge clk.base);
                test_data_bus(
                    .address(32'h03000000),
                    .data(32'h11223344),
                    .read(1),
                    .write(0),
                    .mask(4'b1111)
                );
                @(negedge clk.base);
                @(negedge clk.base_2x);
            end while(cpu_data_if.data_rd[1]!=1'b1);
            assert_value("UART interrupt", 1'b1, cpu_data_if.interrupt[`IRQ_UART]);
            
            @(posedge clk.base);
            test_data_bus(
                .address(32'h03000004),
                .data(32'h11223344),
                .read(1),
                .write(0),
                .mask(4'b1111)
            );
            @(negedge clk.base);
            @(negedge clk.base_2x);
            assert_value("UART received", next_data[data_ptr], cpu_data_if.data_rd);
            data_ptr = data_ptr+1;
        end while(data_ptr!=3'd7);

        $display("[UART] test ended");


        // timer
        $display("[Timer] test begin");
        @(negedge clk.base);
        begin
            test_data_bus(
                .address(32'h04000000),
                .data(32'h22222222),
                .read(0),
                .write(1),
                .mask(4'b1111)
            );
        end

        @(negedge clk._10M);
        @(negedge clk._10M);
        @(negedge clk._10M);
        @(negedge clk._10M);
        assert_value("Timer set", 32'h22222222, timer_controller_instance.timer);

        @(negedge clk.base);
        begin
            test_data_bus(
                .address(32'h04000000),
                .data(32'h22222222),
                .read(1),
                .write(0),
                .mask(4'b1111)
            );
        end

        @(negedge clk._10M);
        @(negedge clk._10M);
        @(negedge clk._10M);
        @(negedge clk._10M);
        assert_value("Timer read after 1 period", 32'h22222223, cpu_data_if.data_rd);

        $display("[Timer] test ended");


        $stop;
    end

endmodule