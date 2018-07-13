`include "common_defs.svh"

module sram_controller(
    Bus_if.slave   inst_bus,
    Bus_if.slave   data_bus,
    Sram_if.master base_ram,
    Sram_if.master ext_ram
);

wire bus_clk, clk, rst;
assign bus_clk = inst_bus.clk.base;
assign clk = inst_bus.clk.base_2x;
assign rst = inst_bus.clk.rst;

assign inst_bus.stall = `ZERO_BIT;

logic ram_write;

Word_t base_ram_data, ext_ram_data;
assign base_ram.data = ram_write ? base_ram_data : `HIGHZ_WORD;
assign ext_ram.data = ram_write ? ext_ram_data : `HIGHZ_WORD;

wire inst_even, data_even;
assign inst_even = (inst_bus.address[0] == 0);
assign data_even = (data_bus.address[0] == 0);

logic last_data_even, last_data_bus_read;

logic last_stall;

Word_t data_read;
assign data_read = last_data_bus_read ? (last_data_even ? base_ram.data : ext_ram.data) : `ZERO_WORD;

assign data_bus.data_rd_2 = `ZERO_WORD; // disabled

SramChipAddress_t inst_addr_half, data_addr_half;
assign inst_addr_half = SramChipAddress_t'(inst_bus.address >> 1);
assign data_addr_half = SramChipAddress_t'(data_bus.address >> 1);

assign inst_bus.data_rd = inst_even ? base_ram.data : ext_ram.data;
assign inst_bus.data_rd_2 = inst_even ? ext_ram.data : base_ram.data;

logic state;

always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= 1'b0;
        base_ram.ce_n <= 1'b1;
        base_ram.oe_n <= 1'b1;
        base_ram.we_n <= 1'b1;
        ext_ram.ce_n <= 1'b1;
        ext_ram.oe_n <= 1'b1;
        ext_ram.we_n <= 1'b1;
        ram_write <= 1'b0;
        last_stall <= 1'b0;
        last_data_even <= 1'b0;
        last_data_bus_read <= `ZERO_WORD;
        data_bus.data_rd <= `ZERO_WORD;
        data_bus.stall <= 1'b0;

    end else begin
        state <= ~state;
        if (state == 1'b1) begin // rising edge of bus_clk, latch the request of last clock
            
            // latch the dbus request
            last_data_even <= data_even;
            last_data_bus_read <= data_bus.read;
            last_stall <= data_bus.stall;

            // disable r/w if no requests come last clock
            base_ram.ce_n <= 1'b0;
            base_ram.we_n <= 1'b1;
            base_ram.oe_n <= 1'b0;
            ext_ram.ce_n <= 1'b0;
            ext_ram.we_n <= 1'b1;
            ext_ram.oe_n <= 1'b0;

            if (data_bus.stall) begin // unprocessed r/w request
                // do the real r/w on dbus
                ram_write <= data_bus.write;

                base_ram.oe_n <= ~(data_bus.read & data_even);
                base_ram.we_n <= ~(data_bus.write & data_even);
                base_ram.be_n <= ~data_bus.mask;
                base_ram_data <= data_bus.data_wr;
                base_ram.address <= data_addr_half;
    
                ext_ram.oe_n <= ~(data_bus.read & ~data_even);
                ext_ram.we_n <= ~(data_bus.write & ~data_even);
                ext_ram.be_n <= ~data_bus.mask;
                ext_ram_data <= data_bus.data_wr;
                ext_ram.address <= data_addr_half;
            end


        end else begin // falling edge of bus_clk, read instruction

            // latch the result of dbus read request
            data_bus.data_rd <= data_read;

            // if there is dbus request in this clock, stall the pipeline
            // otherwise, let the pipeline to continue running
            if (last_stall) data_bus.stall <= 1'b0;
            else data_bus.stall <= (data_bus.read | data_bus.write);

            // send the read request
            ram_write <= 1'b0;

            base_ram.we_n <= 1'b1;
            base_ram.ce_n <= 1'b0;
            base_ram.be_n <= 4'b0000;
            base_ram.oe_n <= 1'b0;

            ext_ram.we_n <= 1'b1;
            ext_ram.ce_n <= 1'b0;
            ext_ram.be_n <= 4'b0000;
            ext_ram.oe_n <= 1'b0;

            base_ram.address <= inst_even ? inst_addr_half : (inst_addr_half + 1'b1);
            ext_ram.address <= inst_addr_half;

        end
    end
end

endmodule