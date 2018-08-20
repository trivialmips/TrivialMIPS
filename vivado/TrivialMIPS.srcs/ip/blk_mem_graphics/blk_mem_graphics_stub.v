// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Mon Aug 20 20:53:29 2018
// Host        : Harry-XPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/Harry
//               Chen/Documents/Workspace/TrivialMIPS/vivado/TrivialMIPS.srcs/ip/blk_mem_graphics/blk_mem_graphics_stub.v}
// Design      : blk_mem_graphics
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module blk_mem_graphics(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[16:0],dina[7:0],douta[7:0],clkb,web[0:0],addrb[16:0],dinb[7:0],doutb[7:0]" */;
  input clka;
  input [0:0]wea;
  input [16:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  input clkb;
  input [0:0]web;
  input [16:0]addrb;
  input [7:0]dinb;
  output [7:0]doutb;
endmodule
