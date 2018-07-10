`ifndef COMMON_DEFS_SVH
`define COMMON_DEFS_SVH

/*
	This header defines data structures and constants used in the whole SOPC
*/

// project configuration
`default_nettype wire
`timescale 1ns / 1ps

// data formats
typedef logic           Bit_t;
typedef logic [7:0]     Byte_t;
typedef logic [15:0]    HalfWord_t;
typedef logic [31:0]    Word_t;
typedef logic [63:0]    DoubleWord_t;

`define ZERO_BIT        1'b0;
`define ZERO_BYTE       8'h0;
`define ZERO_HWORD      16'h0;
`define ZERO_WORD       32'h0;
`define ZERO_DWORD      64'h0;

// instructions
`define INST_WIDTH      32
`define INST_ADDR_WIDTH 32
typedef Word_t                         Inst_t;
typedef logic [`INST_ADDR_WIDTH - 1:0] InstAddr_t;

// register
`define REG_NUM        32
`define REG_ADDR_WIDTH 5
`define REG_DATA_WIDTH 32
typedef logic [`REG_ADDR_WIDTH - 1:0] RegAddr_t;

// memory
typedef Word_t  MemAddr_t;

`define ADDRESS_WIDTH 32
`define HIGHZ_WORD {32{1'bZ}}

`define SRAM_CHIP_ADDRESS_WIDTH 20
`define FLASH_CHIP_ADDRESS_WIDTH 23

// address prefixes
`define RAM_ADDRESS_PREFIX      8'h00
`define FLASH_ADDRESS_PREFIX    8'h01
`define GRAPHICS_ADDRESS_PREFIX 8'h02
`define UART_ADDRESS_PREFIX     8'h03
`define TIMER_ADDRESS_PREFIX    8'h04
`define ETHERNET_ADDRESS_PREFIX 8'h05
`define GPIO_ADDRESS_PREFIX     8'h06
`define USB_ADDRESS_PREFIX      8'h07
`define BOOTROM_ADDRESS_PREFIX  12'h1FC

`define LONGEST_ADDRESS_PREFIX_WIDTH 12

`define EVAL(A) `A
`define CONCAT_PREFIX(NAME) {`EVAL(NAME``_ADDRESS_PREFIX), {(`LONGEST_ADDRESS_PREFIX_WIDTH - $bits(`EVAL(NAME``_ADDRESS_PREFIX))){1'b0}}}

// actual address widths
// the last two bits are always not used in order to align in 4 bytes
//  ADDRESS  | NOT USED
// 22 ... 2  | 1     0
`define BOOTROM_ADDRESS_WIDTH  10 // 4 KB
`define RAM_ADDRESS_WIDTH      21 // 8 MB
`define FLASH_ADDRESS_WIDTH    21 // 8 MB
`define UART_ADDRESS_WIDTH     1 // 2 address
`define TIMER_ADDRESS_WIDTH    1 // 1 address
`define GRAPHICS_ADDRESS_WIDTH 16 // 256 KB, use 240004 Byte
`define ETHERNET_ADDRESS_WIDTH 1 // 2 addresses
`define GPIO_ADDRESS_WIDTH     1 // 2 addresses 


typedef logic [3:0] ByteMask_t;
`define BYTE_MASK_FULL 4'b1111


typedef struct packed {
    logic _50M, _11M0592, _10M;
    logic base, base_2x;
    logic rst;
} Clock_t;

// interface for bus

interface Bus_if (
    input Clock_t clk
);
    Word_t address;
    Bit_t  read, write;
    Bit_t  stall;
    Word_t data_rd, data_rd_2, data_wr;
    ByteMask_t mask;

    modport master (
        output address, read, write, data_wr, mask,
        input  stall, data_rd, data_rd_2,
        input  clk
    );

    modport slave (
        output stall, data_rd, data_rd_2,
        input  address, read, write, data_wr, mask,
        input  clk
    );

endinterface


// interfaces for peripherals

typedef logic [`SRAM_CHIP_ADDRESS_WIDTH-1 : 0] SramChipAddress_t;

interface Sram_if();
    wire Word_t data;
    SramChipAddress_t address;
    wire[3:0] be_n;
    wire ce_n, oe_n, we_n;

    modport master(
        output address, be_n, ce_n, oe_n, we_n,
        inout  data
    );

endinterface


typedef logic [`FLASH_CHIP_ADDRESS_WIDTH-1 : 0] FlashChipAddress_t;

interface Flash_if();
    FlashChipAddress_t address;
    wire HalfWord_t data;
    wire rp_n, vpen, ce_n, oe_n, we_n, byte_n;

    modport master(
        output address, rp_n, vpen, ce_n, oe_n, we_n, byte_n,
        inout  data
    );

endinterface


interface Uart_if();
    wire txd, rxd;

    modport master(
        output txd,
        input  rxd
    );

endinterface


interface USB_if();
    wire a0;
    wire Byte_t data;
    wire wr_n, rd_n, cs_n, rst_n, dack_n, intrq, drq_n;

    modport master(
        output a0, wr_n, rd_n, cs_n, rst_n, dack_n,
        input  intrq, drq_n,
        inout  data
    );

endinterface


interface Ethernet_if();
    wire cmd;
    wire HalfWord_t sd;
    wire iow_n, ior_n, cs_n, pwrst_n, intr;

    modport master(
        output cmd, iow_n, ior_n, cs_n, pwrst_n,
        input  intr,
        inout  sd
    );

endinterface


interface VGA_if();
    wire[2:0] red, green;
    wire[1:0] blue;
    wire hsync, vsync, clk, de;

    modport master(
        output red, green, blue, hsync, vsync, clk, de
    );

endinterface


interface GPIO_if();
    wire [31:0] dip_sw;
    wire [15:0] leds;
    wire [7:0]  dpy0, dpy1;

    modport master(
        input  dip_sw,
        output leds, dpy0, dpy1
    );

endinterface


`endif