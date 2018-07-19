// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Fri Jul 20 07:10:36 2018
// Host        : miskcoo running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim
//               /home/miskcoo/WorkPlace/TrivialMIPS/vivado/TrivialMIPS.srcs/ip/floating_point_compare/floating_point_compare_sim_netlist.v
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
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "floating_point_v7_1_6" *) (* downgradeipidentifiedwarnings = "yes" *) 
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
TFnppLh284gwfSXKrAA+NWcxpV/zKccvuOQckZ+SHs4aVK20Uo3u9jP4Hn0FAevPhA534ZK7071j
6F1F0OcLGJFgj42dCppLQFeyXpiHTT/NXntGMM5Ek8YeEivZu+HEbiXDutfueOlCFGdxnOOg8I1X
03RChVB53mItYs4kTx3sEkocLJI+AOEfODp6DcSpaCsg7rFALNELvuiZTje0oa8KDv96S/JQTeuK
KavLO9JtY5gxqnaHFv122rBJPol0yeKXD6pYllhtua5RH9VsZC89X2CvZTYpwlPkgwk8c4uXh9tE
bZZeCtJ5TNskf0kJOBgW2EOeRWKvtz6GOs4EhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gOfGATVd+SN4xzilZdahm/HQL4bZ/iHxK3tlWXxypuVddWOFlvLnGQkrs5DC4vUME5wWfOZXt0Uk
y6vOrcS1sCG7yuD1KYL9RdZ79000MgstnX8jh5wwJSMkEUnulkrcEde7/vlTXZ0wq2sGvWjTmhJq
9nzIuxGKTPX5bOqaaH5ie/gKoN4bwW7qESAJygPLmsquP7U4mW8HJyhQDR1iD7LCU24JpkX0ixiL
BIfnexpomMTnJanEW9yjZ4910HIP/h6gKxaN7OXxzw6WyreIo4zEKbBZ8FT6x1uyTgZQ2gYBWi6b
+YwP4zdJIB9kr80sFqBvXvJHJryQ7Ey7eb7mPA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 42976)
`pragma protect data_block
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
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
