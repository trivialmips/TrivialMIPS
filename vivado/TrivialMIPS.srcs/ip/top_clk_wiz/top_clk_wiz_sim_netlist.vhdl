-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Aug 16 12:35:54 2018
-- Host        : Skyworks-WinServer running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/harry/Desktop/TrivialMIPS/vivado/TrivialMIPS.srcs/ip/top_clk_wiz/top_clk_wiz_sim_netlist.vhdl
-- Design      : top_clk_wiz
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tfgg676-2L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_clk_wiz_top_clk_wiz_clk_wiz is
  port (
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
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of top_clk_wiz_top_clk_wiz_clk_wiz : entity is "top_clk_wiz_clk_wiz";
end top_clk_wiz_top_clk_wiz_clk_wiz;

architecture STRUCTURE of top_clk_wiz_top_clk_wiz_clk_wiz is
  signal clk_in1_top_clk_wiz : STD_LOGIC;
  signal clkfbout_buf_top_clk_wiz : STD_LOGIC;
  signal clkfbout_top_clk_wiz : STD_LOGIC;
  signal out_10M_top_clk_wiz : STD_LOGIC;
  signal out_30M_top_clk_wiz : STD_LOGIC;
  signal out_40M_top_clk_wiz : STD_LOGIC;
  signal out_60M_shift_top_clk_wiz : STD_LOGIC;
  signal out_60M_top_clk_wiz : STD_LOGIC;
  signal out_80M_shift_top_clk_wiz : STD_LOGIC;
  signal out_80M_top_clk_wiz : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout3_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout4_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout5_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout6_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout7_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_top_clk_wiz,
      O => clkfbout_buf_top_clk_wiz
    );
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1,
      O => clk_in1_top_clk_wiz
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => out_10M_top_clk_wiz,
      O => out_10M
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => out_30M_top_clk_wiz,
      O => out_30M
    );
clkout3_buf: unisim.vcomponents.BUFG
     port map (
      I => out_60M_top_clk_wiz,
      O => out_60M
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => out_60M_shift_top_clk_wiz,
      O => out_60M_shift
    );
clkout5_buf: unisim.vcomponents.BUFG
     port map (
      I => out_40M_top_clk_wiz,
      O => out_40M
    );
clkout6_buf: unisim.vcomponents.BUFG
     port map (
      I => out_80M_top_clk_wiz,
      O => out_80M
    );
clkout7_buf: unisim.vcomponents.BUFG
     port map (
      I => out_80M_shift_top_clk_wiz,
      O => out_80M_shift
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 24.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 20.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 120.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 40,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 20,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 20,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => -45.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 30,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 15,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 15,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => -45.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_top_clk_wiz,
      CLKFBOUT => clkfbout_top_clk_wiz,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1_top_clk_wiz,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => out_10M_top_clk_wiz,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => out_30M_top_clk_wiz,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => out_60M_top_clk_wiz,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => out_60M_shift_top_clk_wiz,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => out_40M_top_clk_wiz,
      CLKOUT5 => out_80M_top_clk_wiz,
      CLKOUT6 => out_80M_shift_top_clk_wiz,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top_clk_wiz is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top_clk_wiz : entity is true;
end top_clk_wiz;

architecture STRUCTURE of top_clk_wiz is
begin
inst: entity work.top_clk_wiz_top_clk_wiz_clk_wiz
     port map (
      clk_in1 => clk_in1,
      locked => locked,
      out_10M => out_10M,
      out_30M => out_30M,
      out_40M => out_40M,
      out_60M => out_60M,
      out_60M_shift => out_60M_shift,
      out_80M => out_80M,
      out_80M_shift => out_80M_shift,
      reset => reset
    );
end STRUCTURE;
