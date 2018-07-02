`default_nettype none

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



// p=dpy0[0] // ---a---
// c=dpy0[1] // |     |
// d=dpy0[2] // f     b
// e=dpy0[3] // |     |
// b=dpy0[4] // ---g---
// a=dpy0[5] // |     |
// f=dpy0[6] // e     c
// g=dpy0[7] // |     |
//           // ---d---  p


reg[7:0] number;
LedDecoder segL(.segments(dpy0), .hex(number[3:0])); // lower digit
LedDecoder segH(.segments(dpy1), .hex(number[7:4])); // higher digit

reg[15:0] led_bits;
assign leds = led_bits;

always_ff @(posedge clock_btn or posedge reset_btn) begin
    if (reset_btn) begin
        number<=0;
        led_bits <= 16'h1;
    end
    else begin
        number <= number+1;
        led_bits <= {led_bits[14:0],led_bits[15]};
    end
end

// send data from uart rx directly back
wire [7:0] ext_uart_rx;
reg  [7:0] ext_uart_buffer, ext_uart_tx;
wire ext_uart_ready, ext_uart_busy;
reg ext_uart_start, ext_uart_avai;

AsyncUartReceiver #(
    .ClkFrequency(50000000),
    .Baud(115200)
) ext_uart_r (
    .clk(clk_50M),
    .RxD(rxd),
    .RxD_data_ready(ext_uart_ready),
    .RxD_clear(ext_uart_ready),
    .RxD_data(ext_uart_rx)
);
    
always_ff @(posedge clk_50M) begin
    if(ext_uart_ready)begin
        ext_uart_buffer <= ext_uart_rx;
        ext_uart_avai <= 1;
    end else if(!ext_uart_busy && ext_uart_avai)begin 
        ext_uart_avai <= 0;
    end
end

always_ff @(posedge clk_50M) begin
    if(!ext_uart_busy && ext_uart_avai)begin 
        ext_uart_tx <= ext_uart_buffer;
        ext_uart_start <= 1;
    end else begin 
        ext_uart_start <= 0;
    end
end

AsyncUartTransmitter #(
    .ClkFrequency(50000000),
    .Baud(115200)
) ext_uart_t (
    .clk(clk_50M),
    .TxD(txd), 
    .TxD_busy(ext_uart_busy),
    .TxD_start(ext_uart_start),
    .TxD_data(ext_uart_tx)
);


wire [11:0] hdata;
assign video_red = hdata < 266 ? 3'b111 : 0; // red bar
assign video_green = hdata < 532 && hdata >= 266 ? 3'b111 : 0;  // green bar
assign video_blue = hdata >= 532 ? 2'b11 : 0; // blue bar
assign video_clk = clk_50M;

vga #(12, 800, 856, 976, 1040, 600, 637, 643, 666, 1, 1) vga800x600at75 (
    .clk(clk_50M), 
    .hdata(hdata),
    .vdata(),
    .hsync(video_hsync),
    .vsync(video_vsync),
    .data_enable(video_de)
);

endmodule
