-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Aug 16 12:35:54 2018
-- Host        : Skyworks-WinServer running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/harry/Desktop/TrivialMIPS/vivado/TrivialMIPS.srcs/ip/top_clk_wiz/top_clk_wiz_stub.vhdl
-- Design      : top_clk_wiz
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg676-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_clk_wiz is
  Port ( 
    out_10M : out STD_LOGIC;
    out_30M : out STD_LOGIC;
    out_60M : out STD_LOGIC;
    out_60M_shift : out STD_LOGIC;
    out_40M : out STD_LOGIC;
    out_80M : out STD_LOGIC;
    out_80M_shift : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end top_clk_wiz;

architecture stub of top_clk_wiz is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "out_10M,out_30M,out_60M,out_60M_shift,out_40M,out_80M,out_80M_shift,reset,locked,clk_in1";
begin
end;
