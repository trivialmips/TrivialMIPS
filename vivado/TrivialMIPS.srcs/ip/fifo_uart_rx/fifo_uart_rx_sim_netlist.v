// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Jul 12 16:59:15 2018
// Host        : Harry-XPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/Harry
//               Chen/Documents/Workspace/TrivialMIPS/vivado/TrivialMIPS.srcs/ip/fifo_uart_rx/fifo_uart_rx_sim_netlist.v}
// Design      : fifo_uart_rx
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_uart_rx,fifo_generator_v13_2_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_2,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module fifo_uart_rx
   (clk,
    srst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, PHASE 0.000" *) input clk;
  input srst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [11:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "2kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "2047" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2046" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "12" *) 
  (* C_RD_DEPTH = "2048" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "11" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "1" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "11" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  fifo_uart_rx_fifo_generator_v13_2_2 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[11:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module fifo_uart_rx_blk_mem_gen_generic_cstr
   (D,
    clk,
    ram_full_fb_i_reg,
    tmp_ram_rd_en,
    srst,
    \gcc0.gc0.count_d1_reg[10] ,
    \gc0.count_d1_reg[10] ,
    din);
  output [7:0]D;
  input clk;
  input [0:0]ram_full_fb_i_reg;
  input tmp_ram_rd_en;
  input srst;
  input [10:0]\gcc0.gc0.count_d1_reg[10] ;
  input [10:0]\gc0.count_d1_reg[10] ;
  input [7:0]din;

  wire [7:0]D;
  wire clk;
  wire [7:0]din;
  wire [10:0]\gc0.count_d1_reg[10] ;
  wire [10:0]\gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]ram_full_fb_i_reg;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_uart_rx_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.D(D),
        .clk(clk),
        .din(din),
        .\gc0.count_d1_reg[10] (\gc0.count_d1_reg[10] ),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10] ),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_uart_rx_blk_mem_gen_prim_width
   (D,
    clk,
    ram_full_fb_i_reg,
    tmp_ram_rd_en,
    srst,
    \gcc0.gc0.count_d1_reg[10] ,
    \gc0.count_d1_reg[10] ,
    din);
  output [7:0]D;
  input clk;
  input [0:0]ram_full_fb_i_reg;
  input tmp_ram_rd_en;
  input srst;
  input [10:0]\gcc0.gc0.count_d1_reg[10] ;
  input [10:0]\gc0.count_d1_reg[10] ;
  input [7:0]din;

  wire [7:0]D;
  wire clk;
  wire [7:0]din;
  wire [10:0]\gc0.count_d1_reg[10] ;
  wire [10:0]\gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]ram_full_fb_i_reg;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_uart_rx_blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.D(D),
        .clk(clk),
        .din(din),
        .\gc0.count_d1_reg[10] (\gc0.count_d1_reg[10] ),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10] ),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_uart_rx_blk_mem_gen_prim_wrapper
   (D,
    clk,
    ram_full_fb_i_reg,
    tmp_ram_rd_en,
    srst,
    \gcc0.gc0.count_d1_reg[10] ,
    \gc0.count_d1_reg[10] ,
    din);
  output [7:0]D;
  input clk;
  input [0:0]ram_full_fb_i_reg;
  input tmp_ram_rd_en;
  input srst;
  input [10:0]\gcc0.gc0.count_d1_reg[10] ;
  input [10:0]\gc0.count_d1_reg[10] ;
  input [7:0]din;

  wire [7:0]D;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_n_35 ;
  wire clk;
  wire [7:0]din;
  wire [10:0]\gc0.count_d1_reg[10] ;
  wire [10:0]\gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]ram_full_fb_i_reg;
  wire srst;
  wire tmp_ram_rd_en;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({\gcc0.gc0.count_d1_reg[10] ,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({\gc0.count_d1_reg[10] ,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:8],D}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1],\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_n_35 }),
        .ENARDEN(ram_full_fb_i_reg),
        .ENBWREN(tmp_ram_rd_en),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(srst),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({ram_full_fb_i_reg,ram_full_fb_i_reg}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module fifo_uart_rx_blk_mem_gen_top
   (D,
    clk,
    ram_full_fb_i_reg,
    tmp_ram_rd_en,
    srst,
    \gcc0.gc0.count_d1_reg[10] ,
    \gc0.count_d1_reg[10] ,
    din);
  output [7:0]D;
  input clk;
  input [0:0]ram_full_fb_i_reg;
  input tmp_ram_rd_en;
  input srst;
  input [10:0]\gcc0.gc0.count_d1_reg[10] ;
  input [10:0]\gc0.count_d1_reg[10] ;
  input [7:0]din;

  wire [7:0]D;
  wire clk;
  wire [7:0]din;
  wire [10:0]\gc0.count_d1_reg[10] ;
  wire [10:0]\gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]ram_full_fb_i_reg;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_uart_rx_blk_mem_gen_generic_cstr \valid.cstr 
       (.D(D),
        .clk(clk),
        .din(din),
        .\gc0.count_d1_reg[10] (\gc0.count_d1_reg[10] ),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10] ),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_1" *) 
module fifo_uart_rx_blk_mem_gen_v8_4_1
   (D,
    clk,
    ram_full_fb_i_reg,
    tmp_ram_rd_en,
    srst,
    \gcc0.gc0.count_d1_reg[10] ,
    \gc0.count_d1_reg[10] ,
    din);
  output [7:0]D;
  input clk;
  input [0:0]ram_full_fb_i_reg;
  input tmp_ram_rd_en;
  input srst;
  input [10:0]\gcc0.gc0.count_d1_reg[10] ;
  input [10:0]\gc0.count_d1_reg[10] ;
  input [7:0]din;

  wire [7:0]D;
  wire clk;
  wire [7:0]din;
  wire [10:0]\gc0.count_d1_reg[10] ;
  wire [10:0]\gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]ram_full_fb_i_reg;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_uart_rx_blk_mem_gen_v8_4_1_synth inst_blk_mem_gen
       (.D(D),
        .clk(clk),
        .din(din),
        .\gc0.count_d1_reg[10] (\gc0.count_d1_reg[10] ),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10] ),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_1_synth" *) 
