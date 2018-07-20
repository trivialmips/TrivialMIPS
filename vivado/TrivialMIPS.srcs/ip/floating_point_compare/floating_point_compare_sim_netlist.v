// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Fri Jul 20 07:10:34 2018
// Host        : miskcoo running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top floating_point_compare -prefix
//               floating_point_compare_ floating_point_compare_sim_netlist.v
// Design      : floating_point_compare
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg676-2L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "floating_point_compare,floating_point_v7_1_6,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "floating_point_v7_1_6,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module floating_point_compare
   (s_axis_a_tvalid,
    s_axis_a_tdata,
    s_axis_b_tvalid,
    s_axis_b_tdata,
    m_axis_result_tvalid,
    m_axis_result_tdata,
    m_axis_result_tuser);
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_A, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) input s_axis_a_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_A TDATA" *) input [31:0]s_axis_a_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_B TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_B, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) input s_axis_b_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_B TDATA" *) input [31:0]s_axis_b_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_RESULT, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef" *) output m_axis_result_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TDATA" *) output [7:0]m_axis_result_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_RESULT TUSER" *) output [0:0]m_axis_result_tuser;

  wire \<const0> ;
  wire [3:0]\^m_axis_result_tdata ;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tvalid;
  wire [31:0]s_axis_b_tdata;
  wire s_axis_b_tvalid;
  wire NLW_U0_m_axis_result_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_a_tready_UNCONNECTED;
  wire NLW_U0_s_axis_b_tready_UNCONNECTED;
  wire NLW_U0_s_axis_c_tready_UNCONNECTED;
  wire NLW_U0_s_axis_operation_tready_UNCONNECTED;
  wire [7:4]NLW_U0_m_axis_result_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_result_tuser_UNCONNECTED;

  assign m_axis_result_tdata[7] = \<const0> ;
  assign m_axis_result_tdata[6] = \<const0> ;
  assign m_axis_result_tdata[5] = \<const0> ;
  assign m_axis_result_tdata[4] = \<const0> ;
  assign m_axis_result_tdata[3:0] = \^m_axis_result_tdata [3:0];
  assign m_axis_result_tuser[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ACCUM_INPUT_MSB = "32" *) 
  (* C_ACCUM_LSB = "-31" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "7" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "0" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "1" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "0" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "1" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "0" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "1" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "0" *) 
  (* C_RESULT_TDATA_WIDTH = "8" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "4" *) 
  (* C_THROTTLE_SCHEME = "3" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  floating_point_compare_floating_point_v7_1_6 U0
       (.aclk(1'b0),
        .aclken(1'b1),
        .aresetn(1'b1),
        .m_axis_result_tdata({NLW_U0_m_axis_result_tdata_UNCONNECTED[7:4],\^m_axis_result_tdata }),
        .m_axis_result_tlast(NLW_U0_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(1'b0),
        .m_axis_result_tuser(NLW_U0_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(NLW_U0_s_axis_a_tready_UNCONNECTED),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata(s_axis_b_tdata),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_U0_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_U0_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_U0_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(1'b0));
endmodule

(* C_ACCUM_INPUT_MSB = "32" *) (* C_ACCUM_LSB = "-31" *) (* C_ACCUM_MSB = "32" *) 
(* C_A_FRACTION_WIDTH = "24" *) (* C_A_TDATA_WIDTH = "32" *) (* C_A_TUSER_WIDTH = "1" *) 
(* C_A_WIDTH = "32" *) (* C_BRAM_USAGE = "0" *) (* C_B_FRACTION_WIDTH = "24" *) 
(* C_B_TDATA_WIDTH = "32" *) (* C_B_TUSER_WIDTH = "1" *) (* C_B_WIDTH = "32" *) 
(* C_COMPARE_OPERATION = "7" *) (* C_C_FRACTION_WIDTH = "24" *) (* C_C_TDATA_WIDTH = "32" *) 
(* C_C_TUSER_WIDTH = "1" *) (* C_C_WIDTH = "32" *) (* C_FIXED_DATA_UNSIGNED = "0" *) 
(* C_HAS_ABSOLUTE = "0" *) (* C_HAS_ACCUMULATOR_A = "0" *) (* C_HAS_ACCUMULATOR_S = "0" *) 
(* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) (* C_HAS_ACCUM_OVERFLOW = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ADD = "0" *) (* C_HAS_ARESETN = "0" *) (* C_HAS_A_TLAST = "0" *) 
(* C_HAS_A_TUSER = "0" *) (* C_HAS_B = "1" *) (* C_HAS_B_TLAST = "0" *) 
(* C_HAS_B_TUSER = "0" *) (* C_HAS_C = "0" *) (* C_HAS_COMPARE = "1" *) 
(* C_HAS_C_TLAST = "0" *) (* C_HAS_C_TUSER = "0" *) (* C_HAS_DIVIDE = "0" *) 
(* C_HAS_DIVIDE_BY_ZERO = "0" *) (* C_HAS_EXPONENTIAL = "0" *) (* C_HAS_FIX_TO_FLT = "0" *) 
(* C_HAS_FLT_TO_FIX = "0" *) (* C_HAS_FLT_TO_FLT = "0" *) (* C_HAS_FMA = "0" *) 
(* C_HAS_FMS = "0" *) (* C_HAS_INVALID_OP = "1" *) (* C_HAS_LOGARITHM = "0" *) 
(* C_HAS_MULTIPLY = "0" *) (* C_HAS_OPERATION = "0" *) (* C_HAS_OPERATION_TLAST = "0" *) 
(* C_HAS_OPERATION_TUSER = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_RECIP = "0" *) 
(* C_HAS_RECIP_SQRT = "0" *) (* C_HAS_RESULT_TLAST = "0" *) (* C_HAS_RESULT_TUSER = "1" *) 
(* C_HAS_SQRT = "0" *) (* C_HAS_SUBTRACT = "0" *) (* C_HAS_UNDERFLOW = "0" *) 
(* C_LATENCY = "0" *) (* C_MULT_USAGE = "0" *) (* C_OPERATION_TDATA_WIDTH = "8" *) 
(* C_OPERATION_TUSER_WIDTH = "1" *) (* C_OPTIMIZATION = "1" *) (* C_RATE = "1" *) 
(* C_RESULT_FRACTION_WIDTH = "0" *) (* C_RESULT_TDATA_WIDTH = "8" *) (* C_RESULT_TUSER_WIDTH = "1" *) 
(* C_RESULT_WIDTH = "4" *) (* C_THROTTLE_SCHEME = "3" *) (* C_TLAST_RESOLUTION = "0" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module floating_point_compare_floating_point_v7_1_6
   (aclk,
    aclken,
    aresetn,
    s_axis_a_tvalid,
    s_axis_a_tready,
    s_axis_a_tdata,
    s_axis_a_tuser,
    s_axis_a_tlast,
    s_axis_b_tvalid,
    s_axis_b_tready,
    s_axis_b_tdata,
    s_axis_b_tuser,
    s_axis_b_tlast,
    s_axis_c_tvalid,
    s_axis_c_tready,
    s_axis_c_tdata,
    s_axis_c_tuser,
    s_axis_c_tlast,
    s_axis_operation_tvalid,
    s_axis_operation_tready,
    s_axis_operation_tdata,
    s_axis_operation_tuser,
    s_axis_operation_tlast,
    m_axis_result_tvalid,
    m_axis_result_tready,
    m_axis_result_tdata,
    m_axis_result_tuser,
    m_axis_result_tlast);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_a_tvalid;
  output s_axis_a_tready;
  input [31:0]s_axis_a_tdata;
  input [0:0]s_axis_a_tuser;
  input s_axis_a_tlast;
  input s_axis_b_tvalid;
  output s_axis_b_tready;
  input [31:0]s_axis_b_tdata;
  input [0:0]s_axis_b_tuser;
  input s_axis_b_tlast;
  input s_axis_c_tvalid;
  output s_axis_c_tready;
  input [31:0]s_axis_c_tdata;
  input [0:0]s_axis_c_tuser;
  input s_axis_c_tlast;
  input s_axis_operation_tvalid;
  output s_axis_operation_tready;
  input [7:0]s_axis_operation_tdata;
  input [0:0]s_axis_operation_tuser;
  input s_axis_operation_tlast;
  output m_axis_result_tvalid;
  input m_axis_result_tready;
  output [7:0]m_axis_result_tdata;
  output [0:0]m_axis_result_tuser;
  output m_axis_result_tlast;

  wire \<const0> ;
  wire [3:0]\^m_axis_result_tdata ;
  wire m_axis_result_tvalid;
  wire [31:0]s_axis_a_tdata;
  wire s_axis_a_tvalid;
  wire [31:0]s_axis_b_tdata;
  wire s_axis_b_tvalid;
  wire NLW_i_synth_m_axis_result_tlast_UNCONNECTED;
  wire NLW_i_synth_s_axis_a_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_b_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_c_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_operation_tready_UNCONNECTED;
  wire [7:4]NLW_i_synth_m_axis_result_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_result_tuser_UNCONNECTED;

  assign m_axis_result_tdata[7] = \<const0> ;
  assign m_axis_result_tdata[6] = \<const0> ;
  assign m_axis_result_tdata[5] = \<const0> ;
  assign m_axis_result_tdata[4] = \<const0> ;
  assign m_axis_result_tdata[3:0] = \^m_axis_result_tdata [3:0];
  assign m_axis_result_tlast = \<const0> ;
  assign m_axis_result_tuser[0] = \<const0> ;
  assign s_axis_a_tready = \<const0> ;
  assign s_axis_b_tready = \<const0> ;
  assign s_axis_c_tready = \<const0> ;
  assign s_axis_operation_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ACCUM_INPUT_MSB = "32" *) 
  (* C_ACCUM_LSB = "-31" *) 
  (* C_ACCUM_MSB = "32" *) 
  (* C_A_FRACTION_WIDTH = "24" *) 
  (* C_A_TDATA_WIDTH = "32" *) 
  (* C_A_TUSER_WIDTH = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BRAM_USAGE = "0" *) 
  (* C_B_FRACTION_WIDTH = "24" *) 
  (* C_B_TDATA_WIDTH = "32" *) 
  (* C_B_TUSER_WIDTH = "1" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_COMPARE_OPERATION = "7" *) 
  (* C_C_FRACTION_WIDTH = "24" *) 
  (* C_C_TDATA_WIDTH = "32" *) 
  (* C_C_TUSER_WIDTH = "1" *) 
  (* C_C_WIDTH = "32" *) 
  (* C_FIXED_DATA_UNSIGNED = "0" *) 
  (* C_HAS_ABSOLUTE = "0" *) 
  (* C_HAS_ACCUMULATOR_A = "0" *) 
  (* C_HAS_ACCUMULATOR_S = "0" *) 
  (* C_HAS_ACCUM_INPUT_OVERFLOW = "0" *) 
  (* C_HAS_ACCUM_OVERFLOW = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ADD = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_A_TLAST = "0" *) 
  (* C_HAS_A_TUSER = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_B_TLAST = "0" *) 
  (* C_HAS_B_TUSER = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_COMPARE = "1" *) 
  (* C_HAS_C_TLAST = "0" *) 
  (* C_HAS_C_TUSER = "0" *) 
  (* C_HAS_DIVIDE = "0" *) 
  (* C_HAS_DIVIDE_BY_ZERO = "0" *) 
  (* C_HAS_EXPONENTIAL = "0" *) 
  (* C_HAS_FIX_TO_FLT = "0" *) 
  (* C_HAS_FLT_TO_FIX = "0" *) 
  (* C_HAS_FLT_TO_FLT = "0" *) 
  (* C_HAS_FMA = "0" *) 
  (* C_HAS_FMS = "0" *) 
  (* C_HAS_INVALID_OP = "1" *) 
  (* C_HAS_LOGARITHM = "0" *) 
  (* C_HAS_MULTIPLY = "0" *) 
  (* C_HAS_OPERATION = "0" *) 
  (* C_HAS_OPERATION_TLAST = "0" *) 
  (* C_HAS_OPERATION_TUSER = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RECIP = "0" *) 
  (* C_HAS_RECIP_SQRT = "0" *) 
  (* C_HAS_RESULT_TLAST = "0" *) 
  (* C_HAS_RESULT_TUSER = "1" *) 
  (* C_HAS_SQRT = "0" *) 
  (* C_HAS_SUBTRACT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_MULT_USAGE = "0" *) 
  (* C_OPERATION_TDATA_WIDTH = "8" *) 
  (* C_OPERATION_TUSER_WIDTH = "1" *) 
  (* C_OPTIMIZATION = "1" *) 
  (* C_RATE = "1" *) 
  (* C_RESULT_FRACTION_WIDTH = "0" *) 
  (* C_RESULT_TDATA_WIDTH = "8" *) 
  (* C_RESULT_TUSER_WIDTH = "1" *) 
  (* C_RESULT_WIDTH = "4" *) 
  (* C_THROTTLE_SCHEME = "3" *) 
  (* C_TLAST_RESOLUTION = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  floating_point_compare_floating_point_v7_1_6_viv i_synth
       (.aclk(1'b0),
        .aclken(1'b0),
        .aresetn(1'b0),
        .m_axis_result_tdata({NLW_i_synth_m_axis_result_tdata_UNCONNECTED[7:4],\^m_axis_result_tdata }),
        .m_axis_result_tlast(NLW_i_synth_m_axis_result_tlast_UNCONNECTED),
        .m_axis_result_tready(1'b0),
        .m_axis_result_tuser(NLW_i_synth_m_axis_result_tuser_UNCONNECTED[0]),
        .m_axis_result_tvalid(m_axis_result_tvalid),
        .s_axis_a_tdata(s_axis_a_tdata),
        .s_axis_a_tlast(1'b0),
        .s_axis_a_tready(NLW_i_synth_s_axis_a_tready_UNCONNECTED),
        .s_axis_a_tuser(1'b0),
        .s_axis_a_tvalid(s_axis_a_tvalid),
        .s_axis_b_tdata(s_axis_b_tdata),
        .s_axis_b_tlast(1'b0),
        .s_axis_b_tready(NLW_i_synth_s_axis_b_tready_UNCONNECTED),
        .s_axis_b_tuser(1'b0),
        .s_axis_b_tvalid(s_axis_b_tvalid),
        .s_axis_c_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c_tlast(1'b0),
        .s_axis_c_tready(NLW_i_synth_s_axis_c_tready_UNCONNECTED),
        .s_axis_c_tuser(1'b0),
        .s_axis_c_tvalid(1'b0),
        .s_axis_operation_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_operation_tlast(1'b0),
        .s_axis_operation_tready(NLW_i_synth_s_axis_operation_tready_UNCONNECTED),
        .s_axis_operation_tuser(1'b0),
        .s_axis_operation_tvalid(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
WHF/kh9y9tT9sDHC8k0aIWpXtVxJpejnegadXiKDxzj1ZpZscTsFrNjJ3M2zdT6N8lRlLaEbU3Ir
sd6JWi12RQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
eRkNROo42V2K5E4JfYF62/p/6QFaEKQZsl2HYmf+HyzbjxnwfIhaOZMS7w5z1FmrEhGTPEQXOTwS
fUJyNviKRjzk30qdr0Yew33y991KShPixxUP/KFCmilOWclSfzC2mMZi5A6s7TEXM2B367nOSwku
KbCuJUSPzJJiaRAEpHw=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GhwF2G4GbuqIHxWUWgBx0yPwdmNZ0sLyQJTMH4bwYKTbELScCA6EQkrJ4LapY1SKMdidLy0df9Pj
CeHsgFntAIlj8KuHN6h9HPYEotyX/9Te6p2a8H+tpR6etf9y3xzaH6/qz7e2E3W2wL9LuPh3z8Kn
5T+250hGoB5SSDPb7R05Zo+kHWjV9XC3aRiW9eiKTO0sAnFP/Xf8UWiiU0mvm6CTueEPy8/AnvMV
dPcmGyX5GGCUh3IBfT901OoOtkZpVw2dWvcYBoo1tSBuu3xGcTdaBuVS71QLrMbcvo6xCJ99jpPE
3H7PKS09CeMNVi10e/zBs++GDmsaS5rxE+w5Gg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
I91fAAhC09jTkrCVQQKnv0Drtx83idNynnaPdxzs4zKqz4snQtRWtaDP7qrMK+YX6HCjez12kPAx
yLp1XP7K1JI7GUxNhPr9dSmesuLlDqqX4QEdfnAmMyUmPVQWSSZ9iXhWNXE8XPBp1o7UtDG4SdOU
oLd+7leUR5ZahFSn01YF9tvyutpIdfHwAgTGHPyUKLyaVJJMheLAmg20JLv466nUEdDWX+9zR4st
NNyxbvPltgG4KByKfkbPEF55b+do5GgM1IruezGAg5Cht50nLVJovpCF+1QjXvzP3gWi8MXzxNTn
+LUk001USmyrukzhKUHtZ2Lx3ypo8praZ9iT/w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sdKBEhuD8P/HOZq5y6ViCxtvmfIs4OA3Fl9CcnL0gANdgkf/OMqz3GzME7Eykqeko1lzgWyz2a3N
1Kva5z4REP7xz3uPmHgCnQX7egSGFgBmV3wpxg1cd5eGmXf49vvA5iC5z0D34PNKpnze05e3kqB/
n3qL2S8inYBeWrMhHwr4Gd/rqA8sF/sa+jeyQ9m6XCotd1PCak14zkr94tS+KSqEGIuGxen3TYAk
bpGCwyYOxM/SHSiRCrLpe44V1yYGZjLID9Krg+DskkGTabtrO6qcMeC3kfu64S/g9jhDxbECZV+1
zn/FdC+r0anpk/BAKoY8FYWgWh8U8LiOcG0xFA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JByDpNd2N6MI6uzyvl2J3XP025cmH51m7bQhUMWOW17sbD6UUiaRaTSkW8vK0PlFR5J0KybIC67n
htWLpYKc7g3a6pq48qNnOGcwq5e7OGpXvLhZg820KWc4yZJJcW4UA8EpmFevvWP+jKXU6YlDKhzQ
vjSGtMaWFZ6XSBQtS2Y=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bWwaaT9gdiVlK1xRvfTjbBxGsGfnsafgkdPhmGoxAHpjXWhtxHhS+yoTrjdRxE9mWI/4GOvH9xc0
hIYqovqMOknaZe86xRCTn3EYQaKzqfT1A1mnmMZ3JbRYTeMtRQ7NncbCX9fNIQfEzfdDYYq+xInE
8vF7Alg0BGr4hPHj34Pe7VlNMxPGGOsKrEorFLdjAzbNkRmVryjwI0fdzyouOybBBue3gOx14GhD
FhfS4G8ynr1TOUHIGLjJ1kwyRSv73bET09nHcarBXJYE9P8AArk5MrbA3bYF0J6OZyEKixw+tSye
VZ5zN7wE8OdMoUedJ0t3fw/KWmQ8pgzPh2WxiA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q6/9gsk8AifgfKUwRF6UYf5PonB3h5/cLNco8BuGDviymg57h8Xg+qJF0g4e4QJBUwYKomNmYts2
Zk0fvh8lV2mYE41vZcjgIygx6yIr8tVy4q0c8633tQO/qaBtwRZfON3NNU/UaYj+oUaaEYxM4dlk
2qQhj7p6hwDP7s6wwQzjSd3XWCzGF2pCL6lRu86F+0Ips1NL6/N0AqKns7cLa4pTEkEiaxQaYnHK
A/aMs9Uu1RpJMcgLZV6HxgjpGpyS1Evq6ms6mttLGp9q4oqn5oopL9WrGxtsH+3ihjd213Jlixkn
Bkx5272LQJVFK2YKUa8PP11cne7Aj1T7mrVH9A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
sITtbqC95nHSAOPQ4JQtZ6sWO15zCqzMq8s8+qct63UfDVKOuPBVoUCTO8WsyG/M0ty6s0/du3Ku
De/hpy4qxskPsFukFqiUcwsxV3zIvbwHcTo9MsKgOBZEDVQdyE1sWLcsCYipTzvfO95OyzQNdBcn
o5l3kkHyEa40RY60d+EhsTMotgynic3sN+AlN5YAu3gCLHo/EnuTZXK3WgssuwopLtoNJqkoWv3o
CHAnb9cb27VXxc46zJCP+BwLkORhdzkiwtL8yWKEkTyeBquxll6bMJKR6YGpv8k0vOc4RAOMiK7O
SXZ2FwONm22oja2quRJOhTI9EpY6IQDN+KQZaQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 43296)
`pragma protect data_block
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
/S3vB10e1DXfCVg=
`pragma protect end_protected
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
