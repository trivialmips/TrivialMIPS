`include "common_defs.svh"

module sram_controller(
    Bus_if.slave   inst_bus,
    Bus_if.slave   data_bus,
    Sram_if.master base_ram,
    Sram_if.master ext_ram
);

    wire bus_clk, clk, sample_clk, rst;
    logic main_posedge;

    assign bus_clk = inst_bus.clk.base;
    assign sample_clk = inst_bus.clk.base_2x;
    assign clk = inst_bus.clk.base_2x_noshift;
    assign rst = inst_bus.clk.rst;

    assign inst_bus.stall = `ZERO_BIT;
    assign data_bus.stall = `ZERO_BIT;

    wire inst_even, data_even;
    assign inst_even = (inst_bus.address[0] == 0);
    assign data_even = (data_bus.address[0] == 0);
    
    SramChipAddress_t inst_addr_half, data_addr_half;
    assign inst_addr_half = SramChipAddress_t'(inst_bus.address >> 1);
    assign data_addr_half = SramChipAddress_t'(data_bus.address >> 1);

    logic handle_data, handle_inst;

    assign handle_data = bus_clk ? (data_bus.read | data_bus.write) : 1'b0;
    assign handle_inst = ~bus_clk;

    assign inst_bus.data_rd = inst_even ? base_ram.data : ext_ram.data;
    assign inst_bus.data_rd_2 = inst_even ? ext_ram.data : base_ram.data;

    logic write_ram;

    assign base_ram.data = write_ram ? data_bus.data_wr : `HIGHZ_WORD;
    assign ext_ram.data = write_ram ? data_bus.data_wr : `HIGHZ_WORD;

    always_comb begin

        write_ram = 1'b0;

        base_ram.ce_n = 1'b1;
        base_ram.oe_n = 1'b1;
        base_ram.we_n = 1'b1;
        base_ram.be_n = ~`BYTE_MASK_FULL;
        base_ram.address = `ZERO_WORD;
        ext_ram.ce_n = 1'b1;
        ext_ram.oe_n = 1'b1;
        ext_ram.we_n = 1'b1;
        ext_ram.be_n = ~`BYTE_MASK_FULL;
        ext_ram.address = `ZERO_WORD;


        if (handle_inst) begin

            base_ram.ce_n = 1'b0;
            base_ram.oe_n = 1'b0;
            base_ram.address = inst_even ? inst_addr_half : (inst_addr_half + 1'b1);

            ext_ram.ce_n = 1'b0;
            ext_ram.oe_n = 1'b0;
            ext_ram.address = inst_addr_half;

        end else begin
            if (handle_data) begin

                base_ram.ce_n = 1'b0;
                ext_ram.ce_n = 1'b0;

                if (data_bus.write) begin // write to only one chip
                    write_ram = 1'b1;
                    base_ram.be_n = ~data_bus.mask;
                    base_ram.oe_n = 1'b1;
                    base_ram.we_n = ~(data_bus.write & data_even);
                    base_ram.address = data_addr_half;
                    ext_ram.be_n = ~data_bus.mask;
                    ext_ram.oe_n = 1'b1;
                    ext_ram.we_n = ~(data_bus.write & ~data_even);
                    ext_ram.address = data_addr_half;
                end else begin // read from both two chips
                    base_ram.oe_n = 1'b0;
                    base_ram.we_n = 1'b1;
                    base_ram.address = data_even ? data_addr_half : (data_addr_half + 1'b1);
                    ext_ram.oe_n = 1'b0;
                    ext_ram.we_n = 1'b1;
                    ext_ram.address = data_addr_half;
                end
            end
        end
    end

    always_ff @(posedge sample_clk or posedge rst) begin
        if (rst) begin
            main_posedge <= `ZERO_BIT;
        end else begin
            main_posedge <= ~bus_clk;
        end
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_bus.data_rd <= `ZERO_WORD;
            data_bus.data_rd_2 <= `ZERO_WORD;
        end else begin
            if (~main_posedge) begin // latch data_bus data
                if (data_bus.read) begin
                    data_bus.data_rd <= data_even ? base_ram.data : ext_ram.data;
                    data_bus.data_rd_2 <= data_even ? ext_ram.data : base_ram.data;
                end else begin
                    data_bus.data_rd <= `ZERO_WORD;
                    data_bus.data_rd_2 <= `ZERO_WORD;
                end
            end
        end
    end


endmodule