module fifo_uart_rx_blk_mem_gen_v8_4_1_synth
   (D,
    clk,
    ram_full_fb_i_reg,
    tmp_ram_rd_en,
    srst,
    \gcc0.gc0.count_d1_reg[10] ,
    \gc0.count_d1_reg[10] ,
    din);
  output [7:0]D;
  input clk;
  input [0:0]ram_full_fb_i_reg;
  input tmp_ram_rd_en;
  input srst;
  input [10:0]\gcc0.gc0.count_d1_reg[10] ;
  input [10:0]\gc0.count_d1_reg[10] ;
  input [7:0]din;

  wire [7:0]D;
  wire clk;
  wire [7:0]din;
  wire [10:0]\gc0.count_d1_reg[10] ;
  wire [10:0]\gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]ram_full_fb_i_reg;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_uart_rx_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.D(D),
        .clk(clk),
        .din(din),
        .\gc0.count_d1_reg[10] (\gc0.count_d1_reg[10] ),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10] ),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_uart_rx_compare
   (comp0,
    \gc0.count_d1_reg[8] ,
    v1_reg);
  output comp0;
  input [4:0]\gc0.count_d1_reg[8] ;
  input [0:0]v1_reg;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire comp0;
  wire [4:0]\gc0.count_d1_reg[8] ;
  wire [0:0]v1_reg;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gc0.count_d1_reg[8] [3:0]));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:2],comp0,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:2],1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:2],v1_reg,\gc0.count_d1_reg[8] [4]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_uart_rx_compare_0
   (ram_full_comb,
    \gc0.count_d1_reg[8] ,
    v1_reg_0,
    wr_en,
    comp0,
    E,
    out);
  output ram_full_comb;
  input [4:0]\gc0.count_d1_reg[8] ;
  input [0:0]v1_reg_0;
  input wr_en;
  input comp0;
  input [0:0]E;
  input out;

  wire [0:0]E;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire comp0;
  wire comp1;
  wire [4:0]\gc0.count_d1_reg[8] ;
  wire out;
  wire ram_full_comb;
  wire [0:0]v1_reg_0;
  wire wr_en;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(\gc0.count_d1_reg[8] [3:0]));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:2],comp1,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:2],1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:2],v1_reg_0,\gc0.count_d1_reg[8] [4]}));
  LUT5 #(
    .INIT(32'h0FFF0088)) 
    ram_full_fb_i_i_1
       (.I0(wr_en),
        .I1(comp1),
        .I2(comp0),
        .I3(E),
        .I4(out),
        .O(ram_full_comb));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_uart_rx_compare_1
   (comp0,
    \gc0.count_d1_reg[0] ,
    \gc0.count_d1_reg[2] ,
    \gc0.count_d1_reg[4] ,
    \gc0.count_d1_reg[6] ,
    \gc0.count_d1_reg[8] ,
    \gcc0.gc0.count_d1_reg[10] );
  output comp0;
  input \gc0.count_d1_reg[0] ;
  input \gc0.count_d1_reg[2] ;
  input \gc0.count_d1_reg[4] ;
  input \gc0.count_d1_reg[6] ;
  input \gc0.count_d1_reg[8] ;
  input \gcc0.gc0.count_d1_reg[10] ;

  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire comp0;
  wire \gc0.count_d1_reg[0] ;
  wire \gc0.count_d1_reg[2] ;
  wire \gc0.count_d1_reg[4] ;
  wire \gc0.count_d1_reg[6] ;
  wire \gc0.count_d1_reg[8] ;
  wire \gcc0.gc0.count_d1_reg[10] ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S({\gc0.count_d1_reg[6] ,\gc0.count_d1_reg[4] ,\gc0.count_d1_reg[2] ,\gc0.count_d1_reg[0] }));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:2],comp0,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:2],1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:2],\gcc0.gc0.count_d1_reg[10] ,\gc0.count_d1_reg[8] }));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_uart_rx_compare_2
   (ram_empty_i_reg,
    v1_reg,
    \gcc0.gc0.count_d1_reg[10] ,
    E,
    comp0,
    ram_full_fb_i_reg,
    wr_en,
    out);
  output ram_empty_i_reg;
  input [4:0]v1_reg;
  input [0:0]\gcc0.gc0.count_d1_reg[10] ;
  input [0:0]E;
  input comp0;
  input ram_full_fb_i_reg;
  input wr_en;
  input out;

  wire [0:0]E;
  wire carrynet_0;
  wire carrynet_1;
  wire carrynet_2;
  wire carrynet_3;
  wire carrynet_4;
  wire comp0;
  wire comp1;
  wire [0:0]\gcc0.gc0.count_d1_reg[10] ;
  wire out;
  wire ram_empty_i_reg;
  wire ram_full_fb_i_reg;
  wire [4:0]v1_reg;
  wire wr_en;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:2]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({carrynet_3,carrynet_2,carrynet_1,carrynet_0}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg[3:0]));
  (* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
  (* box_type = "PRIMITIVE" *) 
  CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(carrynet_3),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:2],comp1,carrynet_4}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:2],1'b0,1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:2],\gcc0.gc0.count_d1_reg[10] ,v1_reg[4]}));
  LUT6 #(
    .INIT(64'hFF0FFFFF88008888)) 
    ram_empty_fb_i_i_1
       (.I0(E),
        .I1(comp1),
        .I2(comp0),
        .I3(ram_full_fb_i_reg),
        .I4(wr_en),
        .I5(out),
        .O(ram_empty_i_reg));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module fifo_uart_rx_fifo_generator_ramfifo
   (empty,
    full,
    dout,
    clk,
    srst,
    din,
    rd_en,
    wr_en);
  output empty;
  output full;
  output [7:0]dout;
  input clk;
  input srst;
  input [7:0]din;
  input rd_en;
  input wr_en;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire \gntv_or_sync_fifo.gl0.wr_n_0 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_25 ;
  wire [5:5]\grss.rsts/c2/v1_reg ;
  wire [4:0]\gwss.wsts/c0/v1_reg ;
  wire [4:0]\gwss.wsts/c1/v1_reg ;
  wire [10:0]p_0_out;
  wire [10:0]p_11_out;
  wire [9:0]p_12_out;
  wire p_17_out;
  wire p_5_out;
  wire p_7_out;
  wire rd_en;
  wire [10:10]rd_pntr_plus1;
  wire srst;
  wire tmp_ram_rd_en;
  wire wr_en;

  fifo_uart_rx_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram (p_0_out),
        .E(p_7_out),
        .Q(rd_pntr_plus1),
        .clk(clk),
        .empty(empty),
        .\gcc0.gc0.count_d1_reg[10] (\gntv_or_sync_fifo.gl0.wr_n_25 ),
        .\gcc0.gc0.count_d1_reg[10]_0 (\grss.rsts/c2/v1_reg ),
        .\gcc0.gc0.count_d1_reg[9] (p_11_out[9:0]),
        .\gcc0.gc0.count_reg[9] (p_12_out),
        .\goreg_bm.dout_i_reg[7] (p_5_out),
        .out(\gntv_or_sync_fifo.gl0.wr_n_0 ),
        .rd_en(rd_en),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en),
        .v1_reg(\gwss.wsts/c0/v1_reg ),
        .v1_reg_0(\gwss.wsts/c1/v1_reg ),
        .wr_en(wr_en));
  fifo_uart_rx_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram (p_11_out),
        .E(p_7_out),
        .Q(p_12_out),
        .clk(clk),
        .full(full),
        .\gc0.count_d1_reg[10] (p_0_out[10]),
        .\gc0.count_d1_reg[8] (\gwss.wsts/c0/v1_reg ),
        .\gc0.count_d1_reg[8]_0 (\gwss.wsts/c1/v1_reg ),
        .\gc0.count_reg[10] (rd_pntr_plus1),
        .\gcc0.gc0.count_reg[10] (p_17_out),
        .out(\gntv_or_sync_fifo.gl0.wr_n_0 ),
        .ram_empty_i_reg(\grss.rsts/c2/v1_reg ),
        .ram_empty_i_reg_0(\gntv_or_sync_fifo.gl0.wr_n_25 ),
        .srst(srst),
        .wr_en(wr_en));
  fifo_uart_rx_memory \gntv_or_sync_fifo.mem 
       (.E(p_5_out),
        .clk(clk),
        .din(din),
        .dout(dout),
        .\gc0.count_d1_reg[10] (p_0_out),
        .\gcc0.gc0.count_d1_reg[10] (p_11_out),
        .ram_full_fb_i_reg(p_17_out),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module fifo_uart_rx_fifo_generator_top
   (empty,
    full,
    dout,
    clk,
    srst,
    din,
    rd_en,
    wr_en);
  output empty;
  output full;
  output [7:0]dout;
  input clk;
  input srst;
  input [7:0]din;
  input rd_en;
  input wr_en;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire wr_en;

  fifo_uart_rx_fifo_generator_ramfifo \grf.rf 
       (.clk(clk),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_en(rd_en),
        .srst(srst),
        .wr_en(wr_en));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "1" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "12" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "8" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "8" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "artix7" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "1" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "0" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "2kx9" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "2047" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "2046" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "12" *) 
