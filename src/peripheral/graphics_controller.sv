`include "common_defs.svh"

module graphics_controller(
    Bus_if.slave  data_bus,
    VGA_if.master vga
);

    wire vga_clk, bus_clk, bus_clk_2x, ram_clk;
    wire rst;

    assign vga.clk = vga_clk;
    assign vga_clk = data_bus.clk._50M;
    assign bus_clk = data_bus.clk.base;
    assign bus_clk_2x = data_bus.clk.base_2x;
    assign rst = data_bus.clk.rst;

    Word_t mem_data;

    Word_t pixel_offset_reg_i[0:1];
    Word_t pixel_offset_reg_o[0:1];
    Word_t pixel_offset;
    Word_t pixel_count;

    GraphicsMemoryAddress_t mem_address_offset, mem_address_overflow, mem_address;
    assign mem_address_offset = GraphicsMemoryAddress_t'(pixel_offset >> 2);
    assign mem_address_overflow = GraphicsMemoryAddress_t'(pixel_count >> 2) + mem_address_offset + 1'b1;
    assign mem_address = (mem_address_overflow >= `GRAPHICS_CONFIG_ADDRESS * 2) ? 
                         (mem_address_overflow - `GRAPHICS_CONFIG_ADDRESS * 2) : (
                             (mem_address_overflow >= `GRAPHICS_CONFIG_ADDRESS) ? 
                             (mem_address_overflow - `GRAPHICS_CONFIG_ADDRESS) : mem_address_overflow);


    assign data_bus.stall = `ZERO_BIT;

    Word_t gmem_data_out_a, gmem_data_in_a;
    GraphicsMemoryAddress_t gmem_address_a;

    ByteMask_t gmem_write_mask_a;

    genvar i;

    generate
        for (i = 0; i < 4; i++) begin
            // port a for read/write request from bus
            // port b for read request from vga
            blk_mem_graphics blk_mem_graphics_instance (
                .clka(bus_clk_2x),
                .wea(gmem_write_mask_a[i]),
                .addra(gmem_address_a),
                .dina(gmem_data_in_a[8 * i +: 8]),
                .douta(gmem_data_out_a[8 * i +: 8]),
                .clkb(vga_clk),
                .web(`ZERO_BIT),
                .addrb(mem_address),
                .dinb(`ZERO_BYTE),
                .doutb(mem_data[8 * i +: 8])
            );
        end
    endgenerate

    logic dbus_last_stall;

    always_ff @(posedge bus_clk_2x or posedge rst) begin
        if (rst) begin
            gmem_data_in_a <= `ZERO_WORD;
            gmem_write_mask_a <= `BYTE_MASK_NONE;
            gmem_address_a <= GraphicsMemoryAddress_t'(`ZERO_WORD);
            data_bus.data_rd <= `ZERO_WORD;
            dbus_last_stall <= 1'b0;
            data_bus.stall <= 1'b0;
        end else begin

            dbus_last_stall <= data_bus.stall;

            if (bus_clk == ~`BUS_CLK_POSEDGE) begin // falling edge of main clock
                data_bus.stall <= 1'b0;
                gmem_data_in_a <= `ZERO_WORD;
                gmem_write_mask_a <= `BYTE_MASK_NONE;
                data_bus.data_rd <= `ZERO_WORD;
                if (data_bus.write) begin
                    gmem_address_a <= GraphicsMemoryAddress_t'(data_bus.address);
                    gmem_write_mask_a <= data_bus.mask;
                    gmem_data_in_a <= data_bus.data_wr;
                end if (data_bus.read) begin
                    if (dbus_last_stall) begin
                        data_bus.data_rd <= gmem_data_out_a;
                    end else begin
                        if (data_bus.address == `GRAPHICS_CONFIG_ADDRESS) begin
                            data_bus.data_rd <= pixel_offset_reg_o[1];
                        end else begin
                            gmem_address_a <= GraphicsMemoryAddress_t'(data_bus.address);
                            data_bus.stall <= 1'b1;
                        end
                    end
                end
            end
        end
    end


    always_ff @(posedge bus_clk or posedge rst) begin
        if (rst) begin
            pixel_offset_reg_i[0] <= `ZERO_WORD;
            pixel_offset_reg_o[0] <= `ZERO_WORD;
            pixel_offset_reg_o[1] <= `ZERO_WORD;
        end else begin
            pixel_offset_reg_o[0] <= pixel_offset;
            pixel_offset_reg_o[1] <= pixel_offset_reg_o[0];
            if (data_bus.write && data_bus.address == `GRAPHICS_CONFIG_ADDRESS) begin
                pixel_offset_reg_i[0] <= data_bus.data_wr;
            end
        end
    end

    // cross clock domain synchronization
    always_ff @(posedge vga_clk or posedge rst) begin
        if (rst) begin
            pixel_offset_reg_i[1] <= `ZERO_WORD;
            pixel_offset <= `ZERO_WORD;
        end else begin
            pixel_offset_reg_i[1] <= pixel_offset_reg_i[0];
            pixel_offset <= pixel_offset_reg_i[1];
        end
    end


    // generate VGA signal
    localparam HOR_PXL    = 800;
    localparam VER_PXL    = 600;
    localparam TOL_PXL    = (HOR_PXL * VER_PXL);
    localparam HSYNC_POL  = 1; //positive
    localparam VSYNC_POL  = 1; //positive
    localparam HBACK_POCH = 64;
    localparam HFRNT_POCH = 56;
    localparam HSYNC_TIME = 120;
    localparam VBACK_POCH = 23;
    localparam VFRNT_POCH = 37;
    localparam VSYNC_TIME = 6;
    localparam HTOL_TIME  = (HBACK_POCH + HFRNT_POCH + HSYNC_TIME + HOR_PXL);
    localparam VTOL_TIME  = (VBACK_POCH + VFRNT_POCH + VSYNC_TIME + VER_PXL);
    localparam HPXL_BEGIN = (HSYNC_TIME + HBACK_POCH);
    localparam VPXL_BEGIN = (VSYNC_TIME + VBACK_POCH);

    Word_t now_data;
    Word_t x, y;
    Word_t visible_x, visible_y;

    wire [1:0] pixel_count_mod_4 = pixel_count[1:0];

    // VgaColorNumber_t color_number;
    // color_mapper color_mapper_instance(
    //     .color_number,
    //     .color
    // );

    VgaColor_t color;
    // every pixel takes 8 bits, little endian
    assign color = now_data[pixel_count_mod_4 * $bits(VgaColor_t) +: $bits(VgaColor_t)];



    assign {vga.red, vga.green, vga.blue} = color;

    // latch data
    always_ff @(posedge vga_clk or posedge rst) begin
        if (rst) begin
            now_data <= `ZERO_WORD;
        end else begin
            if (pixel_count_mod_4 == 2'd3) begin
                now_data <= mem_data;
            end
        end
    end


    // pixel coordinate
    always_ff @(posedge vga_clk or posedge rst) begin
        if (rst) begin
            x <= `ZERO_WORD;
            y <= `ZERO_WORD;
        end else begin
            if (x == HTOL_TIME - 1) begin
                x <= 0;
                if (y == VTOL_TIME - 1) begin
                    y <= 0;
                end else begin
                    y <= y + 32'b1;
                end
            end else begin
                x <= x + 32'b1;
            end
        end
    end

    // horizontal and vertical synchronization signal
    always_ff @(posedge vga_clk or posedge rst) begin
        if (rst) begin
            vga.hsync <= HSYNC_POL;
            vga.vsync <= HSYNC_POL;
        end else begin
            if (x == HTOL_TIME - 1) begin
                vga.hsync <= HSYNC_POL;
            end else if (x == HSYNC_TIME - 1) begin
                vga.hsync <= ~HSYNC_POL;
            end
            if (y == VTOL_TIME - 1 && x == HTOL_TIME - 1) begin
                vga.vsync <= VSYNC_POL;
            end else if (y == VSYNC_TIME - 1 && x == HTOL_TIME - 1) begin
                vga.vsync <= ~VSYNC_POL;
            end
        end
    end

    assign visible_x = x >= HPXL_BEGIN ? (x - HPXL_BEGIN < HOR_PXL ? x - HPXL_BEGIN : 0) : 0;
    assign visible_y = y >= VPXL_BEGIN ? (y - VPXL_BEGIN < VER_PXL ? y - VPXL_BEGIN : 0) : 0;

    assign vga.de = (x >= HPXL_BEGIN) && (x - HPXL_BEGIN < HOR_PXL) && (y >= VPXL_BEGIN) && (y - VPXL_BEGIN < VER_PXL);

    always_ff @(posedge vga_clk or posedge rst) begin
        if (rst) begin
            pixel_count <= `ZERO_WORD;
        end else begin
            if (vga.de) begin
                if (pixel_count == TOL_PXL - 1) begin
                    pixel_count <= 0;
                end else begin
                    pixel_count <= pixel_count + 1;
                end
            end
        end
    end



endmodule