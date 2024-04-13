// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1.1 (win64) Build 3900603 Fri Jun 16 19:31:24 MDT 2023
// Date        : Mon Aug 21 01:06:39 2023
// Host        : DESKTOP-7P0D6RH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_mdm_1_0/Block_Design_mdm_1_0_stub.v
// Design      : Block_Design_mdm_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "MDM,Vivado 2023.1.1" *)
module Block_Design_mdm_1_0(Debug_SYS_Rst, Dbg_Clk_0, Dbg_TDI_0, Dbg_TDO_0, 
  Dbg_Reg_En_0, Dbg_Capture_0, Dbg_Shift_0, Dbg_Update_0, Dbg_Rst_0, Dbg_Disable_0)
/* synthesis syn_black_box black_box_pad_pin="Debug_SYS_Rst,Dbg_TDI_0,Dbg_TDO_0,Dbg_Reg_En_0[0:7],Dbg_Capture_0,Dbg_Shift_0,Dbg_Rst_0,Dbg_Disable_0" */
/* synthesis syn_force_seq_prim="Dbg_Clk_0" */
/* synthesis syn_force_seq_prim="Dbg_Update_0" */;
  output Debug_SYS_Rst;
  output Dbg_Clk_0 /* synthesis syn_isclock = 1 */;
  output Dbg_TDI_0;
  input Dbg_TDO_0;
  output [0:7]Dbg_Reg_En_0;
  output Dbg_Capture_0;
  output Dbg_Shift_0;
  output Dbg_Update_0 /* synthesis syn_isclock = 1 */;
  output Dbg_Rst_0;
  output Dbg_Disable_0;
endmodule