(* C_RD_DEPTH = "2048" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "11" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "1" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "12" *) 
(* C_WR_DEPTH = "2048" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "11" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_2_2" *) 
module fifo_uart_rx_fifo_generator_v13_2_2
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [7:0]din;
  input wr_en;
  input rd_en;
  input [10:0]prog_empty_thresh;
  input [10:0]prog_empty_thresh_assert;
  input [10:0]prog_empty_thresh_negate;
  input [10:0]prog_full_thresh;
  input [10:0]prog_full_thresh_assert;
  input [10:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [7:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [11:0]data_count;
  output [11:0]rd_data_count;
  output [11:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire wr_en;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const1> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[11] = \<const0> ;
  assign data_count[10] = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[11] = \<const0> ;
  assign rd_data_count[10] = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[11] = \<const0> ;
  assign wr_data_count[10] = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  assign wr_rst_busy = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  fifo_uart_rx_fifo_generator_v13_2_2_synth inst_fifo_gen
       (.clk(clk),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_en(rd_en),
        .srst(srst),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v13_2_2_synth" *) 
module fifo_uart_rx_fifo_generator_v13_2_2_synth
   (empty,
    full,
    dout,
    clk,
    srst,
    din,
    rd_en,
    wr_en);
  output empty;
  output full;
  output [7:0]dout;
  input clk;
  input srst;
  input [7:0]din;
  input rd_en;
  input wr_en;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire srst;
  wire wr_en;

  fifo_uart_rx_fifo_generator_top \gconvfifo.rf 
       (.clk(clk),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .rd_en(rd_en),
        .srst(srst),
        .wr_en(wr_en));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module fifo_uart_rx_memory
   (dout,
    clk,
    ram_full_fb_i_reg,
    tmp_ram_rd_en,
    srst,
    \gcc0.gc0.count_d1_reg[10] ,
    \gc0.count_d1_reg[10] ,
    din,
    E);
  output [7:0]dout;
  input clk;
  input [0:0]ram_full_fb_i_reg;
  input tmp_ram_rd_en;
  input srst;
  input [10:0]\gcc0.gc0.count_d1_reg[10] ;
  input [10:0]\gc0.count_d1_reg[10] ;
  input [7:0]din;
  input [0:0]E;

  wire [0:0]E;
  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire [7:0]doutb;
  wire [10:0]\gc0.count_d1_reg[10] ;
  wire [10:0]\gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]ram_full_fb_i_reg;
  wire srst;
  wire tmp_ram_rd_en;

  fifo_uart_rx_blk_mem_gen_v8_4_1 \gbm.gbmg.gbmga.ngecc.bmg 
       (.D(doutb),
        .clk(clk),
        .din(din),
        .\gc0.count_d1_reg[10] (\gc0.count_d1_reg[10] ),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10] ),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[0] 
       (.C(clk),
        .CE(E),
        .D(doutb[0]),
        .Q(dout[0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[1] 
       (.C(clk),
        .CE(E),
        .D(doutb[1]),
        .Q(dout[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[2] 
       (.C(clk),
        .CE(E),
        .D(doutb[2]),
        .Q(dout[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[3] 
       (.C(clk),
        .CE(E),
        .D(doutb[3]),
        .Q(dout[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[4] 
       (.C(clk),
        .CE(E),
        .D(doutb[4]),
        .Q(dout[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[5] 
       (.C(clk),
        .CE(E),
        .D(doutb[5]),
        .Q(dout[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[6] 
       (.C(clk),
        .CE(E),
        .D(doutb[6]),
        .Q(dout[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_bm.dout_i_reg[7] 
       (.C(clk),
        .CE(E),
        .D(doutb[7]),
        .Q(dout[7]),
        .R(srst));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module fifo_uart_rx_rd_bin_cntr
   (Q,
    v1_reg,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,
    v1_reg_1,
    v1_reg_0,
    ram_empty_i_reg,
    ram_empty_i_reg_0,
    ram_empty_i_reg_1,
    ram_empty_i_reg_2,
    ram_empty_i_reg_3,
    \gcc0.gc0.count_d1_reg[9] ,
    \gcc0.gc0.count_reg[9] ,
    srst,
    E,
    clk);
  output [0:0]Q;
  output [4:0]v1_reg;
  output [10:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  output [4:0]v1_reg_1;
  output [4:0]v1_reg_0;
  output ram_empty_i_reg;
  output ram_empty_i_reg_0;
  output ram_empty_i_reg_1;
  output ram_empty_i_reg_2;
  output ram_empty_i_reg_3;
  input [9:0]\gcc0.gc0.count_d1_reg[9] ;
  input [9:0]\gcc0.gc0.count_reg[9] ;
  input srst;
  input [0:0]E;
  input clk;

  wire [10:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire [0:0]E;
  wire [0:0]Q;
  wire clk;
  wire \gc0.count[10]_i_2_n_0 ;
  wire [9:0]\gcc0.gc0.count_d1_reg[9] ;
  wire [9:0]\gcc0.gc0.count_reg[9] ;
  wire [10:0]plusOp;
  wire ram_empty_i_reg;
  wire ram_empty_i_reg_0;
  wire ram_empty_i_reg_1;
  wire ram_empty_i_reg_2;
  wire ram_empty_i_reg_3;
  wire [9:0]rd_pntr_plus1;
  wire srst;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire [4:0]v1_reg_1;

  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .O(plusOp[0]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gc0.count[10]_i_1 
       (.I0(rd_pntr_plus1[8]),
        .I1(rd_pntr_plus1[6]),
        .I2(\gc0.count[10]_i_2_n_0 ),
        .I3(rd_pntr_plus1[7]),
        .I4(rd_pntr_plus1[9]),
        .I5(Q),
        .O(plusOp[10]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gc0.count[10]_i_2 
       (.I0(rd_pntr_plus1[5]),
        .I1(rd_pntr_plus1[3]),
        .I2(rd_pntr_plus1[1]),
        .I3(rd_pntr_plus1[0]),
        .I4(rd_pntr_plus1[2]),
        .I5(rd_pntr_plus1[4]),
        .O(\gc0.count[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[1]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .I1(rd_pntr_plus1[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc0.count[2]_i_1 
       (.I0(rd_pntr_plus1[0]),
        .I1(rd_pntr_plus1[1]),
        .I2(rd_pntr_plus1[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[3]_i_1 
       (.I0(rd_pntr_plus1[1]),
        .I1(rd_pntr_plus1[0]),
        .I2(rd_pntr_plus1[2]),
        .I3(rd_pntr_plus1[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc0.count[4]_i_1 
       (.I0(rd_pntr_plus1[2]),
        .I1(rd_pntr_plus1[0]),
        .I2(rd_pntr_plus1[1]),
        .I3(rd_pntr_plus1[3]),
        .I4(rd_pntr_plus1[4]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gc0.count[5]_i_1 
       (.I0(rd_pntr_plus1[3]),
        .I1(rd_pntr_plus1[1]),
        .I2(rd_pntr_plus1[0]),
        .I3(rd_pntr_plus1[2]),
        .I4(rd_pntr_plus1[4]),
        .I5(rd_pntr_plus1[5]),
        .O(plusOp[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[6]_i_1 
       (.I0(\gc0.count[10]_i_2_n_0 ),
        .I1(rd_pntr_plus1[6]),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gc0.count[7]_i_1 
       (.I0(\gc0.count[10]_i_2_n_0 ),
        .I1(rd_pntr_plus1[6]),
        .I2(rd_pntr_plus1[7]),
        .O(plusOp[7]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gc0.count[8]_i_1 
       (.I0(rd_pntr_plus1[6]),
        .I1(\gc0.count[10]_i_2_n_0 ),
        .I2(rd_pntr_plus1[7]),
        .I3(rd_pntr_plus1[8]),
        .O(plusOp[8]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gc0.count[9]_i_1 
       (.I0(rd_pntr_plus1[7]),
        .I1(\gc0.count[10]_i_2_n_0 ),
        .I2(rd_pntr_plus1[6]),
        .I3(rd_pntr_plus1[8]),
        .I4(rd_pntr_plus1[9]),
        .O(plusOp[9]));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[0]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[10] 
       (.C(clk),
        .CE(E),
        .D(Q),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[1]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[2]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[3]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[4]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[5] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[5]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[6] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[6]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[7] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[7]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[8] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[8]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[9] 
       (.C(clk),
        .CE(E),
        .D(rd_pntr_plus1[9]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [9]),
        .R(srst));
  FDSE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(clk),
        .CE(E),
        .D(plusOp[0]),
        .Q(rd_pntr_plus1[0]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[10] 
       (.C(clk),
        .CE(E),
        .D(plusOp[10]),
        .Q(Q),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(clk),
        .CE(E),
        .D(plusOp[1]),
        .Q(rd_pntr_plus1[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(clk),
        .CE(E),
        .D(plusOp[2]),
        .Q(rd_pntr_plus1[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(clk),
        .CE(E),
        .D(plusOp[3]),
        .Q(rd_pntr_plus1[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(clk),
        .CE(E),
        .D(plusOp[4]),
        .Q(rd_pntr_plus1[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[5] 
       (.C(clk),
        .CE(E),
        .D(plusOp[5]),
        .Q(rd_pntr_plus1[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[6] 
       (.C(clk),
        .CE(E),
        .D(plusOp[6]),
        .Q(rd_pntr_plus1[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[7] 
       (.C(clk),
        .CE(E),
        .D(plusOp[7]),
        .Q(rd_pntr_plus1[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[8] 
       (.C(clk),
        .CE(E),
        .D(plusOp[8]),
        .Q(rd_pntr_plus1[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gc0.count_reg[9] 
       (.C(clk),
        .CE(E),
        .D(plusOp[9]),
        .Q(rd_pntr_plus1[9]),
        .R(srst));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [0]),
        .I1(\gcc0.gc0.count_d1_reg[9] [0]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [1]),
        .I3(\gcc0.gc0.count_d1_reg[9] [1]),
        .O(v1_reg[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(rd_pntr_plus1[0]),
        .I1(\gcc0.gc0.count_d1_reg[9] [0]),
        .I2(rd_pntr_plus1[1]),
        .I3(\gcc0.gc0.count_d1_reg[9] [1]),
        .O(v1_reg_1[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [0]),
        .I1(\gcc0.gc0.count_reg[9] [0]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [1]),
        .I3(\gcc0.gc0.count_reg[9] [1]),
        .O(v1_reg_0[0]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [0]),
        .I1(\gcc0.gc0.count_d1_reg[9] [0]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [1]),
        .I3(\gcc0.gc0.count_d1_reg[9] [1]),
        .O(ram_empty_i_reg));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [2]),
        .I1(\gcc0.gc0.count_d1_reg[9] [2]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [3]),
        .I3(\gcc0.gc0.count_d1_reg[9] [3]),
        .O(v1_reg[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[2]),
        .I1(\gcc0.gc0.count_d1_reg[9] [2]),
        .I2(rd_pntr_plus1[3]),
        .I3(\gcc0.gc0.count_d1_reg[9] [3]),
        .O(v1_reg_1[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [2]),
        .I1(\gcc0.gc0.count_reg[9] [2]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [3]),
        .I3(\gcc0.gc0.count_reg[9] [3]),
        .O(v1_reg_0[1]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[1].gms.ms_i_1__2 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [2]),
        .I1(\gcc0.gc0.count_d1_reg[9] [2]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [3]),
        .I3(\gcc0.gc0.count_d1_reg[9] [3]),
        .O(ram_empty_i_reg_0));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [4]),
        .I1(\gcc0.gc0.count_d1_reg[9] [4]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [5]),
        .I3(\gcc0.gc0.count_d1_reg[9] [5]),
        .O(v1_reg[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[4]),
        .I1(\gcc0.gc0.count_d1_reg[9] [4]),
        .I2(rd_pntr_plus1[5]),
        .I3(\gcc0.gc0.count_d1_reg[9] [5]),
        .O(v1_reg_1[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [4]),
        .I1(\gcc0.gc0.count_reg[9] [4]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [5]),
        .I3(\gcc0.gc0.count_reg[9] [5]),
        .O(v1_reg_0[2]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[2].gms.ms_i_1__2 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [4]),
        .I1(\gcc0.gc0.count_d1_reg[9] [4]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [5]),
        .I3(\gcc0.gc0.count_d1_reg[9] [5]),
        .O(ram_empty_i_reg_1));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [6]),
        .I1(\gcc0.gc0.count_d1_reg[9] [6]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [7]),
        .I3(\gcc0.gc0.count_d1_reg[9] [7]),
        .O(v1_reg[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[6]),
        .I1(\gcc0.gc0.count_d1_reg[9] [6]),
        .I2(rd_pntr_plus1[7]),
        .I3(\gcc0.gc0.count_d1_reg[9] [7]),
        .O(v1_reg_1[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [6]),
        .I1(\gcc0.gc0.count_reg[9] [6]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [7]),
        .I3(\gcc0.gc0.count_reg[9] [7]),
        .O(v1_reg_0[3]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[3].gms.ms_i_1__2 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [6]),
        .I1(\gcc0.gc0.count_d1_reg[9] [6]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [7]),
        .I3(\gcc0.gc0.count_d1_reg[9] [7]),
        .O(ram_empty_i_reg_2));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [8]),
        .I1(\gcc0.gc0.count_d1_reg[9] [8]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [9]),
        .I3(\gcc0.gc0.count_d1_reg[9] [9]),
        .O(v1_reg[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__0 
       (.I0(rd_pntr_plus1[8]),
        .I1(\gcc0.gc0.count_d1_reg[9] [8]),
        .I2(rd_pntr_plus1[9]),
        .I3(\gcc0.gc0.count_d1_reg[9] [9]),
        .O(v1_reg_1[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [8]),
        .I1(\gcc0.gc0.count_reg[9] [8]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [9]),
        .I3(\gcc0.gc0.count_reg[9] [9]),
        .O(v1_reg_0[4]));
  LUT4 #(
    .INIT(16'h9009)) 
    \gmux.gm[4].gms.ms_i_1__2 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [8]),
        .I1(\gcc0.gc0.count_d1_reg[9] [8]),
        .I2(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [9]),
        .I3(\gcc0.gc0.count_d1_reg[9] [9]),
        .O(ram_empty_i_reg_3));
endmodule

(* ORIG_REF_NAME = "rd_fwft" *) 
module fifo_uart_rx_rd_fwft
   (empty,
    tmp_ram_rd_en,
    \goreg_bm.dout_i_reg[7] ,
    E,
    srst,
    clk,
    rd_en,
    out);
  output empty;
  output tmp_ram_rd_en;
  output [0:0]\goreg_bm.dout_i_reg[7] ;
  output [0:0]E;
  input srst;
  input clk;
  input rd_en;
  input out;

  wire [0:0]E;
  (* DONT_TOUCH *) wire aempty_fwft_fb_i;
  (* DONT_TOUCH *) wire aempty_fwft_i;
  wire aempty_fwft_i0__1;
  wire clk;
  (* DONT_TOUCH *) wire [1:0]curr_fwft_state;
  (* DONT_TOUCH *) wire empty_fwft_fb_i;
  (* DONT_TOUCH *) wire empty_fwft_fb_o_i;
  wire empty_fwft_fb_o_i_reg0;
  (* DONT_TOUCH *) wire empty_fwft_i;
  wire empty_fwft_i0__1;
  wire [0:0]\goreg_bm.dout_i_reg[7] ;
  wire [1:0]next_fwft_state;
  wire out;
  wire rd_en;
  wire srst;
  wire tmp_ram_rd_en;
  (* DONT_TOUCH *) wire user_valid;

  assign empty = empty_fwft_i;
  LUT5 #(
    .INIT(32'hFFFF4555)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_i_2 
       (.I0(out),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .I4(srst),
        .O(tmp_ram_rd_en));
  LUT5 #(
    .INIT(32'hFFCB8000)) 
    aempty_fwft_fb_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .I3(out),
        .I4(aempty_fwft_fb_i),
        .O(aempty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_fb_i),
        .S(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    aempty_fwft_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(aempty_fwft_i0__1),
        .Q(aempty_fwft_i),
        .S(srst));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_i),
        .O(empty_fwft_i0__1));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_fb_i),
        .S(srst));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_o_i_i_1
       (.I0(rd_en),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_o_i),
        .O(empty_fwft_fb_o_i_reg0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_fb_o_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(empty_fwft_fb_o_i_reg0),
        .Q(empty_fwft_fb_o_i),
        .S(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(empty_fwft_i0__1),
        .Q(empty_fwft_i),
        .S(srst));
  LUT4 #(
    .INIT(16'h4555)) 
    \gc0.count_d1[10]_i_1 
       (.I0(out),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .O(E));
  LUT3 #(
    .INIT(8'hA2)) 
    \goreg_bm.dout_i[7]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(curr_fwft_state[0]),
        .I2(rd_en),
        .O(\goreg_bm.dout_i_reg[7] ));
  LUT3 #(
    .INIT(8'hBA)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(rd_en),
        .I2(curr_fwft_state[0]),
        .O(next_fwft_state[0]));
  LUT4 #(
    .INIT(16'h20FF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(rd_en),
        .I2(curr_fwft_state[0]),
        .I3(out),
        .O(next_fwft_state[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(curr_fwft_state[0]),
        .R(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(next_fwft_state[1]),
        .Q(curr_fwft_state[1]),
        .R(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    \gpregsm1.user_valid_reg 
       (.C(clk),
        .CE(1'b1),
        .D(next_fwft_state[0]),
        .Q(user_valid),
        .R(srst));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module fifo_uart_rx_rd_logic
   (empty,
    E,
    Q,
    v1_reg,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,
    tmp_ram_rd_en,
    \goreg_bm.dout_i_reg[7] ,
    v1_reg_0,
    \gcc0.gc0.count_d1_reg[10] ,
    \gcc0.gc0.count_d1_reg[10]_0 ,
    srst,
    clk,
    rd_en,
    out,
    wr_en,
    \gcc0.gc0.count_d1_reg[9] ,
    \gcc0.gc0.count_reg[9] );
  output empty;
  output [0:0]E;
  output [0:0]Q;
  output [4:0]v1_reg;
  output [10:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  output tmp_ram_rd_en;
  output [0:0]\goreg_bm.dout_i_reg[7] ;
  output [4:0]v1_reg_0;
  input \gcc0.gc0.count_d1_reg[10] ;
  input [0:0]\gcc0.gc0.count_d1_reg[10]_0 ;
  input srst;
  input clk;
  input rd_en;
  input out;
  input wr_en;
  input [9:0]\gcc0.gc0.count_d1_reg[9] ;
  input [9:0]\gcc0.gc0.count_reg[9] ;

  wire [10:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire [0:0]E;
  wire [0:0]Q;
  wire [4:0]\c2/v1_reg ;
  wire clk;
  wire empty;
  wire \gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]\gcc0.gc0.count_d1_reg[10]_0 ;
  wire [9:0]\gcc0.gc0.count_d1_reg[9] ;
  wire [9:0]\gcc0.gc0.count_reg[9] ;
  wire [0:0]\goreg_bm.dout_i_reg[7] ;
  wire out;
  wire p_2_out;
  wire rd_en;
  wire rpntr_n_27;
  wire rpntr_n_28;
  wire rpntr_n_29;
  wire rpntr_n_30;
  wire rpntr_n_31;
  wire srst;
  wire tmp_ram_rd_en;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire wr_en;

  fifo_uart_rx_rd_fwft \gr1.gr1_int.rfwft 
       (.E(E),
        .clk(clk),
        .empty(empty),
        .\goreg_bm.dout_i_reg[7] (\goreg_bm.dout_i_reg[7] ),
        .out(p_2_out),
        .rd_en(rd_en),
        .srst(srst),
        .tmp_ram_rd_en(tmp_ram_rd_en));
  fifo_uart_rx_rd_status_flags_ss \grss.rsts 
       (.E(E),
        .clk(clk),
        .\gc0.count_d1_reg[0] (rpntr_n_27),
        .\gc0.count_d1_reg[2] (rpntr_n_28),
        .\gc0.count_d1_reg[4] (rpntr_n_29),
        .\gc0.count_d1_reg[6] (rpntr_n_30),
        .\gc0.count_d1_reg[8] (rpntr_n_31),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10] ),
        .\gcc0.gc0.count_d1_reg[10]_0 (\gcc0.gc0.count_d1_reg[10]_0 ),
        .out(p_2_out),
        .ram_full_fb_i_reg(out),
        .srst(srst),
        .v1_reg(\c2/v1_reg ),
        .wr_en(wr_en));
  fifo_uart_rx_rd_bin_cntr rpntr
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ),
        .E(E),
        .Q(Q),
        .clk(clk),
        .\gcc0.gc0.count_d1_reg[9] (\gcc0.gc0.count_d1_reg[9] ),
        .\gcc0.gc0.count_reg[9] (\gcc0.gc0.count_reg[9] ),
        .ram_empty_i_reg(rpntr_n_27),
        .ram_empty_i_reg_0(rpntr_n_28),
        .ram_empty_i_reg_1(rpntr_n_29),
        .ram_empty_i_reg_2(rpntr_n_30),
        .ram_empty_i_reg_3(rpntr_n_31),
        .srst(srst),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0),
        .v1_reg_1(\c2/v1_reg ));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_ss" *) 
module fifo_uart_rx_rd_status_flags_ss
   (out,
    \gc0.count_d1_reg[0] ,
    \gc0.count_d1_reg[2] ,
    \gc0.count_d1_reg[4] ,
    \gc0.count_d1_reg[6] ,
    \gc0.count_d1_reg[8] ,
    \gcc0.gc0.count_d1_reg[10] ,
    v1_reg,
    \gcc0.gc0.count_d1_reg[10]_0 ,
    srst,
    clk,
    E,
    ram_full_fb_i_reg,
    wr_en);
  output out;
  input \gc0.count_d1_reg[0] ;
  input \gc0.count_d1_reg[2] ;
  input \gc0.count_d1_reg[4] ;
  input \gc0.count_d1_reg[6] ;
  input \gc0.count_d1_reg[8] ;
  input \gcc0.gc0.count_d1_reg[10] ;
  input [4:0]v1_reg;
  input [0:0]\gcc0.gc0.count_d1_reg[10]_0 ;
  input srst;
  input clk;
  input [0:0]E;
  input ram_full_fb_i_reg;
  input wr_en;

  wire [0:0]E;
  wire c2_n_0;
  wire clk;
  wire comp0;
  wire \gc0.count_d1_reg[0] ;
  wire \gc0.count_d1_reg[2] ;
  wire \gc0.count_d1_reg[4] ;
  wire \gc0.count_d1_reg[6] ;
  wire \gc0.count_d1_reg[8] ;
  wire \gcc0.gc0.count_d1_reg[10] ;
  wire [0:0]\gcc0.gc0.count_d1_reg[10]_0 ;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  (* DONT_TOUCH *) wire ram_empty_i;
  wire ram_full_fb_i_reg;
  wire srst;
  wire [4:0]v1_reg;
  wire wr_en;

  assign out = ram_empty_fb_i;
  fifo_uart_rx_compare_1 c1
       (.comp0(comp0),
        .\gc0.count_d1_reg[0] (\gc0.count_d1_reg[0] ),
        .\gc0.count_d1_reg[2] (\gc0.count_d1_reg[2] ),
        .\gc0.count_d1_reg[4] (\gc0.count_d1_reg[4] ),
        .\gc0.count_d1_reg[6] (\gc0.count_d1_reg[6] ),
        .\gc0.count_d1_reg[8] (\gc0.count_d1_reg[8] ),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10] ));
  fifo_uart_rx_compare_2 c2
       (.E(E),
        .comp0(comp0),
        .\gcc0.gc0.count_d1_reg[10] (\gcc0.gc0.count_d1_reg[10]_0 ),
        .out(ram_empty_fb_i),
        .ram_empty_i_reg(c2_n_0),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .v1_reg(v1_reg),
        .wr_en(wr_en));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(c2_n_0),
        .Q(ram_empty_fb_i),
        .S(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDSE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(c2_n_0),
        .Q(ram_empty_i),
        .S(srst));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module fifo_uart_rx_wr_bin_cntr
   (Q,
    v1_reg,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,
    ram_empty_i_reg,
    v1_reg_0,
    ram_empty_i_reg_0,
    \gc0.count_d1_reg[10] ,
    \gc0.count_reg[10] ,
    srst,
    E,
    clk);
  output [9:0]Q;
  output [0:0]v1_reg;
  output [10:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  output [0:0]ram_empty_i_reg;
  output [0:0]v1_reg_0;
  output ram_empty_i_reg_0;
  input [0:0]\gc0.count_d1_reg[10] ;
  input [0:0]\gc0.count_reg[10] ;
  input srst;
  input [0:0]E;
  input clk;

  wire [10:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire [0:0]E;
  wire [9:0]Q;
  wire clk;
  wire [0:0]\gc0.count_d1_reg[10] ;
  wire [0:0]\gc0.count_reg[10] ;
  wire \gcc0.gc0.count[10]_i_2_n_0 ;
  wire [10:10]p_12_out;
  wire [10:0]plusOp__0;
  wire [0:0]ram_empty_i_reg;
  wire ram_empty_i_reg_0;
  wire srst;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;

  LUT1 #(
    .INIT(2'h1)) 
    \gcc0.gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp__0[0]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gcc0.gc0.count[10]_i_1 
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(\gcc0.gc0.count[10]_i_2_n_0 ),
        .I3(Q[7]),
        .I4(Q[9]),
        .I5(p_12_out),
        .O(plusOp__0[10]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \gcc0.gc0.count[10]_i_2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\gcc0.gc0.count[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gcc0.gc0.count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gcc0.gc0.count[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gcc0.gc0.count[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gcc0.gc0.count[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(plusOp__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \gcc0.gc0.count[5]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(plusOp__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gcc0.gc0.count[6]_i_1 
       (.I0(\gcc0.gc0.count[10]_i_2_n_0 ),
        .I1(Q[6]),
        .O(plusOp__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gcc0.gc0.count[7]_i_1 
       (.I0(\gcc0.gc0.count[10]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(plusOp__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gcc0.gc0.count[8]_i_1 
       (.I0(Q[6]),
        .I1(\gcc0.gc0.count[10]_i_2_n_0 ),
        .I2(Q[7]),
        .I3(Q[8]),
        .O(plusOp__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gcc0.gc0.count[9]_i_1 
       (.I0(Q[7]),
        .I1(\gcc0.gc0.count[10]_i_2_n_0 ),
        .I2(Q[6]),
        .I3(Q[8]),
        .I4(Q[9]),
        .O(plusOp__0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[0] 
       (.C(clk),
        .CE(E),
        .D(Q[0]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [0]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[10] 
       (.C(clk),
        .CE(E),
        .D(p_12_out),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [10]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[1] 
       (.C(clk),
        .CE(E),
        .D(Q[1]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[2] 
       (.C(clk),
        .CE(E),
        .D(Q[2]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[3] 
       (.C(clk),
        .CE(E),
        .D(Q[3]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[4] 
       (.C(clk),
        .CE(E),
        .D(Q[4]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[5] 
       (.C(clk),
        .CE(E),
        .D(Q[5]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[6] 
       (.C(clk),
        .CE(E),
        .D(Q[6]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[7] 
       (.C(clk),
        .CE(E),
        .D(Q[7]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[8] 
       (.C(clk),
        .CE(E),
        .D(Q[8]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_d1_reg[9] 
       (.C(clk),
        .CE(E),
        .D(Q[9]),
        .Q(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [9]),
        .R(srst));
  FDSE #(
    .INIT(1'b1)) 
    \gcc0.gc0.count_reg[0] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[0]),
        .Q(Q[0]),
        .S(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[10] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[10]),
        .Q(p_12_out),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[1] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[1]),
        .Q(Q[1]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[2] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[2]),
        .Q(Q[2]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[3] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[3]),
        .Q(Q[3]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[4] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[4]),
        .Q(Q[4]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[5] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[5]),
        .Q(Q[5]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[6] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[6]),
        .Q(Q[6]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[7] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[7]),
        .Q(Q[7]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[8] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[8]),
        .Q(Q[8]),
        .R(srst));
  FDRE #(
    .INIT(1'b0)) 
    \gcc0.gc0.count_reg[9] 
       (.C(clk),
        .CE(E),
        .D(plusOp__0[9]),
        .Q(Q[9]),
        .R(srst));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[5].gms.ms_i_1 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [10]),
        .I1(\gc0.count_d1_reg[10] ),
        .O(v1_reg));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[5].gms.ms_i_1__0 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [10]),
        .I1(\gc0.count_reg[10] ),
        .O(ram_empty_i_reg));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[5].gms.ms_i_1__1 
       (.I0(p_12_out),
        .I1(\gc0.count_d1_reg[10] ),
        .O(v1_reg_0));
  LUT2 #(
    .INIT(4'h9)) 
    \gmux.gm[5].gms.ms_i_1__2 
       (.I0(\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram [10]),
        .I1(\gc0.count_d1_reg[10] ),
        .O(ram_empty_i_reg_0));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module fifo_uart_rx_wr_logic
   (out,
    full,
    \gcc0.gc0.count_reg[10] ,
    Q,
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,
    ram_empty_i_reg,
    ram_empty_i_reg_0,
    \gc0.count_d1_reg[8] ,
    \gc0.count_d1_reg[8]_0 ,
    srst,
    clk,
    wr_en,
    E,
    \gc0.count_d1_reg[10] ,
    \gc0.count_reg[10] );
  output out;
  output full;
  output [0:0]\gcc0.gc0.count_reg[10] ;
  output [9:0]Q;
  output [10:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  output [0:0]ram_empty_i_reg;
  output ram_empty_i_reg_0;
  input [4:0]\gc0.count_d1_reg[8] ;
  input [4:0]\gc0.count_d1_reg[8]_0 ;
  input srst;
  input clk;
  input wr_en;
  input [0:0]E;
  input [0:0]\gc0.count_d1_reg[10] ;
  input [0:0]\gc0.count_reg[10] ;

  wire [10:0]\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire [0:0]E;
  wire [9:0]Q;
  wire [5:5]\c0/v1_reg ;
  wire [5:5]\c1/v1_reg ;
  wire clk;
  wire full;
  wire [0:0]\gc0.count_d1_reg[10] ;
  wire [4:0]\gc0.count_d1_reg[8] ;
  wire [4:0]\gc0.count_d1_reg[8]_0 ;
  wire [0:0]\gc0.count_reg[10] ;
  wire [0:0]\gcc0.gc0.count_reg[10] ;
  wire out;
  wire [0:0]ram_empty_i_reg;
  wire ram_empty_i_reg_0;
  wire srst;
  wire wr_en;

  fifo_uart_rx_wr_status_flags_ss \gwss.wsts 
       (.E(E),
        .clk(clk),
        .full(full),
        .\gc0.count_d1_reg[8] (\gc0.count_d1_reg[8] ),
        .\gc0.count_d1_reg[8]_0 (\gc0.count_d1_reg[8]_0 ),
        .\gcc0.gc0.count_reg[10] (\gcc0.gc0.count_reg[10] ),
        .out(out),
        .srst(srst),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ),
        .wr_en(wr_en));
  fifo_uart_rx_wr_bin_cntr wpntr
       (.\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram (\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ),
        .E(\gcc0.gc0.count_reg[10] ),
        .Q(Q),
        .clk(clk),
        .\gc0.count_d1_reg[10] (\gc0.count_d1_reg[10] ),
        .\gc0.count_reg[10] (\gc0.count_reg[10] ),
        .ram_empty_i_reg(ram_empty_i_reg),
        .ram_empty_i_reg_0(ram_empty_i_reg_0),
        .srst(srst),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_ss" *) 
module fifo_uart_rx_wr_status_flags_ss
   (out,
    full,
    \gcc0.gc0.count_reg[10] ,
    \gc0.count_d1_reg[8] ,
    v1_reg,
    \gc0.count_d1_reg[8]_0 ,
    v1_reg_0,
    srst,
    clk,
    wr_en,
    E);
  output out;
  output full;
  output [0:0]\gcc0.gc0.count_reg[10] ;
  input [4:0]\gc0.count_d1_reg[8] ;
  input [0:0]v1_reg;
  input [4:0]\gc0.count_d1_reg[8]_0 ;
  input [0:0]v1_reg_0;
  input srst;
  input clk;
  input wr_en;
  input [0:0]E;

  wire [0:0]E;
  wire clk;
  wire comp0;
  wire [4:0]\gc0.count_d1_reg[8] ;
  wire [4:0]\gc0.count_d1_reg[8]_0 ;
  wire [0:0]\gcc0.gc0.count_reg[10] ;
  (* DONT_TOUCH *) wire ram_afull_fb;
  (* DONT_TOUCH *) wire ram_afull_i;
  wire ram_full_comb;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  (* DONT_TOUCH *) wire ram_full_i;
  wire srst;
  wire [0:0]v1_reg;
  wire [0:0]v1_reg_0;
  wire wr_en;

  assign full = ram_full_i;
  assign out = ram_full_fb_i;
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_i_1 
       (.I0(wr_en),
        .I1(ram_full_fb_i),
        .O(\gcc0.gc0.count_reg[10] ));
  fifo_uart_rx_compare c0
       (.comp0(comp0),
        .\gc0.count_d1_reg[8] (\gc0.count_d1_reg[8] ),
        .v1_reg(v1_reg));
  fifo_uart_rx_compare_0 c1
       (.E(E),
        .comp0(comp0),
        .\gc0.count_d1_reg[8] (\gc0.count_d1_reg[8]_0 ),
        .out(ram_full_fb_i),
        .ram_full_comb(ram_full_comb),
        .v1_reg_0(v1_reg_0),
        .wr_en(wr_en));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b0),
        .O(ram_afull_i));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b0),
        .O(ram_afull_fb));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_fb_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_full_comb),
        .Q(ram_full_fb_i),
        .R(srst));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDRE #(
    .INIT(1'b0)) 
    ram_full_i_reg
       (.C(clk),
        .CE(1'b1),
        .D(ram_full_comb),
        .Q(ram_full_i),
        .R(srst));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
