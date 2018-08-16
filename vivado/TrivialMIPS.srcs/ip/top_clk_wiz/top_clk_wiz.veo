
// 
// (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// _out_10M____10.000______0.000______50.0______265.122____154.678
// _out_30M____30.000______0.000______50.0______188.561____154.678
// _out_60M____60.000______0.000______50.0______156.415____154.678
// out_60M_shift____60.000____-45.000______50.0______156.415____154.678
// _out_40M____40.000______0.000______50.0______173.646____154.678
// _out_80M____80.000______0.000______50.0______146.190____154.678
// out_80M_shift____80.000____-45.000______50.0______146.190____154.678
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary__________50.000____________0.010

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG

  top_clk_wiz instance_name
   (
    // Clock out ports
    .out_10M(out_10M),     // output out_10M
    .out_30M(out_30M),     // output out_30M
    .out_60M(out_60M),     // output out_60M
    .out_60M_shift(out_60M_shift),     // output out_60M_shift
    .out_40M(out_40M),     // output out_40M
    .out_80M(out_80M),     // output out_80M
    .out_80M_shift(out_80M_shift),     // output out_80M_shift
    // Status and control signals
    .reset(reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in1));      // input clk_in1
// INST_TAG_END ------ End INSTANTIATION Template ---------
