// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Aug 16 14:04:42 2018
// Host        : Skyworks-WinServer running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/harry/Desktop/TrivialMIPS/vivado/TrivialMIPS.srcs/ip/blk_mem_bootrom/blk_mem_bootrom_stub.v
// Design      : blk_mem_bootrom
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module blk_mem_bootrom(clka, addra, douta, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[11:0],douta[31:0],clkb,addrb[11:0],doutb[31:0]" */;
  input clka;
  input [11:0]addra;
  output [31:0]douta;
  input clkb;
  input [11:0]addrb;
  output [31:0]doutb;
endmodule
