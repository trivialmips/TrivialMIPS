-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Wed Aug 15 23:01:41 2018
-- Host        : Harry-XPS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {C:/Users/Harry
--               Chen/Documents/Workspace/TrivialMIPS/vivado/TrivialMIPS.srcs/ip/blk_mem_bootrom/blk_mem_bootrom_stub.vhdl}
-- Design      : blk_mem_bootrom
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg676-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_mem_bootrom is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 11 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 11 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end blk_mem_bootrom;

architecture stub of blk_mem_bootrom is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[11:0],douta[31:0],clkb,addrb[11:0],doutb[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_1,Vivado 2018.1";
begin
end;
