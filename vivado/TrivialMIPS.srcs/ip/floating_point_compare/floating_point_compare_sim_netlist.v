// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Fri Jul 20 02:30:49 2018
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
ZVFXU7Z/ZCz696QdUV++ig7h5c8Q91F75poGlaFNJfRQjiHN4yJOiZAh+ZLFz+6cUAVJyd3SeybI
VNUXNGGjZh5cb7qJdw9FmlQZoQ15Za/LRwA8ewC+dageFVaIRTpVydJFcZEXLtiJJmp184KajB3z
VEvsEz0rUsFSu5OY9W2wmFlT5GPgyEl5bGwLNhlLpXNBangC0ueSA3rg4GX4Yve6EJjuIZD4RQ/k
lGJDv0nxLokMUZ1GwDZTlMfD2kVAatjVoZ3EUWBMSiLVP5ymLS3I919tRCa5AvgroDyIXbHOooz5
MrgWfcIXh5TJdXzb74oWfwuerPEL0aS6aYYF1A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Rl7qyPDsSKYO4cYQAmYm509fQC3lRBYfdPbheBZYD/xQH88656hif7UjFw0jkmvtlge49GVEteDp
29JCmgNISdl9ybDjWoNADIj46+TJjR51EwYrPby5tgTFyWP8btMfTX4+9xbKKfF0+00zLMh4obrj
k5RsHmFubFGcKfquzJr52/LwaTJ1MwgiJ7B12Q4GhERRgOvhQUizBMf3YHUYMDKfj0AxHkC/yJjy
nmhtfgsr//9Up3y1z2fak74NhBwGB7xAVXZ5tu2Hy8DlYeHpJEFG4G0U4JsdVHIkknhR3PbINRlp
80j+PbBixGHNV+1iTaXgoadVrUNZ8q74Pk4cvQ==

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
