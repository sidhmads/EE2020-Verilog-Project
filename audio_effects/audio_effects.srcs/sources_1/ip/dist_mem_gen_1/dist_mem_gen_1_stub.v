// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Nov 01 14:34:35 2017
// Host        : LAPTOP-VOM5DAG2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/Siddharth/NUS/Modules/Y2S1/EE2020/EE2020
//               Project_Main/audio_effects/audio_effects.srcs/sources_1/ip/dist_mem_gen_1/dist_mem_gen_1_stub.v}
// Design      : dist_mem_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_10,Vivado 2016.2" *)
module dist_mem_gen_1(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[15:0],spo[11:0]" */;
  input [15:0]a;
  output [11:0]spo;
endmodule
