////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: SkinnyTop_synthesis.v
// /___/   /\     Timestamp: Thu Oct 27 17:24:02 2022
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -fn -insert_glbl false -w -dir netgen/synthesis -ofmt verilog -sim Midori64.ngc SkinnyTop_synthesis.v 
// Device	: xc7k160t-1-fbg676
// Input file	: Midori64.ngc
// Output file	: E:\Amir\AGEMA\GHPC_FPGA\MakeNetlist\4.1-Midori\work\netgen\synthesis\SkinnyTop_synthesis.v
// # of Modules	: 1
// Design Name	: Midori64
// Xilinx        : F:\XILINX\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module Midori64 (
  clk, reset, enc_dec, done, input_0, key, output_1
);

  (* AGEMA = "clock" *)     input clk;
  (* AGEMA = "reset" *)     input reset;
  (* AGEMA = "constant" *)  input enc_dec;
  (* AGEMA = "secure" *)    input [63 : 0] input_0;
  (* AGEMA = "secure" *)    input [127: 0] key;

  output done;
  output [63 : 0] output_1;

  wire input_63_IBUF_0;
  wire input_62_IBUF_1;
  wire input_61_IBUF_2;
  wire input_60_IBUF_3;
  wire input_59_IBUF_4;
  wire input_58_IBUF_5;
  wire input_57_IBUF_6;
  wire input_56_IBUF_7;
  wire input_55_IBUF_8;
  wire input_54_IBUF_9;
  wire input_53_IBUF_10;
  wire input_52_IBUF_11;
  wire input_51_IBUF_12;
  wire input_50_IBUF_13;
  wire input_49_IBUF_14;
  wire input_48_IBUF_15;
  wire input_47_IBUF_16;
  wire input_46_IBUF_17;
  wire input_45_IBUF_18;
  wire input_44_IBUF_19;
  wire input_43_IBUF_20;
  wire input_42_IBUF_21;
  wire input_41_IBUF_22;
  wire input_40_IBUF_23;
  wire input_39_IBUF_24;
  wire input_38_IBUF_25;
  wire input_37_IBUF_26;
  wire input_36_IBUF_27;
  wire input_35_IBUF_28;
  wire input_34_IBUF_29;
  wire input_33_IBUF_30;
  wire input_32_IBUF_31;
  wire input_31_IBUF_32;
  wire input_30_IBUF_33;
  wire input_29_IBUF_34;
  wire input_28_IBUF_35;
  wire input_27_IBUF_36;
  wire input_26_IBUF_37;
  wire input_25_IBUF_38;
  wire input_24_IBUF_39;
  wire input_23_IBUF_40;
  wire input_22_IBUF_41;
  wire input_21_IBUF_42;
  wire input_20_IBUF_43;
  wire input_19_IBUF_44;
  wire input_18_IBUF_45;
  wire input_17_IBUF_46;
  wire input_16_IBUF_47;
  wire input_15_IBUF_48;
  wire input_14_IBUF_49;
  wire input_13_IBUF_50;
  wire input_12_IBUF_51;
  wire input_11_IBUF_52;
  wire input_10_IBUF_53;
  wire input_9_IBUF_54;
  wire input_8_IBUF_55;
  wire input_7_IBUF_56;
  wire input_6_IBUF_57;
  wire input_5_IBUF_58;
  wire input_4_IBUF_59;
  wire input_3_IBUF_60;
  wire input_2_IBUF_61;
  wire input_1_IBUF_62;
  wire input_0_IBUF_63;
  wire clk_BUFGP_64;
  wire reset_IBUF_65;
  wire enc_dec_IBUF_66;
  wire output_63_OBUF_67;
  wire output_62_OBUF_68;
  wire output_61_OBUF_69;
  wire output_60_OBUF_70;
  wire output_59_OBUF_71;
  wire output_58_OBUF_72;
  wire output_57_OBUF_73;
  wire output_56_OBUF_74;
  wire output_55_OBUF_75;
  wire output_54_OBUF_76;
  wire output_53_OBUF_77;
  wire output_52_OBUF_78;
  wire output_51_OBUF_79;
  wire output_50_OBUF_80;
  wire output_49_OBUF_81;
  wire output_48_OBUF_82;
  wire output_47_OBUF_83;
  wire output_46_OBUF_84;
  wire output_45_OBUF_85;
  wire output_44_OBUF_86;
  wire output_43_OBUF_87;
  wire output_42_OBUF_88;
  wire output_41_OBUF_89;
  wire output_40_OBUF_90;
  wire output_39_OBUF_91;
  wire output_38_OBUF_92;
  wire output_37_OBUF_93;
  wire output_36_OBUF_94;
  wire output_35_OBUF_95;
  wire output_34_OBUF_96;
  wire output_33_OBUF_97;
  wire output_32_OBUF_98;
  wire output_31_OBUF_99;
  wire output_30_OBUF_100;
  wire output_29_OBUF_101;
  wire output_28_OBUF_102;
  wire output_27_OBUF_103;
  wire output_26_OBUF_104;
  wire output_25_OBUF_105;
  wire output_24_OBUF_106;
  wire output_23_OBUF_107;
  wire output_22_OBUF_108;
  wire output_21_OBUF_109;
  wire output_20_OBUF_110;
  wire output_19_OBUF_111;
  wire output_18_OBUF_112;
  wire output_17_OBUF_113;
  wire output_16_OBUF_114;
  wire output_15_OBUF_115;
  wire output_14_OBUF_116;
  wire output_13_OBUF_117;
  wire output_12_OBUF_118;
  wire output_11_OBUF_119;
  wire output_10_OBUF_120;
  wire output_9_OBUF_121;
  wire output_8_OBUF_122;
  wire output_7_OBUF_123;
  wire output_6_OBUF_124;
  wire output_5_OBUF_125;
  wire output_4_OBUF_126;
  wire output_3_OBUF_127;
  wire output_2_OBUF_128;
  wire output_1_OBUF_129;
  wire output_0_OBUF_130;
  wire key_127_IBUF_131;
  wire key_126_IBUF_132;
  wire key_125_IBUF_133;
  wire key_124_IBUF_134;
  wire key_123_IBUF_135;
  wire key_122_IBUF_136;
  wire key_121_IBUF_137;
  wire key_120_IBUF_138;
  wire key_119_IBUF_139;
  wire key_118_IBUF_140;
  wire key_117_IBUF_141;
  wire key_116_IBUF_142;
  wire key_115_IBUF_143;
  wire key_114_IBUF_144;
  wire key_113_IBUF_145;
  wire key_112_IBUF_146;
  wire key_111_IBUF_147;
  wire key_110_IBUF_148;
  wire key_109_IBUF_149;
  wire key_108_IBUF_150;
  wire key_107_IBUF_151;
  wire key_106_IBUF_152;
  wire key_105_IBUF_153;
  wire key_104_IBUF_154;
  wire key_103_IBUF_155;
  wire key_102_IBUF_156;
  wire key_101_IBUF_157;
  wire key_100_IBUF_158;
  wire key_99_IBUF_159;
  wire key_98_IBUF_160;
  wire key_97_IBUF_161;
  wire key_96_IBUF_162;
  wire key_95_IBUF_163;
  wire key_94_IBUF_164;
  wire key_93_IBUF_165;
  wire key_92_IBUF_166;
  wire key_91_IBUF_167;
  wire key_90_IBUF_168;
  wire key_89_IBUF_169;
  wire key_88_IBUF_170;
  wire key_87_IBUF_171;
  wire key_86_IBUF_172;
  wire key_85_IBUF_173;
  wire key_84_IBUF_174;
  wire key_83_IBUF_175;
  wire key_82_IBUF_176;
  wire key_81_IBUF_177;
  wire key_80_IBUF_178;
  wire key_79_IBUF_179;
  wire key_78_IBUF_180;
  wire key_77_IBUF_181;
  wire key_76_IBUF_182;
  wire key_75_IBUF_183;
  wire key_74_IBUF_184;
  wire key_73_IBUF_185;
  wire key_72_IBUF_186;
  wire key_71_IBUF_187;
  wire key_70_IBUF_188;
  wire key_69_IBUF_189;
  wire key_68_IBUF_190;
  wire key_67_IBUF_191;
  wire key_66_IBUF_192;
  wire key_65_IBUF_193;
  wire key_64_IBUF_194;
  wire key_63_IBUF_195;
  wire key_62_IBUF_196;
  wire key_61_IBUF_197;
  wire key_60_IBUF_198;
  wire key_59_IBUF_199;
  wire key_58_IBUF_200;
  wire key_57_IBUF_201;
  wire key_56_IBUF_202;
  wire key_55_IBUF_203;
  wire key_54_IBUF_204;
  wire key_53_IBUF_205;
  wire key_52_IBUF_206;
  wire key_51_IBUF_207;
  wire key_50_IBUF_208;
  wire key_49_IBUF_209;
  wire key_48_IBUF_210;
  wire key_47_IBUF_211;
  wire key_46_IBUF_212;
  wire key_45_IBUF_213;
  wire key_44_IBUF_214;
  wire key_43_IBUF_215;
  wire key_42_IBUF_216;
  wire key_41_IBUF_217;
  wire key_40_IBUF_218;
  wire key_39_IBUF_219;
  wire key_38_IBUF_220;
  wire key_37_IBUF_221;
  wire key_36_IBUF_222;
  wire key_35_IBUF_223;
  wire key_34_IBUF_224;
  wire key_33_IBUF_225;
  wire key_32_IBUF_226;
  wire key_31_IBUF_227;
  wire key_30_IBUF_228;
  wire key_29_IBUF_229;
  wire key_28_IBUF_230;
  wire key_27_IBUF_231;
  wire key_26_IBUF_232;
  wire key_25_IBUF_233;
  wire key_24_IBUF_234;
  wire key_23_IBUF_235;
  wire key_22_IBUF_236;
  wire key_21_IBUF_237;
  wire key_20_IBUF_238;
  wire key_19_IBUF_239;
  wire key_18_IBUF_240;
  wire key_17_IBUF_241;
  wire key_16_IBUF_242;
  wire key_15_IBUF_243;
  wire key_14_IBUF_244;
  wire key_13_IBUF_245;
  wire key_12_IBUF_246;
  wire key_11_IBUF_247;
  wire key_10_IBUF_248;
  wire key_9_IBUF_249;
  wire key_8_IBUF_250;
  wire key_7_IBUF_251;
  wire key_6_IBUF_252;
  wire key_5_IBUF_253;
  wire key_4_IBUF_254;
  wire key_3_IBUF_255;
  wire key_2_IBUF_256;
  wire key_1_IBUF_257;
  wire key_0_IBUF_258;
  wire done_OBUF_259;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant15 ;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant11 ;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant8 ;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant7 ;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant6 ;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant5 ;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant3 ;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant2 ;
  wire \Midori/rounds/constant_MUX/Mram_roundConstant1 ;
  wire \Midori/rounds/ProcessedKey[0] ;
  wire \Midori/rounds/ProcessedKey[4] ;
  wire \Midori/rounds/ProcessedKey[8] ;
  wire \Midori/rounds/ProcessedKey[12] ;
  wire \Midori/rounds/ProcessedKey[16] ;
  wire \Midori/rounds/ProcessedKey[20] ;
  wire \Midori/rounds/ProcessedKey[24] ;
  wire \Midori/rounds/ProcessedKey[28] ;
  wire \Midori/rounds/ProcessedKey[32] ;
  wire \Midori/rounds/ProcessedKey[36] ;
  wire \Midori/rounds/ProcessedKey[40] ;
  wire \Midori/rounds/ProcessedKey[44] ;
  wire \Midori/rounds/ProcessedKey[48] ;
  wire \Midori/rounds/ProcessedKey[52] ;
  wire \Midori/rounds/ProcessedKey[56] ;
  wire \Midori/rounds/ProcessedKey[60] ;
  wire \Midori/rounds/SelectedKey[1] ;
  wire \Midori/rounds/SelectedKey[2] ;
  wire \Midori/rounds/SelectedKey[3] ;
  wire \Midori/rounds/SelectedKey[5] ;
  wire \Midori/rounds/SelectedKey[6] ;
  wire \Midori/rounds/SelectedKey[7] ;
  wire \Midori/rounds/SelectedKey[9] ;
  wire \Midori/rounds/SelectedKey[10] ;
  wire \Midori/rounds/SelectedKey[11] ;
  wire \Midori/rounds/SelectedKey[13] ;
  wire \Midori/rounds/SelectedKey[14] ;
  wire \Midori/rounds/SelectedKey[15] ;
  wire \Midori/rounds/SelectedKey[17] ;
  wire \Midori/rounds/SelectedKey[18] ;
  wire \Midori/rounds/SelectedKey[19] ;
  wire \Midori/rounds/SelectedKey[21] ;
  wire \Midori/rounds/SelectedKey[22] ;
  wire \Midori/rounds/SelectedKey[23] ;
  wire \Midori/rounds/SelectedKey[25] ;
  wire \Midori/rounds/SelectedKey[26] ;
  wire \Midori/rounds/SelectedKey[27] ;
  wire \Midori/rounds/SelectedKey[29] ;
  wire \Midori/rounds/SelectedKey[30] ;
  wire \Midori/rounds/SelectedKey[31] ;
  wire \Midori/rounds/SelectedKey[33] ;
  wire \Midori/rounds/SelectedKey[34] ;
  wire \Midori/rounds/SelectedKey[35] ;
  wire \Midori/rounds/SelectedKey[37] ;
  wire \Midori/rounds/SelectedKey[38] ;
  wire \Midori/rounds/SelectedKey[39] ;
  wire \Midori/rounds/SelectedKey[41] ;
  wire \Midori/rounds/SelectedKey[42] ;
  wire \Midori/rounds/SelectedKey[43] ;
  wire \Midori/rounds/SelectedKey[45] ;
  wire \Midori/rounds/SelectedKey[46] ;
  wire \Midori/rounds/SelectedKey[47] ;
  wire \Midori/rounds/SelectedKey[49] ;
  wire \Midori/rounds/SelectedKey[50] ;
  wire \Midori/rounds/SelectedKey[51] ;
  wire \Midori/rounds/SelectedKey[53] ;
  wire \Midori/rounds/SelectedKey[54] ;
  wire \Midori/rounds/SelectedKey[55] ;
  wire \Midori/rounds/SelectedKey[57] ;
  wire \Midori/rounds/SelectedKey[58] ;
  wire \Midori/rounds/SelectedKey[59] ;
  wire \Midori/rounds/SelectedKey[61] ;
  wire \Midori/rounds/SelectedKey[62] ;
  wire \Midori/rounds/SelectedKey[63] ;
  wire \Midori/rounds/roundResult_Reg/GEN[0].SFF/Q_663 ;
  wire \Midori/rounds/roundResult_Reg/GEN[1].SFF/Q_664 ;
  wire \Midori/rounds/roundResult_Reg/GEN[2].SFF/Q_665 ;
  wire \Midori/rounds/roundResult_Reg/GEN[3].SFF/Q_666 ;
  wire \Midori/rounds/roundResult_Reg/GEN[4].SFF/Q_667 ;
  wire \Midori/rounds/roundResult_Reg/GEN[5].SFF/Q_668 ;
  wire \Midori/rounds/roundResult_Reg/GEN[6].SFF/Q_669 ;
  wire \Midori/rounds/roundResult_Reg/GEN[7].SFF/Q_670 ;
  wire \Midori/rounds/roundResult_Reg/GEN[8].SFF/Q_671 ;
  wire \Midori/rounds/roundResult_Reg/GEN[9].SFF/Q_672 ;
  wire \Midori/rounds/roundResult_Reg/GEN[10].SFF/Q_673 ;
  wire \Midori/rounds/roundResult_Reg/GEN[11].SFF/Q_674 ;
  wire \Midori/rounds/roundResult_Reg/GEN[12].SFF/Q_675 ;
  wire \Midori/rounds/roundResult_Reg/GEN[13].SFF/Q_676 ;
  wire \Midori/rounds/roundResult_Reg/GEN[14].SFF/Q_677 ;
  wire \Midori/rounds/roundResult_Reg/GEN[15].SFF/Q_678 ;
  wire \Midori/rounds/roundResult_Reg/GEN[16].SFF/Q_679 ;
  wire \Midori/rounds/roundResult_Reg/GEN[17].SFF/Q_680 ;
  wire \Midori/rounds/roundResult_Reg/GEN[18].SFF/Q_681 ;
  wire \Midori/rounds/roundResult_Reg/GEN[19].SFF/Q_682 ;
  wire \Midori/rounds/roundResult_Reg/GEN[20].SFF/Q_683 ;
  wire \Midori/rounds/roundResult_Reg/GEN[21].SFF/Q_684 ;
  wire \Midori/rounds/roundResult_Reg/GEN[22].SFF/Q_685 ;
  wire \Midori/rounds/roundResult_Reg/GEN[23].SFF/Q_686 ;
  wire \Midori/rounds/roundResult_Reg/GEN[24].SFF/Q_687 ;
  wire \Midori/rounds/roundResult_Reg/GEN[25].SFF/Q_688 ;
  wire \Midori/rounds/roundResult_Reg/GEN[26].SFF/Q_689 ;
  wire \Midori/rounds/roundResult_Reg/GEN[27].SFF/Q_690 ;
  wire \Midori/rounds/roundResult_Reg/GEN[28].SFF/Q_691 ;
  wire \Midori/rounds/roundResult_Reg/GEN[29].SFF/Q_692 ;
  wire \Midori/rounds/roundResult_Reg/GEN[30].SFF/Q_693 ;
  wire \Midori/rounds/roundResult_Reg/GEN[31].SFF/Q_694 ;
  wire \Midori/rounds/roundResult_Reg/GEN[32].SFF/Q_695 ;
  wire \Midori/rounds/roundResult_Reg/GEN[33].SFF/Q_696 ;
  wire \Midori/rounds/roundResult_Reg/GEN[34].SFF/Q_697 ;
  wire \Midori/rounds/roundResult_Reg/GEN[35].SFF/Q_698 ;
  wire \Midori/rounds/roundResult_Reg/GEN[36].SFF/Q_699 ;
  wire \Midori/rounds/roundResult_Reg/GEN[37].SFF/Q_700 ;
  wire \Midori/rounds/roundResult_Reg/GEN[38].SFF/Q_701 ;
  wire \Midori/rounds/roundResult_Reg/GEN[39].SFF/Q_702 ;
  wire \Midori/rounds/roundResult_Reg/GEN[40].SFF/Q_703 ;
  wire \Midori/rounds/roundResult_Reg/GEN[41].SFF/Q_704 ;
  wire \Midori/rounds/roundResult_Reg/GEN[42].SFF/Q_705 ;
  wire \Midori/rounds/roundResult_Reg/GEN[43].SFF/Q_706 ;
  wire \Midori/rounds/roundResult_Reg/GEN[44].SFF/Q_707 ;
  wire \Midori/rounds/roundResult_Reg/GEN[45].SFF/Q_708 ;
  wire \Midori/rounds/roundResult_Reg/GEN[46].SFF/Q_709 ;
  wire \Midori/rounds/roundResult_Reg/GEN[47].SFF/Q_710 ;
  wire \Midori/rounds/roundResult_Reg/GEN[48].SFF/Q_711 ;
  wire \Midori/rounds/roundResult_Reg/GEN[49].SFF/Q_712 ;
  wire \Midori/rounds/roundResult_Reg/GEN[50].SFF/Q_713 ;
  wire \Midori/rounds/roundResult_Reg/GEN[51].SFF/Q_714 ;
  wire \Midori/rounds/roundResult_Reg/GEN[52].SFF/Q_715 ;
  wire \Midori/rounds/roundResult_Reg/GEN[53].SFF/Q_716 ;
  wire \Midori/rounds/roundResult_Reg/GEN[54].SFF/Q_717 ;
  wire \Midori/rounds/roundResult_Reg/GEN[55].SFF/Q_718 ;
  wire \Midori/rounds/roundResult_Reg/GEN[56].SFF/Q_719 ;
  wire \Midori/rounds/roundResult_Reg/GEN[57].SFF/Q_720 ;
  wire \Midori/rounds/roundResult_Reg/GEN[58].SFF/Q_721 ;
  wire \Midori/rounds/roundResult_Reg/GEN[59].SFF/Q_722 ;
  wire \Midori/rounds/roundResult_Reg/GEN[60].SFF/Q_723 ;
  wire \Midori/rounds/roundResult_Reg/GEN[61].SFF/Q_724 ;
  wire \Midori/rounds/roundResult_Reg/GEN[62].SFF/Q_725 ;
  wire \Midori/rounds/roundResult_Reg/GEN[63].SFF/Q_726 ;
  wire \Midori/rounds/roundResult_Reg/GEN[0].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[1].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[2].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[3].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[4].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[5].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[6].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[7].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[8].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[9].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[10].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[11].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[12].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[13].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[14].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[15].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[16].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[17].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[18].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[19].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[20].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[21].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[22].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[23].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[24].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[25].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[26].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[27].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[28].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[29].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[30].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[31].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[32].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[33].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[34].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[35].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[36].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[37].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[38].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[39].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[40].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[41].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[42].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[43].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[44].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[45].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[46].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[47].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[48].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[49].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[50].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[51].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[52].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[53].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[54].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[55].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[56].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[57].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[58].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[59].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[60].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[61].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[62].SFF/DQ ;
  wire \Midori/rounds/roundResult_Reg/GEN[63].SFF/DQ ;
  wire \Midori/rounds/Mxor_ProcessedKey<36>_xo<0> ;
  wire \Midori/rounds/Mxor_ProcessedKey<52>_xo<0> ;
  wire \Midori/rounds/Mxor_ProcessedKey<48>_xo<0> ;
  wire N9;
  wire N111;
  wire N13;
  wire N15;
  wire N17;
  wire N19;
  wire N21;
  wire N23;
  wire N25;
  wire N27;
  wire N29;
  wire N34;
  wire \controller/roundCounter/count_3_1_1066 ;
  wire \controller/roundCounter/count_2_1_1067 ;
  wire \controller/roundCounter/count_0_1_1068 ;
  wire \controller/roundCounter/count_1_1_1069 ;
  wire \controller/roundCounter/count_2_2_1070 ;
  wire \controller/roundCounter/count_3_2_1071 ;
  wire \controller/roundCounter/count_1_2_1072 ;
  wire N36;
  wire N37;
  wire N38;
  wire N39;
  wire N40;
  wire N41;
  wire [63 : 0] \Midori/add_Result_Start ;
  wire [63 : 0] \Midori/rounds_Output ;
  wire [3 : 0] Result;
  wire [3 : 0] \controller/roundCounter/count ;
  wire [63 : 0] \Midori/rounds/mul_Result ;
  wire [63 : 0] \Midori/rounds/mul_ResultXORkey ;
  wire [63 : 0] \Midori/rounds/mul_input ;

  FDR   \controller/roundCounter/count_0  (
    .C(clk_BUFGP_64),
    .D(Result[0]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count [0])
  );
  FDR   \controller/roundCounter/count_1  (
    .C(clk_BUFGP_64),
    .D(Result[1]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count [1])
  );
  FDR   \controller/roundCounter/count_2  (
    .C(clk_BUFGP_64),
    .D(Result[2]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count [2])
  );
  FDR   \controller/roundCounter/count_3  (
    .C(clk_BUFGP_64),
    .D(Result[3]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count [3])
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[0].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [0]),
    .I1(\Midori/rounds/mul_Result [48]),
    .I2(\Midori/add_Result_Start [0]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[0].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[1].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [1]),
    .I1(\Midori/rounds/mul_Result [49]),
    .I2(\Midori/add_Result_Start [1]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[1].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[2].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [2]),
    .I1(\Midori/rounds/mul_Result [50]),
    .I2(\Midori/add_Result_Start [2]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[2].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[3].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [3]),
    .I1(\Midori/rounds/mul_Result [51]),
    .I2(\Midori/add_Result_Start [3]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[3].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[4].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [4]),
    .I1(\Midori/rounds/mul_Result [44]),
    .I2(\Midori/add_Result_Start [4]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[4].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[5].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [5]),
    .I1(\Midori/rounds/mul_Result [45]),
    .I2(\Midori/add_Result_Start [5]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[5].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[6].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [6]),
    .I1(\Midori/rounds/mul_Result [46]),
    .I2(\Midori/add_Result_Start [6]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[6].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[7].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [7]),
    .I1(\Midori/rounds/mul_Result [47]),
    .I2(\Midori/add_Result_Start [7]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[7].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[8].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [8]),
    .I1(\Midori/rounds/mul_Result [8]),
    .I2(\Midori/add_Result_Start [8]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[8].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[9].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [9]),
    .I1(\Midori/rounds/mul_Result [9]),
    .I2(\Midori/add_Result_Start [9]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[9].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[10].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [10]),
    .I1(\Midori/rounds/mul_Result [10]),
    .I2(\Midori/add_Result_Start [10]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[10].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[11].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [11]),
    .I1(\Midori/rounds/mul_Result [11]),
    .I2(\Midori/add_Result_Start [11]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[11].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[12].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [12]),
    .I1(\Midori/rounds/mul_Result [20]),
    .I2(\Midori/add_Result_Start [12]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[12].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[13].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [13]),
    .I1(\Midori/rounds/mul_Result [21]),
    .I2(\Midori/add_Result_Start [13]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[13].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[14].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [14]),
    .I1(\Midori/rounds/mul_Result [22]),
    .I2(\Midori/add_Result_Start [14]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[14].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[15].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [15]),
    .I1(\Midori/rounds/mul_Result [23]),
    .I2(\Midori/add_Result_Start [15]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[15].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[16].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [16]),
    .I1(\Midori/rounds/mul_Result [36]),
    .I2(\Midori/add_Result_Start [16]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[16].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[17].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [17]),
    .I1(\Midori/rounds/mul_Result [37]),
    .I2(\Midori/add_Result_Start [17]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[17].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[18].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [18]),
    .I1(\Midori/rounds/mul_Result [38]),
    .I2(\Midori/add_Result_Start [18]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[18].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[19].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [19]),
    .I1(\Midori/rounds/mul_Result [39]),
    .I2(\Midori/add_Result_Start [19]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[19].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[20].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [20]),
    .I1(\Midori/rounds/mul_Result [56]),
    .I2(\Midori/add_Result_Start [20]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[20].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[21].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [21]),
    .I1(\Midori/rounds/mul_Result [57]),
    .I2(\Midori/add_Result_Start [21]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[21].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[22].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [22]),
    .I1(\Midori/rounds/mul_Result [58]),
    .I2(\Midori/add_Result_Start [22]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[22].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[23].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [23]),
    .I1(\Midori/rounds/mul_Result [59]),
    .I2(\Midori/add_Result_Start [23]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[23].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[24].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [24]),
    .I1(\Midori/rounds/mul_Result [28]),
    .I2(\Midori/add_Result_Start [24]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[24].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[25].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [25]),
    .I1(\Midori/rounds/mul_Result [29]),
    .I2(\Midori/add_Result_Start [25]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[25].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[26].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [26]),
    .I1(\Midori/rounds/mul_Result [30]),
    .I2(\Midori/add_Result_Start [26]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[26].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[27].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [27]),
    .I1(\Midori/rounds/mul_Result [31]),
    .I2(\Midori/add_Result_Start [27]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[27].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[28].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [28]),
    .I1(\Midori/rounds/mul_Result [0]),
    .I2(\Midori/add_Result_Start [28]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[28].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[29].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [29]),
    .I1(\Midori/rounds/mul_Result [1]),
    .I2(\Midori/add_Result_Start [29]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[29].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[30].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [30]),
    .I1(\Midori/rounds/mul_Result [2]),
    .I2(\Midori/add_Result_Start [30]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[30].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[31].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [31]),
    .I1(\Midori/rounds/mul_Result [3]),
    .I2(\Midori/add_Result_Start [31]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[31].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[32].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [32]),
    .I1(\Midori/rounds/mul_Result [12]),
    .I2(\Midori/add_Result_Start [32]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[32].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[33].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [33]),
    .I1(\Midori/rounds/mul_Result [13]),
    .I2(\Midori/add_Result_Start [33]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[33].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[34].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [34]),
    .I1(\Midori/rounds/mul_Result [14]),
    .I2(\Midori/add_Result_Start [34]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[34].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[35].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [35]),
    .I1(\Midori/rounds/mul_Result [15]),
    .I2(\Midori/add_Result_Start [35]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[35].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[36].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [36]),
    .I1(\Midori/rounds/mul_Result [16]),
    .I2(\Midori/add_Result_Start [36]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[36].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[37].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [37]),
    .I1(\Midori/rounds/mul_Result [17]),
    .I2(\Midori/add_Result_Start [37]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[37].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[38].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [38]),
    .I1(\Midori/rounds/mul_Result [18]),
    .I2(\Midori/add_Result_Start [38]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[38].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[39].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [39]),
    .I1(\Midori/rounds/mul_Result [19]),
    .I2(\Midori/add_Result_Start [39]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[39].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[40].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [40]),
    .I1(\Midori/rounds/mul_Result [52]),
    .I2(\Midori/add_Result_Start [40]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[40].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[41].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [41]),
    .I1(\Midori/rounds/mul_Result [53]),
    .I2(\Midori/add_Result_Start [41]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[41].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[42].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [42]),
    .I1(\Midori/rounds/mul_Result [54]),
    .I2(\Midori/add_Result_Start [42]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[42].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[43].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [43]),
    .I1(\Midori/rounds/mul_Result [55]),
    .I2(\Midori/add_Result_Start [43]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[43].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[44].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [44]),
    .I1(\Midori/rounds/mul_Result [40]),
    .I2(\Midori/add_Result_Start [44]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[44].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[45].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [45]),
    .I1(\Midori/rounds/mul_Result [41]),
    .I2(\Midori/add_Result_Start [45]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[45].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[46].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [46]),
    .I1(\Midori/rounds/mul_Result [42]),
    .I2(\Midori/add_Result_Start [46]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[46].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[47].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [47]),
    .I1(\Midori/rounds/mul_Result [43]),
    .I2(\Midori/add_Result_Start [47]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[47].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[48].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [48]),
    .I1(\Midori/rounds/mul_Result [24]),
    .I2(\Midori/add_Result_Start [48]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[48].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[49].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [49]),
    .I1(\Midori/rounds/mul_Result [25]),
    .I2(\Midori/add_Result_Start [49]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[49].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[50].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [50]),
    .I1(\Midori/rounds/mul_Result [26]),
    .I2(\Midori/add_Result_Start [50]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[50].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[51].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [51]),
    .I1(\Midori/rounds/mul_Result [27]),
    .I2(\Midori/add_Result_Start [51]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[51].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[52].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [52]),
    .I1(\Midori/rounds/mul_Result [4]),
    .I2(\Midori/add_Result_Start [52]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[52].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[53].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [53]),
    .I1(\Midori/rounds/mul_Result [5]),
    .I2(\Midori/add_Result_Start [53]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[53].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[54].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [54]),
    .I1(\Midori/rounds/mul_Result [6]),
    .I2(\Midori/add_Result_Start [54]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[54].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[55].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [55]),
    .I1(\Midori/rounds/mul_Result [7]),
    .I2(\Midori/add_Result_Start [55]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[55].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[56].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [56]),
    .I1(\Midori/rounds/mul_Result [32]),
    .I2(\Midori/add_Result_Start [56]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[56].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[57].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [57]),
    .I1(\Midori/rounds/mul_Result [33]),
    .I2(\Midori/add_Result_Start [57]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[57].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[58].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [58]),
    .I1(\Midori/rounds/mul_Result [34]),
    .I2(\Midori/add_Result_Start [58]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[58].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[59].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [59]),
    .I1(\Midori/rounds/mul_Result [35]),
    .I2(\Midori/add_Result_Start [59]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[59].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[60].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [60]),
    .I1(\Midori/rounds/mul_Result [60]),
    .I2(\Midori/add_Result_Start [60]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[60].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[61].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [61]),
    .I1(\Midori/rounds/mul_Result [61]),
    .I2(\Midori/add_Result_Start [61]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[61].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[62].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [62]),
    .I1(\Midori/rounds/mul_Result [62]),
    .I2(\Midori/add_Result_Start [62]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[62].SFF/DQ )
  );
  LUT5 #(
    .INIT ( 32'hF0F0CCAA ))
  \Midori/rounds/roundResult_Reg/GEN[63].SFF/LUTINST  (
    .I0(\Midori/rounds/mul_ResultXORkey [63]),
    .I1(\Midori/rounds/mul_Result [63]),
    .I2(\Midori/add_Result_Start [63]),
    .I3(enc_dec_IBUF_66),
    .I4(reset_IBUF_65),
    .O(\Midori/rounds/roundResult_Reg/GEN[63].SFF/DQ )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[0].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[0].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[0].SFF/Q_663 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[1].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[1].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[1].SFF/Q_664 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[2].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[2].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[2].SFF/Q_665 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[3].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[3].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[3].SFF/Q_666 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[4].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[4].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[4].SFF/Q_667 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[5].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[5].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[5].SFF/Q_668 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[6].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[6].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[6].SFF/Q_669 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[7].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[7].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[7].SFF/Q_670 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[8].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[8].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[8].SFF/Q_671 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[9].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[9].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[9].SFF/Q_672 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[10].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[10].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[10].SFF/Q_673 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[11].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[11].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[11].SFF/Q_674 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[12].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[12].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[12].SFF/Q_675 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[13].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[13].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[13].SFF/Q_676 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[14].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[14].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[14].SFF/Q_677 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[15].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[15].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[15].SFF/Q_678 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[16].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[16].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[16].SFF/Q_679 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[17].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[17].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[17].SFF/Q_680 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[18].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[18].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[18].SFF/Q_681 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[19].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[19].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[19].SFF/Q_682 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[20].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[20].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[20].SFF/Q_683 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[21].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[21].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[21].SFF/Q_684 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[22].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[22].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[22].SFF/Q_685 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[23].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[23].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[23].SFF/Q_686 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[24].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[24].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[24].SFF/Q_687 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[25].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[25].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[25].SFF/Q_688 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[26].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[26].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[26].SFF/Q_689 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[27].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[27].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[27].SFF/Q_690 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[28].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[28].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[28].SFF/Q_691 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[29].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[29].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[29].SFF/Q_692 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[30].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[30].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[30].SFF/Q_693 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[31].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[31].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[31].SFF/Q_694 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[32].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[32].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[32].SFF/Q_695 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[33].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[33].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[33].SFF/Q_696 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[34].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[34].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[34].SFF/Q_697 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[35].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[35].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[35].SFF/Q_698 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[36].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[36].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[36].SFF/Q_699 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[37].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[37].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[37].SFF/Q_700 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[38].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[38].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[38].SFF/Q_701 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[39].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[39].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[39].SFF/Q_702 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[40].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[40].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[40].SFF/Q_703 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[41].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[41].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[41].SFF/Q_704 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[42].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[42].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[42].SFF/Q_705 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[43].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[43].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[43].SFF/Q_706 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[44].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[44].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[44].SFF/Q_707 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[45].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[45].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[45].SFF/Q_708 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[46].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[46].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[46].SFF/Q_709 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[47].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[47].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[47].SFF/Q_710 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[48].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[48].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[48].SFF/Q_711 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[49].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[49].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[49].SFF/Q_712 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[50].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[50].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[50].SFF/Q_713 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[51].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[51].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[51].SFF/Q_714 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[52].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[52].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[52].SFF/Q_715 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[53].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[53].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[53].SFF/Q_716 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[54].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[54].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[54].SFF/Q_717 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[55].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[55].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[55].SFF/Q_718 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[56].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[56].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[56].SFF/Q_719 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[57].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[57].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[57].SFF/Q_720 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[58].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[58].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[58].SFF/Q_721 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[59].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[59].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[59].SFF/Q_722 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[60].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[60].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[60].SFF/Q_723 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[61].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[61].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[61].SFF/Q_724 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[62].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[62].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[62].SFF/Q_725 )
  );
  FD   \Midori/rounds/roundResult_Reg/GEN[63].SFF/Q  (
    .C(clk_BUFGP_64),
    .D(\Midori/rounds/roundResult_Reg/GEN[63].SFF/DQ ),
    .Q(\Midori/rounds/roundResult_Reg/GEN[63].SFF/Q_726 )
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[0].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[0].SFF/Q_663 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[1].SFF/Q_664 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[2].SFF/Q_665 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[3].SFF/Q_666 ),
    .O(\Midori/rounds_Output [0])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[0].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[0].SFF/Q_663 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[1].SFF/Q_664 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[2].SFF/Q_665 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[3].SFF/Q_666 ),
    .O(\Midori/rounds_Output [1])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[0].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[0].SFF/Q_663 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[1].SFF/Q_664 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[2].SFF/Q_665 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[3].SFF/Q_666 ),
    .O(\Midori/rounds_Output [2])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[0].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[0].SFF/Q_663 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[1].SFF/Q_664 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[2].SFF/Q_665 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[3].SFF/Q_666 ),
    .O(\Midori/rounds_Output [3])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[1].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[4].SFF/Q_667 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[5].SFF/Q_668 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[6].SFF/Q_669 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[7].SFF/Q_670 ),
    .O(\Midori/rounds_Output [4])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[1].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[4].SFF/Q_667 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[5].SFF/Q_668 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[6].SFF/Q_669 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[7].SFF/Q_670 ),
    .O(\Midori/rounds_Output [5])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[1].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[4].SFF/Q_667 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[5].SFF/Q_668 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[6].SFF/Q_669 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[7].SFF/Q_670 ),
    .O(\Midori/rounds_Output [6])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[1].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[4].SFF/Q_667 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[5].SFF/Q_668 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[6].SFF/Q_669 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[7].SFF/Q_670 ),
    .O(\Midori/rounds_Output [7])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[2].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[8].SFF/Q_671 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[9].SFF/Q_672 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[10].SFF/Q_673 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[11].SFF/Q_674 ),
    .O(\Midori/rounds_Output [8])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[2].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[8].SFF/Q_671 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[9].SFF/Q_672 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[10].SFF/Q_673 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[11].SFF/Q_674 ),
    .O(\Midori/rounds_Output [9])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[2].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[8].SFF/Q_671 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[9].SFF/Q_672 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[10].SFF/Q_673 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[11].SFF/Q_674 ),
    .O(\Midori/rounds_Output [10])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[2].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[8].SFF/Q_671 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[9].SFF/Q_672 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[10].SFF/Q_673 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[11].SFF/Q_674 ),
    .O(\Midori/rounds_Output [11])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[3].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[12].SFF/Q_675 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[13].SFF/Q_676 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[14].SFF/Q_677 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[15].SFF/Q_678 ),
    .O(\Midori/rounds_Output [12])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[3].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[12].SFF/Q_675 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[13].SFF/Q_676 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[14].SFF/Q_677 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[15].SFF/Q_678 ),
    .O(\Midori/rounds_Output [13])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[3].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[12].SFF/Q_675 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[13].SFF/Q_676 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[14].SFF/Q_677 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[15].SFF/Q_678 ),
    .O(\Midori/rounds_Output [14])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[3].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[12].SFF/Q_675 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[13].SFF/Q_676 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[14].SFF/Q_677 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[15].SFF/Q_678 ),
    .O(\Midori/rounds_Output [15])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[4].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[16].SFF/Q_679 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[17].SFF/Q_680 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[18].SFF/Q_681 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[19].SFF/Q_682 ),
    .O(\Midori/rounds_Output [16])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[4].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[16].SFF/Q_679 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[17].SFF/Q_680 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[18].SFF/Q_681 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[19].SFF/Q_682 ),
    .O(\Midori/rounds_Output [17])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[4].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[16].SFF/Q_679 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[17].SFF/Q_680 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[18].SFF/Q_681 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[19].SFF/Q_682 ),
    .O(\Midori/rounds_Output [18])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[4].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[16].SFF/Q_679 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[17].SFF/Q_680 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[18].SFF/Q_681 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[19].SFF/Q_682 ),
    .O(\Midori/rounds_Output [19])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[5].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[20].SFF/Q_683 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[21].SFF/Q_684 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[22].SFF/Q_685 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[23].SFF/Q_686 ),
    .O(\Midori/rounds_Output [20])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[5].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[20].SFF/Q_683 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[21].SFF/Q_684 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[22].SFF/Q_685 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[23].SFF/Q_686 ),
    .O(\Midori/rounds_Output [21])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[5].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[20].SFF/Q_683 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[21].SFF/Q_684 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[22].SFF/Q_685 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[23].SFF/Q_686 ),
    .O(\Midori/rounds_Output [22])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[5].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[20].SFF/Q_683 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[21].SFF/Q_684 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[22].SFF/Q_685 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[23].SFF/Q_686 ),
    .O(\Midori/rounds_Output [23])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[6].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[24].SFF/Q_687 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[25].SFF/Q_688 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[26].SFF/Q_689 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[27].SFF/Q_690 ),
    .O(\Midori/rounds_Output [24])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[6].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[24].SFF/Q_687 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[25].SFF/Q_688 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[26].SFF/Q_689 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[27].SFF/Q_690 ),
    .O(\Midori/rounds_Output [25])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[6].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[24].SFF/Q_687 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[25].SFF/Q_688 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[26].SFF/Q_689 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[27].SFF/Q_690 ),
    .O(\Midori/rounds_Output [26])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[6].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[24].SFF/Q_687 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[25].SFF/Q_688 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[26].SFF/Q_689 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[27].SFF/Q_690 ),
    .O(\Midori/rounds_Output [27])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[7].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[28].SFF/Q_691 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[29].SFF/Q_692 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[30].SFF/Q_693 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[31].SFF/Q_694 ),
    .O(\Midori/rounds_Output [28])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[7].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[28].SFF/Q_691 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[29].SFF/Q_692 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[30].SFF/Q_693 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[31].SFF/Q_694 ),
    .O(\Midori/rounds_Output [29])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[7].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[28].SFF/Q_691 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[29].SFF/Q_692 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[30].SFF/Q_693 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[31].SFF/Q_694 ),
    .O(\Midori/rounds_Output [30])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[7].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[28].SFF/Q_691 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[29].SFF/Q_692 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[30].SFF/Q_693 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[31].SFF/Q_694 ),
    .O(\Midori/rounds_Output [31])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[8].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[32].SFF/Q_695 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[33].SFF/Q_696 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[34].SFF/Q_697 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[35].SFF/Q_698 ),
    .O(\Midori/rounds_Output [32])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[8].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[32].SFF/Q_695 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[33].SFF/Q_696 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[34].SFF/Q_697 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[35].SFF/Q_698 ),
    .O(\Midori/rounds_Output [33])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[8].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[32].SFF/Q_695 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[33].SFF/Q_696 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[34].SFF/Q_697 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[35].SFF/Q_698 ),
    .O(\Midori/rounds_Output [34])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[8].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[32].SFF/Q_695 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[33].SFF/Q_696 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[34].SFF/Q_697 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[35].SFF/Q_698 ),
    .O(\Midori/rounds_Output [35])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[9].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[36].SFF/Q_699 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[37].SFF/Q_700 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[38].SFF/Q_701 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[39].SFF/Q_702 ),
    .O(\Midori/rounds_Output [36])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[9].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[36].SFF/Q_699 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[37].SFF/Q_700 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[38].SFF/Q_701 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[39].SFF/Q_702 ),
    .O(\Midori/rounds_Output [37])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[9].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[36].SFF/Q_699 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[37].SFF/Q_700 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[38].SFF/Q_701 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[39].SFF/Q_702 ),
    .O(\Midori/rounds_Output [38])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[9].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[36].SFF/Q_699 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[37].SFF/Q_700 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[38].SFF/Q_701 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[39].SFF/Q_702 ),
    .O(\Midori/rounds_Output [39])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[10].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[40].SFF/Q_703 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[41].SFF/Q_704 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[42].SFF/Q_705 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[43].SFF/Q_706 ),
    .O(\Midori/rounds_Output [40])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[10].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[40].SFF/Q_703 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[41].SFF/Q_704 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[42].SFF/Q_705 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[43].SFF/Q_706 ),
    .O(\Midori/rounds_Output [41])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[10].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[40].SFF/Q_703 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[41].SFF/Q_704 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[42].SFF/Q_705 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[43].SFF/Q_706 ),
    .O(\Midori/rounds_Output [42])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[10].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[40].SFF/Q_703 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[41].SFF/Q_704 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[42].SFF/Q_705 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[43].SFF/Q_706 ),
    .O(\Midori/rounds_Output [43])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[11].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[44].SFF/Q_707 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[45].SFF/Q_708 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[46].SFF/Q_709 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[47].SFF/Q_710 ),
    .O(\Midori/rounds_Output [44])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[11].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[44].SFF/Q_707 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[45].SFF/Q_708 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[46].SFF/Q_709 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[47].SFF/Q_710 ),
    .O(\Midori/rounds_Output [45])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[11].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[44].SFF/Q_707 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[45].SFF/Q_708 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[46].SFF/Q_709 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[47].SFF/Q_710 ),
    .O(\Midori/rounds_Output [46])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[11].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[44].SFF/Q_707 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[45].SFF/Q_708 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[46].SFF/Q_709 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[47].SFF/Q_710 ),
    .O(\Midori/rounds_Output [47])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[12].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[48].SFF/Q_711 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[49].SFF/Q_712 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[50].SFF/Q_713 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[51].SFF/Q_714 ),
    .O(\Midori/rounds_Output [48])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[12].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[48].SFF/Q_711 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[49].SFF/Q_712 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[50].SFF/Q_713 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[51].SFF/Q_714 ),
    .O(\Midori/rounds_Output [49])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[12].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[48].SFF/Q_711 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[49].SFF/Q_712 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[50].SFF/Q_713 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[51].SFF/Q_714 ),
    .O(\Midori/rounds_Output [50])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[12].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[48].SFF/Q_711 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[49].SFF/Q_712 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[50].SFF/Q_713 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[51].SFF/Q_714 ),
    .O(\Midori/rounds_Output [51])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[13].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[52].SFF/Q_715 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[53].SFF/Q_716 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[54].SFF/Q_717 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[55].SFF/Q_718 ),
    .O(\Midori/rounds_Output [52])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[13].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[52].SFF/Q_715 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[53].SFF/Q_716 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[54].SFF/Q_717 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[55].SFF/Q_718 ),
    .O(\Midori/rounds_Output [53])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[13].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[52].SFF/Q_715 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[53].SFF/Q_716 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[54].SFF/Q_717 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[55].SFF/Q_718 ),
    .O(\Midori/rounds_Output [54])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[13].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[52].SFF/Q_715 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[53].SFF/Q_716 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[54].SFF/Q_717 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[55].SFF/Q_718 ),
    .O(\Midori/rounds_Output [55])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[14].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[56].SFF/Q_719 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[57].SFF/Q_720 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[58].SFF/Q_721 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[59].SFF/Q_722 ),
    .O(\Midori/rounds_Output [56])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[14].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[56].SFF/Q_719 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[57].SFF/Q_720 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[58].SFF/Q_721 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[59].SFF/Q_722 ),
    .O(\Midori/rounds_Output [57])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[14].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[56].SFF/Q_719 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[57].SFF/Q_720 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[58].SFF/Q_721 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[59].SFF/Q_722 ),
    .O(\Midori/rounds_Output [58])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[14].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[56].SFF/Q_719 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[57].SFF/Q_720 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[58].SFF/Q_721 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[59].SFF/Q_722 ),
    .O(\Midori/rounds_Output [59])
  );
  LUT4 #(
    .INIT ( 16'h0EEC ))
  \Midori/rounds/sub/substition_PRINCE[15].sBox_PRINCE/y_0  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[60].SFF/Q_723 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[61].SFF/Q_724 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[62].SFF/Q_725 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[63].SFF/Q_726 ),
    .O(\Midori/rounds_Output [60])
  );
  LUT4 #(
    .INIT ( 16'hA0FA ))
  \Midori/rounds/sub/substition_PRINCE[15].sBox_PRINCE/y_1  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[60].SFF/Q_723 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[61].SFF/Q_724 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[62].SFF/Q_725 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[63].SFF/Q_726 ),
    .O(\Midori/rounds_Output [61])
  );
  LUT4 #(
    .INIT ( 16'hC8D5 ))
  \Midori/rounds/sub/substition_PRINCE[15].sBox_PRINCE/y_2  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[60].SFF/Q_723 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[61].SFF/Q_724 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[62].SFF/Q_725 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[63].SFF/Q_726 ),
    .O(\Midori/rounds_Output [62])
  );
  LUT4 #(
    .INIT ( 16'h0377 ))
  \Midori/rounds/sub/substition_PRINCE[15].sBox_PRINCE/y_3  (
    .I0(\Midori/rounds/roundResult_Reg/GEN[60].SFF/Q_723 ),
    .I1(\Midori/rounds/roundResult_Reg/GEN[61].SFF/Q_724 ),
    .I2(\Midori/rounds/roundResult_Reg/GEN[62].SFF/Q_725 ),
    .I3(\Midori/rounds/roundResult_Reg/GEN[63].SFF/Q_726 ),
    .O(\Midori/rounds_Output [63])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[3].INST3  (
    .I0(\Midori/rounds/mul_input [55]),
    .I1(\Midori/rounds/mul_input [59]),
    .I2(\Midori/rounds/mul_input [63]),
    .I3(\Midori/rounds/SelectedKey[51] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [51]),
    .O5(\Midori/rounds/mul_Result [51])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[3].INST2  (
    .I0(\Midori/rounds/mul_input [51]),
    .I1(\Midori/rounds/mul_input [59]),
    .I2(\Midori/rounds/mul_input [63]),
    .I3(\Midori/rounds/SelectedKey[55] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [55]),
    .O5(\Midori/rounds/mul_Result [55])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[3].INST1  (
    .I0(\Midori/rounds/mul_input [51]),
    .I1(\Midori/rounds/mul_input [55]),
    .I2(\Midori/rounds/mul_input [63]),
    .I3(\Midori/rounds/SelectedKey[59] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [59]),
    .O5(\Midori/rounds/mul_Result [59])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[3].INST0  (
    .I0(\Midori/rounds/mul_input [51]),
    .I1(\Midori/rounds/mul_input [55]),
    .I2(\Midori/rounds/mul_input [59]),
    .I3(\Midori/rounds/SelectedKey[63] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [63]),
    .O5(\Midori/rounds/mul_Result [63])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[2].INST3  (
    .I0(\Midori/rounds/mul_input [54]),
    .I1(\Midori/rounds/mul_input [58]),
    .I2(\Midori/rounds/mul_input [62]),
    .I3(\Midori/rounds/SelectedKey[50] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [50]),
    .O5(\Midori/rounds/mul_Result [50])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[2].INST2  (
    .I0(\Midori/rounds/mul_input [50]),
    .I1(\Midori/rounds/mul_input [58]),
    .I2(\Midori/rounds/mul_input [62]),
    .I3(\Midori/rounds/SelectedKey[54] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [54]),
    .O5(\Midori/rounds/mul_Result [54])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[2].INST1  (
    .I0(\Midori/rounds/mul_input [50]),
    .I1(\Midori/rounds/mul_input [54]),
    .I2(\Midori/rounds/mul_input [62]),
    .I3(\Midori/rounds/SelectedKey[58] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [58]),
    .O5(\Midori/rounds/mul_Result [58])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[2].INST0  (
    .I0(\Midori/rounds/mul_input [50]),
    .I1(\Midori/rounds/mul_input [54]),
    .I2(\Midori/rounds/mul_input [58]),
    .I3(\Midori/rounds/SelectedKey[62] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [62]),
    .O5(\Midori/rounds/mul_Result [62])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[1].INST3  (
    .I0(\Midori/rounds/mul_input [53]),
    .I1(\Midori/rounds/mul_input [57]),
    .I2(\Midori/rounds/mul_input [61]),
    .I3(\Midori/rounds/SelectedKey[49] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [49]),
    .O5(\Midori/rounds/mul_Result [49])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[1].INST2  (
    .I0(\Midori/rounds/mul_input [49]),
    .I1(\Midori/rounds/mul_input [57]),
    .I2(\Midori/rounds/mul_input [61]),
    .I3(\Midori/rounds/SelectedKey[53] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [53]),
    .O5(\Midori/rounds/mul_Result [53])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[1].INST1  (
    .I0(\Midori/rounds/mul_input [49]),
    .I1(\Midori/rounds/mul_input [53]),
    .I2(\Midori/rounds/mul_input [61]),
    .I3(\Midori/rounds/SelectedKey[57] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [57]),
    .O5(\Midori/rounds/mul_Result [57])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[1].INST0  (
    .I0(\Midori/rounds/mul_input [49]),
    .I1(\Midori/rounds/mul_input [53]),
    .I2(\Midori/rounds/mul_input [57]),
    .I3(\Midori/rounds/SelectedKey[61] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [61]),
    .O5(\Midori/rounds/mul_Result [61])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[0].INST3  (
    .I0(\Midori/rounds/mul_input [52]),
    .I1(\Midori/rounds/mul_input [56]),
    .I2(\Midori/rounds/mul_input [60]),
    .I3(\Midori/rounds/ProcessedKey[48] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [48]),
    .O5(\Midori/rounds/mul_Result [48])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[0].INST2  (
    .I0(\Midori/rounds/mul_input [48]),
    .I1(\Midori/rounds/mul_input [56]),
    .I2(\Midori/rounds/mul_input [60]),
    .I3(\Midori/rounds/ProcessedKey[52] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [52]),
    .O5(\Midori/rounds/mul_Result [52])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[0].INST1  (
    .I0(\Midori/rounds/mul_input [48]),
    .I1(\Midori/rounds/mul_input [52]),
    .I2(\Midori/rounds/mul_input [60]),
    .I3(\Midori/rounds/ProcessedKey[56] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [56]),
    .O5(\Midori/rounds/mul_Result [56])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC1/LoopGen[0].INST0  (
    .I0(\Midori/rounds/mul_input [48]),
    .I1(\Midori/rounds/mul_input [52]),
    .I2(\Midori/rounds/mul_input [56]),
    .I3(\Midori/rounds/ProcessedKey[60] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [60]),
    .O5(\Midori/rounds/mul_Result [60])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[3].INST3  (
    .I0(\Midori/rounds/mul_input [39]),
    .I1(\Midori/rounds/mul_input [43]),
    .I2(\Midori/rounds/mul_input [47]),
    .I3(\Midori/rounds/SelectedKey[35] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [35]),
    .O5(\Midori/rounds/mul_Result [35])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[3].INST2  (
    .I0(\Midori/rounds/mul_input [35]),
    .I1(\Midori/rounds/mul_input [43]),
    .I2(\Midori/rounds/mul_input [47]),
    .I3(\Midori/rounds/SelectedKey[39] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [39]),
    .O5(\Midori/rounds/mul_Result [39])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[3].INST1  (
    .I0(\Midori/rounds/mul_input [35]),
    .I1(\Midori/rounds/mul_input [39]),
    .I2(\Midori/rounds/mul_input [47]),
    .I3(\Midori/rounds/SelectedKey[43] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [43]),
    .O5(\Midori/rounds/mul_Result [43])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[3].INST0  (
    .I0(\Midori/rounds/mul_input [35]),
    .I1(\Midori/rounds/mul_input [39]),
    .I2(\Midori/rounds/mul_input [43]),
    .I3(\Midori/rounds/SelectedKey[47] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [47]),
    .O5(\Midori/rounds/mul_Result [47])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[2].INST3  (
    .I0(\Midori/rounds/mul_input [38]),
    .I1(\Midori/rounds/mul_input [42]),
    .I2(\Midori/rounds/mul_input [46]),
    .I3(\Midori/rounds/SelectedKey[34] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [34]),
    .O5(\Midori/rounds/mul_Result [34])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[2].INST2  (
    .I0(\Midori/rounds/mul_input [34]),
    .I1(\Midori/rounds/mul_input [42]),
    .I2(\Midori/rounds/mul_input [46]),
    .I3(\Midori/rounds/SelectedKey[38] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [38]),
    .O5(\Midori/rounds/mul_Result [38])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[2].INST1  (
    .I0(\Midori/rounds/mul_input [34]),
    .I1(\Midori/rounds/mul_input [38]),
    .I2(\Midori/rounds/mul_input [46]),
    .I3(\Midori/rounds/SelectedKey[42] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [42]),
    .O5(\Midori/rounds/mul_Result [42])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[2].INST0  (
    .I0(\Midori/rounds/mul_input [34]),
    .I1(\Midori/rounds/mul_input [38]),
    .I2(\Midori/rounds/mul_input [42]),
    .I3(\Midori/rounds/SelectedKey[46] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [46]),
    .O5(\Midori/rounds/mul_Result [46])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[1].INST3  (
    .I0(\Midori/rounds/mul_input [37]),
    .I1(\Midori/rounds/mul_input [41]),
    .I2(\Midori/rounds/mul_input [45]),
    .I3(\Midori/rounds/SelectedKey[33] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [33]),
    .O5(\Midori/rounds/mul_Result [33])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[1].INST2  (
    .I0(\Midori/rounds/mul_input [33]),
    .I1(\Midori/rounds/mul_input [41]),
    .I2(\Midori/rounds/mul_input [45]),
    .I3(\Midori/rounds/SelectedKey[37] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [37]),
    .O5(\Midori/rounds/mul_Result [37])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[1].INST1  (
    .I0(\Midori/rounds/mul_input [33]),
    .I1(\Midori/rounds/mul_input [37]),
    .I2(\Midori/rounds/mul_input [45]),
    .I3(\Midori/rounds/SelectedKey[41] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [41]),
    .O5(\Midori/rounds/mul_Result [41])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[1].INST0  (
    .I0(\Midori/rounds/mul_input [33]),
    .I1(\Midori/rounds/mul_input [37]),
    .I2(\Midori/rounds/mul_input [41]),
    .I3(\Midori/rounds/SelectedKey[45] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [45]),
    .O5(\Midori/rounds/mul_Result [45])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[0].INST3  (
    .I0(\Midori/rounds/mul_input [36]),
    .I1(\Midori/rounds/mul_input [40]),
    .I2(\Midori/rounds/mul_input [44]),
    .I3(\Midori/rounds/ProcessedKey[32] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [32]),
    .O5(\Midori/rounds/mul_Result [32])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[0].INST2  (
    .I0(\Midori/rounds/mul_input [32]),
    .I1(\Midori/rounds/mul_input [40]),
    .I2(\Midori/rounds/mul_input [44]),
    .I3(\Midori/rounds/ProcessedKey[36] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [36]),
    .O5(\Midori/rounds/mul_Result [36])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[0].INST1  (
    .I0(\Midori/rounds/mul_input [32]),
    .I1(\Midori/rounds/mul_input [36]),
    .I2(\Midori/rounds/mul_input [44]),
    .I3(\Midori/rounds/ProcessedKey[40] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [40]),
    .O5(\Midori/rounds/mul_Result [40])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC2/LoopGen[0].INST0  (
    .I0(\Midori/rounds/mul_input [32]),
    .I1(\Midori/rounds/mul_input [36]),
    .I2(\Midori/rounds/mul_input [40]),
    .I3(\Midori/rounds/ProcessedKey[44] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [44]),
    .O5(\Midori/rounds/mul_Result [44])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[3].INST3  (
    .I0(\Midori/rounds/mul_input [23]),
    .I1(\Midori/rounds/mul_input [27]),
    .I2(\Midori/rounds/mul_input [31]),
    .I3(\Midori/rounds/SelectedKey[19] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [19]),
    .O5(\Midori/rounds/mul_Result [19])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[3].INST2  (
    .I0(\Midori/rounds/mul_input [19]),
    .I1(\Midori/rounds/mul_input [27]),
    .I2(\Midori/rounds/mul_input [31]),
    .I3(\Midori/rounds/SelectedKey[23] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [23]),
    .O5(\Midori/rounds/mul_Result [23])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[3].INST1  (
    .I0(\Midori/rounds/mul_input [19]),
    .I1(\Midori/rounds/mul_input [23]),
    .I2(\Midori/rounds/mul_input [31]),
    .I3(\Midori/rounds/SelectedKey[27] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [27]),
    .O5(\Midori/rounds/mul_Result [27])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[3].INST0  (
    .I0(\Midori/rounds/mul_input [19]),
    .I1(\Midori/rounds/mul_input [23]),
    .I2(\Midori/rounds/mul_input [27]),
    .I3(\Midori/rounds/SelectedKey[31] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [31]),
    .O5(\Midori/rounds/mul_Result [31])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[2].INST3  (
    .I0(\Midori/rounds/mul_input [22]),
    .I1(\Midori/rounds/mul_input [26]),
    .I2(\Midori/rounds/mul_input [30]),
    .I3(\Midori/rounds/SelectedKey[18] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [18]),
    .O5(\Midori/rounds/mul_Result [18])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[2].INST2  (
    .I0(\Midori/rounds/mul_input [18]),
    .I1(\Midori/rounds/mul_input [26]),
    .I2(\Midori/rounds/mul_input [30]),
    .I3(\Midori/rounds/SelectedKey[22] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [22]),
    .O5(\Midori/rounds/mul_Result [22])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[2].INST1  (
    .I0(\Midori/rounds/mul_input [18]),
    .I1(\Midori/rounds/mul_input [22]),
    .I2(\Midori/rounds/mul_input [30]),
    .I3(\Midori/rounds/SelectedKey[26] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [26]),
    .O5(\Midori/rounds/mul_Result [26])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[2].INST0  (
    .I0(\Midori/rounds/mul_input [18]),
    .I1(\Midori/rounds/mul_input [22]),
    .I2(\Midori/rounds/mul_input [26]),
    .I3(\Midori/rounds/SelectedKey[30] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [30]),
    .O5(\Midori/rounds/mul_Result [30])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[1].INST3  (
    .I0(\Midori/rounds/mul_input [21]),
    .I1(\Midori/rounds/mul_input [25]),
    .I2(\Midori/rounds/mul_input [29]),
    .I3(\Midori/rounds/SelectedKey[17] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [17]),
    .O5(\Midori/rounds/mul_Result [17])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[1].INST2  (
    .I0(\Midori/rounds/mul_input [17]),
    .I1(\Midori/rounds/mul_input [25]),
    .I2(\Midori/rounds/mul_input [29]),
    .I3(\Midori/rounds/SelectedKey[21] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [21]),
    .O5(\Midori/rounds/mul_Result [21])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[1].INST1  (
    .I0(\Midori/rounds/mul_input [17]),
    .I1(\Midori/rounds/mul_input [21]),
    .I2(\Midori/rounds/mul_input [29]),
    .I3(\Midori/rounds/SelectedKey[25] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [25]),
    .O5(\Midori/rounds/mul_Result [25])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[1].INST0  (
    .I0(\Midori/rounds/mul_input [17]),
    .I1(\Midori/rounds/mul_input [21]),
    .I2(\Midori/rounds/mul_input [25]),
    .I3(\Midori/rounds/SelectedKey[29] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [29]),
    .O5(\Midori/rounds/mul_Result [29])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[0].INST3  (
    .I0(\Midori/rounds/mul_input [20]),
    .I1(\Midori/rounds/mul_input [24]),
    .I2(\Midori/rounds/mul_input [28]),
    .I3(\Midori/rounds/ProcessedKey[16] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [16]),
    .O5(\Midori/rounds/mul_Result [16])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[0].INST2  (
    .I0(\Midori/rounds/mul_input [16]),
    .I1(\Midori/rounds/mul_input [24]),
    .I2(\Midori/rounds/mul_input [28]),
    .I3(\Midori/rounds/ProcessedKey[20] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [20]),
    .O5(\Midori/rounds/mul_Result [20])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[0].INST1  (
    .I0(\Midori/rounds/mul_input [16]),
    .I1(\Midori/rounds/mul_input [20]),
    .I2(\Midori/rounds/mul_input [28]),
    .I3(\Midori/rounds/ProcessedKey[24] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [24]),
    .O5(\Midori/rounds/mul_Result [24])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC3/LoopGen[0].INST0  (
    .I0(\Midori/rounds/mul_input [16]),
    .I1(\Midori/rounds/mul_input [20]),
    .I2(\Midori/rounds/mul_input [24]),
    .I3(\Midori/rounds/ProcessedKey[28] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [28]),
    .O5(\Midori/rounds/mul_Result [28])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[3].INST3  (
    .I0(\Midori/rounds/mul_input [7]),
    .I1(\Midori/rounds/mul_input [11]),
    .I2(\Midori/rounds/mul_input [15]),
    .I3(\Midori/rounds/SelectedKey[3] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [3]),
    .O5(\Midori/rounds/mul_Result [3])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[3].INST2  (
    .I0(\Midori/rounds/mul_input [3]),
    .I1(\Midori/rounds/mul_input [11]),
    .I2(\Midori/rounds/mul_input [15]),
    .I3(\Midori/rounds/SelectedKey[7] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [7]),
    .O5(\Midori/rounds/mul_Result [7])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[3].INST1  (
    .I0(\Midori/rounds/mul_input [3]),
    .I1(\Midori/rounds/mul_input [7]),
    .I2(\Midori/rounds/mul_input [15]),
    .I3(\Midori/rounds/SelectedKey[11] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [11]),
    .O5(\Midori/rounds/mul_Result [11])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[3].INST0  (
    .I0(\Midori/rounds/mul_input [3]),
    .I1(\Midori/rounds/mul_input [7]),
    .I2(\Midori/rounds/mul_input [11]),
    .I3(\Midori/rounds/SelectedKey[15] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [15]),
    .O5(\Midori/rounds/mul_Result [15])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[2].INST3  (
    .I0(\Midori/rounds/mul_input [6]),
    .I1(\Midori/rounds/mul_input [10]),
    .I2(\Midori/rounds/mul_input [14]),
    .I3(\Midori/rounds/SelectedKey[2] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [2]),
    .O5(\Midori/rounds/mul_Result [2])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[2].INST2  (
    .I0(\Midori/rounds/mul_input [2]),
    .I1(\Midori/rounds/mul_input [10]),
    .I2(\Midori/rounds/mul_input [14]),
    .I3(\Midori/rounds/SelectedKey[6] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [6]),
    .O5(\Midori/rounds/mul_Result [6])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[2].INST1  (
    .I0(\Midori/rounds/mul_input [2]),
    .I1(\Midori/rounds/mul_input [6]),
    .I2(\Midori/rounds/mul_input [14]),
    .I3(\Midori/rounds/SelectedKey[10] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [10]),
    .O5(\Midori/rounds/mul_Result [10])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[2].INST0  (
    .I0(\Midori/rounds/mul_input [2]),
    .I1(\Midori/rounds/mul_input [6]),
    .I2(\Midori/rounds/mul_input [10]),
    .I3(\Midori/rounds/SelectedKey[14] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [14]),
    .O5(\Midori/rounds/mul_Result [14])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[1].INST3  (
    .I0(\Midori/rounds/mul_input [5]),
    .I1(\Midori/rounds/mul_input [9]),
    .I2(\Midori/rounds/mul_input [13]),
    .I3(\Midori/rounds/SelectedKey[1] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [1]),
    .O5(\Midori/rounds/mul_Result [1])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[1].INST2  (
    .I0(\Midori/rounds/mul_input [1]),
    .I1(\Midori/rounds/mul_input [9]),
    .I2(\Midori/rounds/mul_input [13]),
    .I3(\Midori/rounds/SelectedKey[5] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [5]),
    .O5(\Midori/rounds/mul_Result [5])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[1].INST1  (
    .I0(\Midori/rounds/mul_input [1]),
    .I1(\Midori/rounds/mul_input [5]),
    .I2(\Midori/rounds/mul_input [13]),
    .I3(\Midori/rounds/SelectedKey[9] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [9]),
    .O5(\Midori/rounds/mul_Result [9])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[1].INST0  (
    .I0(\Midori/rounds/mul_input [1]),
    .I1(\Midori/rounds/mul_input [5]),
    .I2(\Midori/rounds/mul_input [9]),
    .I3(\Midori/rounds/SelectedKey[13] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [13]),
    .O5(\Midori/rounds/mul_Result [13])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[0].INST3  (
    .I0(\Midori/rounds/mul_input [4]),
    .I1(\Midori/rounds/mul_input [8]),
    .I2(\Midori/rounds/mul_input [12]),
    .I3(\Midori/rounds/ProcessedKey[0] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [0]),
    .O5(\Midori/rounds/mul_Result [0])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[0].INST2  (
    .I0(\Midori/rounds/mul_input [0]),
    .I1(\Midori/rounds/mul_input [8]),
    .I2(\Midori/rounds/mul_input [12]),
    .I3(\Midori/rounds/ProcessedKey[4] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [4]),
    .O5(\Midori/rounds/mul_Result [4])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[0].INST1  (
    .I0(\Midori/rounds/mul_input [0]),
    .I1(\Midori/rounds/mul_input [4]),
    .I2(\Midori/rounds/mul_input [12]),
    .I3(\Midori/rounds/ProcessedKey[8] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [8]),
    .O5(\Midori/rounds/mul_Result [8])
  );
  LUT6_2 #(
    .INIT ( 64'h0000699600009696 ))
  \Midori/rounds/mul/MC4/LoopGen[0].INST0  (
    .I0(\Midori/rounds/mul_input [0]),
    .I1(\Midori/rounds/mul_input [4]),
    .I2(\Midori/rounds/mul_input [8]),
    .I3(\Midori/rounds/ProcessedKey[12] ),
    .I4(1'b0),
    .I5(1'b1),
    .O6(\Midori/rounds/mul_ResultXORkey [12]),
    .O5(\Midori/rounds/mul_Result [12])
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \controller/done<3>1  (
    .I0(\controller/roundCounter/count [3]),
    .I1(\controller/roundCounter/count [2]),
    .I2(\controller/roundCounter/count [1]),
    .I3(\controller/roundCounter/count [0]),
    .O(done_OBUF_259)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \controller/roundCounter/Mcount_count_xor<1>11  (
    .I0(\controller/roundCounter/count [1]),
    .I1(\controller/roundCounter/count [0]),
    .O(Result[1])
  );
  LUT4 #(
    .INIT ( 16'h6CCC ))
  \Result<3>1  (
    .I0(\controller/roundCounter/count [2]),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [0]),
    .I3(\controller/roundCounter/count [1]),
    .O(Result[3])
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \Result<2>1  (
    .I0(\controller/roundCounter/count [2]),
    .I1(\controller/roundCounter/count [0]),
    .I2(\controller/roundCounter/count [1]),
    .O(Result[2])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<9>1  (
    .I0(key_73_IBUF_185),
    .I1(\Midori/rounds_Output [9]),
    .I2(key_9_IBUF_249),
    .O(output_9_OBUF_121)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<9>1  (
    .I0(key_73_IBUF_185),
    .I1(input_9_IBUF_54),
    .I2(key_9_IBUF_249),
    .O(\Midori/add_Result_Start [9])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<8>1  (
    .I0(key_72_IBUF_186),
    .I1(\Midori/rounds_Output [8]),
    .I2(key_8_IBUF_250),
    .O(output_8_OBUF_122)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<8>1  (
    .I0(key_72_IBUF_186),
    .I1(input_8_IBUF_55),
    .I2(key_8_IBUF_250),
    .O(\Midori/add_Result_Start [8])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<7>1  (
    .I0(key_71_IBUF_187),
    .I1(\Midori/rounds_Output [7]),
    .I2(key_7_IBUF_251),
    .O(output_7_OBUF_123)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<7>1  (
    .I0(key_71_IBUF_187),
    .I1(input_7_IBUF_56),
    .I2(key_7_IBUF_251),
    .O(\Midori/add_Result_Start [7])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<63>1  (
    .I0(\Midori/rounds_Output [63]),
    .I1(key_63_IBUF_195),
    .I2(key_127_IBUF_131),
    .O(output_63_OBUF_67)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<63>1  (
    .I0(input_63_IBUF_0),
    .I1(key_63_IBUF_195),
    .I2(key_127_IBUF_131),
    .O(\Midori/add_Result_Start [63])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<62>1  (
    .I0(\Midori/rounds_Output [62]),
    .I1(key_62_IBUF_196),
    .I2(key_126_IBUF_132),
    .O(output_62_OBUF_68)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<62>1  (
    .I0(input_62_IBUF_1),
    .I1(key_62_IBUF_196),
    .I2(key_126_IBUF_132),
    .O(\Midori/add_Result_Start [62])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<61>1  (
    .I0(\Midori/rounds_Output [61]),
    .I1(key_61_IBUF_197),
    .I2(key_125_IBUF_133),
    .O(output_61_OBUF_69)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<61>1  (
    .I0(input_61_IBUF_2),
    .I1(key_61_IBUF_197),
    .I2(key_125_IBUF_133),
    .O(\Midori/add_Result_Start [61])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<60>1  (
    .I0(\Midori/rounds_Output [60]),
    .I1(key_60_IBUF_198),
    .I2(key_124_IBUF_134),
    .O(output_60_OBUF_70)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<60>1  (
    .I0(input_60_IBUF_3),
    .I1(key_60_IBUF_198),
    .I2(key_124_IBUF_134),
    .O(\Midori/add_Result_Start [60])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<6>1  (
    .I0(key_70_IBUF_188),
    .I1(\Midori/rounds_Output [6]),
    .I2(key_6_IBUF_252),
    .O(output_6_OBUF_124)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<6>1  (
    .I0(key_70_IBUF_188),
    .I1(input_6_IBUF_57),
    .I2(key_6_IBUF_252),
    .O(\Midori/add_Result_Start [6])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<59>1  (
    .I0(key_123_IBUF_135),
    .I1(\Midori/rounds_Output [59]),
    .I2(key_59_IBUF_199),
    .O(output_59_OBUF_71)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<59>1  (
    .I0(key_123_IBUF_135),
    .I1(input_59_IBUF_4),
    .I2(key_59_IBUF_199),
    .O(\Midori/add_Result_Start [59])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<58>1  (
    .I0(key_122_IBUF_136),
    .I1(\Midori/rounds_Output [58]),
    .I2(key_58_IBUF_200),
    .O(output_58_OBUF_72)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<58>1  (
    .I0(key_122_IBUF_136),
    .I1(input_58_IBUF_5),
    .I2(key_58_IBUF_200),
    .O(\Midori/add_Result_Start [58])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<57>1  (
    .I0(key_121_IBUF_137),
    .I1(\Midori/rounds_Output [57]),
    .I2(key_57_IBUF_201),
    .O(output_57_OBUF_73)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<57>1  (
    .I0(key_121_IBUF_137),
    .I1(input_57_IBUF_6),
    .I2(key_57_IBUF_201),
    .O(\Midori/add_Result_Start [57])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<56>1  (
    .I0(key_120_IBUF_138),
    .I1(\Midori/rounds_Output [56]),
    .I2(key_56_IBUF_202),
    .O(output_56_OBUF_74)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<56>1  (
    .I0(key_120_IBUF_138),
    .I1(input_56_IBUF_7),
    .I2(key_56_IBUF_202),
    .O(\Midori/add_Result_Start [56])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<55>1  (
    .I0(\Midori/rounds_Output [55]),
    .I1(key_55_IBUF_203),
    .I2(key_119_IBUF_139),
    .O(output_55_OBUF_75)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<55>1  (
    .I0(input_55_IBUF_8),
    .I1(key_55_IBUF_203),
    .I2(key_119_IBUF_139),
    .O(\Midori/add_Result_Start [55])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<54>1  (
    .I0(\Midori/rounds_Output [54]),
    .I1(key_54_IBUF_204),
    .I2(key_118_IBUF_140),
    .O(output_54_OBUF_76)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<54>1  (
    .I0(input_54_IBUF_9),
    .I1(key_54_IBUF_204),
    .I2(key_118_IBUF_140),
    .O(\Midori/add_Result_Start [54])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<53>1  (
    .I0(\Midori/rounds_Output [53]),
    .I1(key_53_IBUF_205),
    .I2(key_117_IBUF_141),
    .O(output_53_OBUF_77)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<53>1  (
    .I0(input_53_IBUF_10),
    .I1(key_53_IBUF_205),
    .I2(key_117_IBUF_141),
    .O(\Midori/add_Result_Start [53])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<52>1  (
    .I0(\Midori/rounds_Output [52]),
    .I1(key_52_IBUF_206),
    .I2(key_116_IBUF_142),
    .O(output_52_OBUF_78)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<52>1  (
    .I0(input_52_IBUF_11),
    .I1(key_52_IBUF_206),
    .I2(key_116_IBUF_142),
    .O(\Midori/add_Result_Start [52])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<51>1  (
    .I0(\Midori/rounds_Output [51]),
    .I1(key_51_IBUF_207),
    .I2(key_115_IBUF_143),
    .O(output_51_OBUF_79)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<51>1  (
    .I0(input_51_IBUF_12),
    .I1(key_51_IBUF_207),
    .I2(key_115_IBUF_143),
    .O(\Midori/add_Result_Start [51])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<50>1  (
    .I0(\Midori/rounds_Output [50]),
    .I1(key_50_IBUF_208),
    .I2(key_114_IBUF_144),
    .O(output_50_OBUF_80)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<50>1  (
    .I0(input_50_IBUF_13),
    .I1(key_50_IBUF_208),
    .I2(key_114_IBUF_144),
    .O(\Midori/add_Result_Start [50])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<5>1  (
    .I0(\Midori/rounds_Output [5]),
    .I1(key_5_IBUF_253),
    .I2(key_69_IBUF_189),
    .O(output_5_OBUF_125)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<5>1  (
    .I0(input_5_IBUF_58),
    .I1(key_5_IBUF_253),
    .I2(key_69_IBUF_189),
    .O(\Midori/add_Result_Start [5])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<49>1  (
    .I0(key_113_IBUF_145),
    .I1(\Midori/rounds_Output [49]),
    .I2(key_49_IBUF_209),
    .O(output_49_OBUF_81)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<49>1  (
    .I0(key_113_IBUF_145),
    .I1(input_49_IBUF_14),
    .I2(key_49_IBUF_209),
    .O(\Midori/add_Result_Start [49])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<48>1  (
    .I0(key_112_IBUF_146),
    .I1(\Midori/rounds_Output [48]),
    .I2(key_48_IBUF_210),
    .O(output_48_OBUF_82)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<48>1  (
    .I0(key_112_IBUF_146),
    .I1(input_48_IBUF_15),
    .I2(key_48_IBUF_210),
    .O(\Midori/add_Result_Start [48])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<47>1  (
    .I0(key_111_IBUF_147),
    .I1(\Midori/rounds_Output [47]),
    .I2(key_47_IBUF_211),
    .O(output_47_OBUF_83)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<47>1  (
    .I0(key_111_IBUF_147),
    .I1(input_47_IBUF_16),
    .I2(key_47_IBUF_211),
    .O(\Midori/add_Result_Start [47])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<46>1  (
    .I0(key_110_IBUF_148),
    .I1(\Midori/rounds_Output [46]),
    .I2(key_46_IBUF_212),
    .O(output_46_OBUF_84)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<46>1  (
    .I0(key_110_IBUF_148),
    .I1(input_46_IBUF_17),
    .I2(key_46_IBUF_212),
    .O(\Midori/add_Result_Start [46])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<45>1  (
    .I0(\Midori/rounds_Output [45]),
    .I1(key_45_IBUF_213),
    .I2(key_109_IBUF_149),
    .O(output_45_OBUF_85)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<45>1  (
    .I0(input_45_IBUF_18),
    .I1(key_45_IBUF_213),
    .I2(key_109_IBUF_149),
    .O(\Midori/add_Result_Start [45])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<44>1  (
    .I0(\Midori/rounds_Output [44]),
    .I1(key_44_IBUF_214),
    .I2(key_108_IBUF_150),
    .O(output_44_OBUF_86)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<44>1  (
    .I0(input_44_IBUF_19),
    .I1(key_44_IBUF_214),
    .I2(key_108_IBUF_150),
    .O(\Midori/add_Result_Start [44])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<43>1  (
    .I0(\Midori/rounds_Output [43]),
    .I1(key_43_IBUF_215),
    .I2(key_107_IBUF_151),
    .O(output_43_OBUF_87)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<43>1  (
    .I0(input_43_IBUF_20),
    .I1(key_43_IBUF_215),
    .I2(key_107_IBUF_151),
    .O(\Midori/add_Result_Start [43])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<42>1  (
    .I0(\Midori/rounds_Output [42]),
    .I1(key_42_IBUF_216),
    .I2(key_106_IBUF_152),
    .O(output_42_OBUF_88)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<42>1  (
    .I0(input_42_IBUF_21),
    .I1(key_42_IBUF_216),
    .I2(key_106_IBUF_152),
    .O(\Midori/add_Result_Start [42])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<41>1  (
    .I0(\Midori/rounds_Output [41]),
    .I1(key_41_IBUF_217),
    .I2(key_105_IBUF_153),
    .O(output_41_OBUF_89)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<41>1  (
    .I0(input_41_IBUF_22),
    .I1(key_41_IBUF_217),
    .I2(key_105_IBUF_153),
    .O(\Midori/add_Result_Start [41])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<40>1  (
    .I0(\Midori/rounds_Output [40]),
    .I1(key_40_IBUF_218),
    .I2(key_104_IBUF_154),
    .O(output_40_OBUF_90)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<40>1  (
    .I0(input_40_IBUF_23),
    .I1(key_40_IBUF_218),
    .I2(key_104_IBUF_154),
    .O(\Midori/add_Result_Start [40])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<4>1  (
    .I0(\Midori/rounds_Output [4]),
    .I1(key_4_IBUF_254),
    .I2(key_68_IBUF_190),
    .O(output_4_OBUF_126)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<4>1  (
    .I0(input_4_IBUF_59),
    .I1(key_4_IBUF_254),
    .I2(key_68_IBUF_190),
    .O(\Midori/add_Result_Start [4])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<39>1  (
    .I0(key_103_IBUF_155),
    .I1(\Midori/rounds_Output [39]),
    .I2(key_39_IBUF_219),
    .O(output_39_OBUF_91)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<39>1  (
    .I0(key_103_IBUF_155),
    .I1(input_39_IBUF_24),
    .I2(key_39_IBUF_219),
    .O(\Midori/add_Result_Start [39])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<38>1  (
    .I0(key_102_IBUF_156),
    .I1(\Midori/rounds_Output [38]),
    .I2(key_38_IBUF_220),
    .O(output_38_OBUF_92)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<38>1  (
    .I0(key_102_IBUF_156),
    .I1(input_38_IBUF_25),
    .I2(key_38_IBUF_220),
    .O(\Midori/add_Result_Start [38])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<37>1  (
    .I0(key_101_IBUF_157),
    .I1(\Midori/rounds_Output [37]),
    .I2(key_37_IBUF_221),
    .O(output_37_OBUF_93)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<37>1  (
    .I0(key_101_IBUF_157),
    .I1(input_37_IBUF_26),
    .I2(key_37_IBUF_221),
    .O(\Midori/add_Result_Start [37])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<36>1  (
    .I0(key_100_IBUF_158),
    .I1(\Midori/rounds_Output [36]),
    .I2(key_36_IBUF_222),
    .O(output_36_OBUF_94)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<36>1  (
    .I0(key_100_IBUF_158),
    .I1(input_36_IBUF_27),
    .I2(key_36_IBUF_222),
    .O(\Midori/add_Result_Start [36])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<35>1  (
    .I0(\Midori/rounds_Output [35]),
    .I1(key_35_IBUF_223),
    .I2(key_99_IBUF_159),
    .O(output_35_OBUF_95)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<35>1  (
    .I0(input_35_IBUF_28),
    .I1(key_35_IBUF_223),
    .I2(key_99_IBUF_159),
    .O(\Midori/add_Result_Start [35])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<34>1  (
    .I0(\Midori/rounds_Output [34]),
    .I1(key_34_IBUF_224),
    .I2(key_98_IBUF_160),
    .O(output_34_OBUF_96)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<34>1  (
    .I0(input_34_IBUF_29),
    .I1(key_34_IBUF_224),
    .I2(key_98_IBUF_160),
    .O(\Midori/add_Result_Start [34])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<33>1  (
    .I0(\Midori/rounds_Output [33]),
    .I1(key_33_IBUF_225),
    .I2(key_97_IBUF_161),
    .O(output_33_OBUF_97)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<33>1  (
    .I0(input_33_IBUF_30),
    .I1(key_33_IBUF_225),
    .I2(key_97_IBUF_161),
    .O(\Midori/add_Result_Start [33])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<32>1  (
    .I0(\Midori/rounds_Output [32]),
    .I1(key_32_IBUF_226),
    .I2(key_96_IBUF_162),
    .O(output_32_OBUF_98)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<32>1  (
    .I0(input_32_IBUF_31),
    .I1(key_32_IBUF_226),
    .I2(key_96_IBUF_162),
    .O(\Midori/add_Result_Start [32])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<31>1  (
    .I0(\Midori/rounds_Output [31]),
    .I1(key_31_IBUF_227),
    .I2(key_95_IBUF_163),
    .O(output_31_OBUF_99)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<31>1  (
    .I0(input_31_IBUF_32),
    .I1(key_31_IBUF_227),
    .I2(key_95_IBUF_163),
    .O(\Midori/add_Result_Start [31])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<30>1  (
    .I0(\Midori/rounds_Output [30]),
    .I1(key_30_IBUF_228),
    .I2(key_94_IBUF_164),
    .O(output_30_OBUF_100)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<30>1  (
    .I0(input_30_IBUF_33),
    .I1(key_30_IBUF_228),
    .I2(key_94_IBUF_164),
    .O(\Midori/add_Result_Start [30])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<3>1  (
    .I0(\Midori/rounds_Output [3]),
    .I1(key_3_IBUF_255),
    .I2(key_67_IBUF_191),
    .O(output_3_OBUF_127)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<3>1  (
    .I0(input_3_IBUF_60),
    .I1(key_3_IBUF_255),
    .I2(key_67_IBUF_191),
    .O(\Midori/add_Result_Start [3])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<29>1  (
    .I0(key_93_IBUF_165),
    .I1(\Midori/rounds_Output [29]),
    .I2(key_29_IBUF_229),
    .O(output_29_OBUF_101)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<29>1  (
    .I0(key_93_IBUF_165),
    .I1(input_29_IBUF_34),
    .I2(key_29_IBUF_229),
    .O(\Midori/add_Result_Start [29])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<28>1  (
    .I0(key_92_IBUF_166),
    .I1(\Midori/rounds_Output [28]),
    .I2(key_28_IBUF_230),
    .O(output_28_OBUF_102)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<28>1  (
    .I0(key_92_IBUF_166),
    .I1(input_28_IBUF_35),
    .I2(key_28_IBUF_230),
    .O(\Midori/add_Result_Start [28])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<27>1  (
    .I0(key_91_IBUF_167),
    .I1(\Midori/rounds_Output [27]),
    .I2(key_27_IBUF_231),
    .O(output_27_OBUF_103)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<27>1  (
    .I0(key_91_IBUF_167),
    .I1(input_27_IBUF_36),
    .I2(key_27_IBUF_231),
    .O(\Midori/add_Result_Start [27])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<26>1  (
    .I0(key_90_IBUF_168),
    .I1(\Midori/rounds_Output [26]),
    .I2(key_26_IBUF_232),
    .O(output_26_OBUF_104)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<26>1  (
    .I0(key_90_IBUF_168),
    .I1(input_26_IBUF_37),
    .I2(key_26_IBUF_232),
    .O(\Midori/add_Result_Start [26])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<25>1  (
    .I0(\Midori/rounds_Output [25]),
    .I1(key_25_IBUF_233),
    .I2(key_89_IBUF_169),
    .O(output_25_OBUF_105)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<25>1  (
    .I0(input_25_IBUF_38),
    .I1(key_25_IBUF_233),
    .I2(key_89_IBUF_169),
    .O(\Midori/add_Result_Start [25])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<24>1  (
    .I0(\Midori/rounds_Output [24]),
    .I1(key_24_IBUF_234),
    .I2(key_88_IBUF_170),
    .O(output_24_OBUF_106)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<24>1  (
    .I0(input_24_IBUF_39),
    .I1(key_24_IBUF_234),
    .I2(key_88_IBUF_170),
    .O(\Midori/add_Result_Start [24])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<23>1  (
    .I0(\Midori/rounds_Output [23]),
    .I1(key_23_IBUF_235),
    .I2(key_87_IBUF_171),
    .O(output_23_OBUF_107)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<23>1  (
    .I0(input_23_IBUF_40),
    .I1(key_23_IBUF_235),
    .I2(key_87_IBUF_171),
    .O(\Midori/add_Result_Start [23])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<22>1  (
    .I0(\Midori/rounds_Output [22]),
    .I1(key_22_IBUF_236),
    .I2(key_86_IBUF_172),
    .O(output_22_OBUF_108)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<22>1  (
    .I0(input_22_IBUF_41),
    .I1(key_22_IBUF_236),
    .I2(key_86_IBUF_172),
    .O(\Midori/add_Result_Start [22])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<21>1  (
    .I0(\Midori/rounds_Output [21]),
    .I1(key_21_IBUF_237),
    .I2(key_85_IBUF_173),
    .O(output_21_OBUF_109)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<21>1  (
    .I0(input_21_IBUF_42),
    .I1(key_21_IBUF_237),
    .I2(key_85_IBUF_173),
    .O(\Midori/add_Result_Start [21])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<20>1  (
    .I0(\Midori/rounds_Output [20]),
    .I1(key_20_IBUF_238),
    .I2(key_84_IBUF_174),
    .O(output_20_OBUF_110)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<20>1  (
    .I0(input_20_IBUF_43),
    .I1(key_20_IBUF_238),
    .I2(key_84_IBUF_174),
    .O(\Midori/add_Result_Start [20])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<2>1  (
    .I0(\Midori/rounds_Output [2]),
    .I1(key_2_IBUF_256),
    .I2(key_66_IBUF_192),
    .O(output_2_OBUF_128)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<2>1  (
    .I0(input_2_IBUF_61),
    .I1(key_2_IBUF_256),
    .I2(key_66_IBUF_192),
    .O(\Midori/add_Result_Start [2])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<19>1  (
    .I0(key_83_IBUF_175),
    .I1(\Midori/rounds_Output [19]),
    .I2(key_19_IBUF_239),
    .O(output_19_OBUF_111)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<19>1  (
    .I0(key_83_IBUF_175),
    .I1(input_19_IBUF_44),
    .I2(key_19_IBUF_239),
    .O(\Midori/add_Result_Start [19])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<18>1  (
    .I0(key_82_IBUF_176),
    .I1(\Midori/rounds_Output [18]),
    .I2(key_18_IBUF_240),
    .O(output_18_OBUF_112)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<18>1  (
    .I0(key_82_IBUF_176),
    .I1(input_18_IBUF_45),
    .I2(key_18_IBUF_240),
    .O(\Midori/add_Result_Start [18])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<17>1  (
    .I0(key_81_IBUF_177),
    .I1(\Midori/rounds_Output [17]),
    .I2(key_17_IBUF_241),
    .O(output_17_OBUF_113)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<17>1  (
    .I0(key_81_IBUF_177),
    .I1(input_17_IBUF_46),
    .I2(key_17_IBUF_241),
    .O(\Midori/add_Result_Start [17])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<16>1  (
    .I0(key_80_IBUF_178),
    .I1(\Midori/rounds_Output [16]),
    .I2(key_16_IBUF_242),
    .O(output_16_OBUF_114)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<16>1  (
    .I0(key_80_IBUF_178),
    .I1(input_16_IBUF_47),
    .I2(key_16_IBUF_242),
    .O(\Midori/add_Result_Start [16])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<15>1  (
    .I0(\Midori/rounds_Output [15]),
    .I1(key_15_IBUF_243),
    .I2(key_79_IBUF_179),
    .O(output_15_OBUF_115)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<15>1  (
    .I0(input_15_IBUF_48),
    .I1(key_15_IBUF_243),
    .I2(key_79_IBUF_179),
    .O(\Midori/add_Result_Start [15])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<14>1  (
    .I0(\Midori/rounds_Output [14]),
    .I1(key_14_IBUF_244),
    .I2(key_78_IBUF_180),
    .O(output_14_OBUF_116)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<14>1  (
    .I0(input_14_IBUF_49),
    .I1(key_14_IBUF_244),
    .I2(key_78_IBUF_180),
    .O(\Midori/add_Result_Start [14])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<13>1  (
    .I0(\Midori/rounds_Output [13]),
    .I1(key_13_IBUF_245),
    .I2(key_77_IBUF_181),
    .O(output_13_OBUF_117)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<13>1  (
    .I0(input_13_IBUF_50),
    .I1(key_13_IBUF_245),
    .I2(key_77_IBUF_181),
    .O(\Midori/add_Result_Start [13])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<12>1  (
    .I0(\Midori/rounds_Output [12]),
    .I1(key_12_IBUF_246),
    .I2(key_76_IBUF_182),
    .O(output_12_OBUF_118)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<12>1  (
    .I0(input_12_IBUF_51),
    .I1(key_12_IBUF_246),
    .I2(key_76_IBUF_182),
    .O(\Midori/add_Result_Start [12])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<11>1  (
    .I0(\Midori/rounds_Output [11]),
    .I1(key_11_IBUF_247),
    .I2(key_75_IBUF_183),
    .O(output_11_OBUF_119)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<11>1  (
    .I0(input_11_IBUF_52),
    .I1(key_11_IBUF_247),
    .I2(key_75_IBUF_183),
    .O(\Midori/add_Result_Start [11])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<10>1  (
    .I0(\Midori/rounds_Output [10]),
    .I1(key_10_IBUF_248),
    .I2(key_74_IBUF_184),
    .O(output_10_OBUF_120)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<10>1  (
    .I0(input_10_IBUF_53),
    .I1(key_10_IBUF_248),
    .I2(key_74_IBUF_184),
    .O(\Midori/add_Result_Start [10])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<1>1  (
    .I0(\Midori/rounds_Output [1]),
    .I1(key_1_IBUF_257),
    .I2(key_65_IBUF_193),
    .O(output_1_OBUF_129)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<1>1  (
    .I0(input_1_IBUF_62),
    .I1(key_1_IBUF_257),
    .I2(key_65_IBUF_193),
    .O(\Midori/add_Result_Start [1])
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \output<0>1  (
    .I0(\Midori/rounds_Output [0]),
    .I1(key_0_IBUF_258),
    .I2(key_64_IBUF_194),
    .O(output_0_OBUF_130)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  \Midori/add_Result_Start<0>1  (
    .I0(input_0_IBUF_63),
    .I1(key_0_IBUF_258),
    .I2(key_64_IBUF_194),
    .O(\Midori/add_Result_Start [0])
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<8>_xo<0>1  (
    .I0(key_8_IBUF_250),
    .I1(key_72_IBUF_186),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant2 ),
    .O(\Midori/rounds/ProcessedKey[8] )
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<60>_xo<0>1  (
    .I0(key_60_IBUF_198),
    .I1(key_124_IBUF_134),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant15 ),
    .O(\Midori/rounds/ProcessedKey[60] )
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<4>_xo<0>1  (
    .I0(key_4_IBUF_254),
    .I1(key_68_IBUF_190),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant1 ),
    .O(\Midori/rounds/ProcessedKey[4] )
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<44>_xo<0>1  (
    .I0(key_44_IBUF_214),
    .I1(key_108_IBUF_150),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant11 ),
    .O(\Midori/rounds/ProcessedKey[44] )
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<32>_xo<0>1  (
    .I0(key_32_IBUF_226),
    .I1(key_96_IBUF_162),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant8 ),
    .O(\Midori/rounds/ProcessedKey[32] )
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<28>_xo<0>1  (
    .I0(key_28_IBUF_230),
    .I1(key_92_IBUF_166),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant7 ),
    .O(\Midori/rounds/ProcessedKey[28] )
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<24>_xo<0>1  (
    .I0(key_24_IBUF_234),
    .I1(key_88_IBUF_170),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant6 ),
    .O(\Midori/rounds/ProcessedKey[24] )
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<20>_xo<0>1  (
    .I0(key_20_IBUF_238),
    .I1(key_84_IBUF_174),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant5 ),
    .O(\Midori/rounds/ProcessedKey[20] )
  );
  LUT4 #(
    .INIT ( 16'h53AC ))
  \Midori/rounds/Mxor_ProcessedKey<12>_xo<0>1  (
    .I0(key_12_IBUF_246),
    .I1(key_76_IBUF_182),
    .I2(\controller/roundCounter/count [0]),
    .I3(\Midori/rounds/constant_MUX/Mram_roundConstant3 ),
    .O(\Midori/rounds/ProcessedKey[12] )
  );
  LUT5 #(
    .INIT ( 32'h30C34002 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant1111  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant11 )
  );
  LUT5 #(
    .INIT ( 32'h005A6186 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant151  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant15 )
  );
  LUT5 #(
    .INIT ( 32'h30DB1818 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant61  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant6 )
  );
  LUT5 #(
    .INIT ( 32'h003C93C9 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant51  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant5 )
  );
  LUT5 #(
    .INIT ( 32'h0F429C39 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant111  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant1 )
  );
  LUT5 #(
    .INIT ( 32'h3018C663 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant81  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant8 )
  );
  LUT5 #(
    .INIT ( 32'h0C4827E4 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant21  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [1]),
    .I2(\controller/roundCounter/count [3]),
    .I3(\controller/roundCounter/count [2]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant2 )
  );
  LUT5 #(
    .INIT ( 32'h36E7E427 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant71  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant7 )
  );
  LUT5 #(
    .INIT ( 32'h36660810 ))
  \Midori/rounds/constant_MUX/Mram_roundConstant31  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .O(\Midori/rounds/constant_MUX/Mram_roundConstant3 )
  );
  LUT4 #(
    .INIT ( 16'h4EE4 ))
  \Midori/rounds/mul_input_Inst/gen_mux[56].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(\Midori/rounds_Output [20]),
    .I2(\Midori/rounds_Output [56]),
    .I3(\Midori/rounds/ProcessedKey[56] ),
    .O(\Midori/rounds/mul_input [56])
  );
  LUT4 #(
    .INIT ( 16'h4EE4 ))
  \Midori/rounds/mul_input_Inst/gen_mux[16].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(\Midori/rounds_Output [36]),
    .I2(\Midori/rounds_Output [16]),
    .I3(\Midori/rounds/ProcessedKey[16] ),
    .O(\Midori/rounds/mul_input [16])
  );
  LUT4 #(
    .INIT ( 16'h4EE4 ))
  \Midori/rounds/mul_input_Inst/gen_mux[0].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(\Midori/rounds_Output [28]),
    .I2(\Midori/rounds_Output [0]),
    .I3(\Midori/rounds/ProcessedKey[0] ),
    .O(\Midori/rounds/mul_input [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[63].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_127_IBUF_131),
    .I2(key_63_IBUF_195),
    .O(\Midori/rounds/SelectedKey[63] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[62].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_126_IBUF_132),
    .I2(key_62_IBUF_196),
    .O(\Midori/rounds/SelectedKey[62] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[61].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_125_IBUF_133),
    .I2(key_61_IBUF_197),
    .O(\Midori/rounds/SelectedKey[61] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[59].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_123_IBUF_135),
    .I2(key_59_IBUF_199),
    .O(\Midori/rounds/SelectedKey[59] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[58].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_122_IBUF_136),
    .I2(key_58_IBUF_200),
    .O(\Midori/rounds/SelectedKey[58] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[57].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_121_IBUF_137),
    .I2(key_57_IBUF_201),
    .O(\Midori/rounds/SelectedKey[57] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[55].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_119_IBUF_139),
    .I2(key_55_IBUF_203),
    .O(\Midori/rounds/SelectedKey[55] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[54].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_118_IBUF_140),
    .I2(key_54_IBUF_204),
    .O(\Midori/rounds/SelectedKey[54] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[53].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_117_IBUF_141),
    .I2(key_53_IBUF_205),
    .O(\Midori/rounds/SelectedKey[53] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[51].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_115_IBUF_143),
    .I2(key_51_IBUF_207),
    .O(\Midori/rounds/SelectedKey[51] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[50].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_114_IBUF_144),
    .I2(key_50_IBUF_208),
    .O(\Midori/rounds/SelectedKey[50] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[49].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_113_IBUF_145),
    .I2(key_49_IBUF_209),
    .O(\Midori/rounds/SelectedKey[49] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[47].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_111_IBUF_147),
    .I2(key_47_IBUF_211),
    .O(\Midori/rounds/SelectedKey[47] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[46].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_110_IBUF_148),
    .I2(key_46_IBUF_212),
    .O(\Midori/rounds/SelectedKey[46] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[45].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_109_IBUF_149),
    .I2(key_45_IBUF_213),
    .O(\Midori/rounds/SelectedKey[45] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[43].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_107_IBUF_151),
    .I2(key_43_IBUF_215),
    .O(\Midori/rounds/SelectedKey[43] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[42].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_106_IBUF_152),
    .I2(key_42_IBUF_216),
    .O(\Midori/rounds/SelectedKey[42] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[41].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_105_IBUF_153),
    .I2(key_41_IBUF_217),
    .O(\Midori/rounds/SelectedKey[41] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[39].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_103_IBUF_155),
    .I2(key_39_IBUF_219),
    .O(\Midori/rounds/SelectedKey[39] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[38].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_102_IBUF_156),
    .I2(key_38_IBUF_220),
    .O(\Midori/rounds/SelectedKey[38] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[37].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_101_IBUF_157),
    .I2(key_37_IBUF_221),
    .O(\Midori/rounds/SelectedKey[37] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[35].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_99_IBUF_159),
    .I2(key_35_IBUF_223),
    .O(\Midori/rounds/SelectedKey[35] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[34].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_98_IBUF_160),
    .I2(key_34_IBUF_224),
    .O(\Midori/rounds/SelectedKey[34] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[33].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_97_IBUF_161),
    .I2(key_33_IBUF_225),
    .O(\Midori/rounds/SelectedKey[33] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[31].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_95_IBUF_163),
    .I2(key_31_IBUF_227),
    .O(\Midori/rounds/SelectedKey[31] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[30].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_94_IBUF_164),
    .I2(key_30_IBUF_228),
    .O(\Midori/rounds/SelectedKey[30] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[29].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_93_IBUF_165),
    .I2(key_29_IBUF_229),
    .O(\Midori/rounds/SelectedKey[29] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[27].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_91_IBUF_167),
    .I2(key_27_IBUF_231),
    .O(\Midori/rounds/SelectedKey[27] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[26].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_90_IBUF_168),
    .I2(key_26_IBUF_232),
    .O(\Midori/rounds/SelectedKey[26] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[25].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_89_IBUF_169),
    .I2(key_25_IBUF_233),
    .O(\Midori/rounds/SelectedKey[25] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[23].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_87_IBUF_171),
    .I2(key_23_IBUF_235),
    .O(\Midori/rounds/SelectedKey[23] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[22].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_86_IBUF_172),
    .I2(key_22_IBUF_236),
    .O(\Midori/rounds/SelectedKey[22] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[21].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_85_IBUF_173),
    .I2(key_21_IBUF_237),
    .O(\Midori/rounds/SelectedKey[21] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[19].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_83_IBUF_175),
    .I2(key_19_IBUF_239),
    .O(\Midori/rounds/SelectedKey[19] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[18].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_82_IBUF_176),
    .I2(key_18_IBUF_240),
    .O(\Midori/rounds/SelectedKey[18] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[17].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_81_IBUF_177),
    .I2(key_17_IBUF_241),
    .O(\Midori/rounds/SelectedKey[17] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[15].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_79_IBUF_179),
    .I2(key_15_IBUF_243),
    .O(\Midori/rounds/SelectedKey[15] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[14].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_78_IBUF_180),
    .I2(key_14_IBUF_244),
    .O(\Midori/rounds/SelectedKey[14] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[13].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_77_IBUF_181),
    .I2(key_13_IBUF_245),
    .O(\Midori/rounds/SelectedKey[13] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[11].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_75_IBUF_183),
    .I2(key_11_IBUF_247),
    .O(\Midori/rounds/SelectedKey[11] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[10].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_74_IBUF_184),
    .I2(key_10_IBUF_248),
    .O(\Midori/rounds/SelectedKey[10] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[9].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_73_IBUF_185),
    .I2(key_9_IBUF_249),
    .O(\Midori/rounds/SelectedKey[9] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[7].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_71_IBUF_187),
    .I2(key_7_IBUF_251),
    .O(\Midori/rounds/SelectedKey[7] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[6].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_70_IBUF_188),
    .I2(key_6_IBUF_252),
    .O(\Midori/rounds/SelectedKey[6] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[5].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_69_IBUF_189),
    .I2(key_5_IBUF_253),
    .O(\Midori/rounds/SelectedKey[5] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[3].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_67_IBUF_191),
    .I2(key_3_IBUF_255),
    .O(\Midori/rounds/SelectedKey[3] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[2].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_66_IBUF_192),
    .I2(key_2_IBUF_256),
    .O(\Midori/rounds/SelectedKey[2] )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \Midori/rounds/MUXInst/gen_mux[1].mux_inst/Mmux_Q11  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_65_IBUF_193),
    .I2(key_1_IBUF_257),
    .O(\Midori/rounds/SelectedKey[1] )
  );
  LUT4 #(
    .INIT ( 16'h9CC6 ))
  \Midori/rounds/Mxor_ProcessedKey<36>_xo<0>1  (
    .I0(enc_dec_IBUF_66),
    .I1(key_100_IBUF_158),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .O(\Midori/rounds/Mxor_ProcessedKey<36>_xo<0> )
  );
  LUT6 #(
    .INIT ( 64'hDD7D7D7D88282828 ))
  \Midori/rounds/Mxor_ProcessedKey<36>_xo<0>2  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_36_IBUF_222),
    .I2(\controller/roundCounter/count [1]),
    .I3(\controller/roundCounter/count [2]),
    .I4(\controller/roundCounter/count [3]),
    .I5(\Midori/rounds/Mxor_ProcessedKey<36>_xo<0> ),
    .O(\Midori/rounds/ProcessedKey[36] )
  );
  LUT4 #(
    .INIT ( 16'hC96C ))
  \Midori/rounds/Mxor_ProcessedKey<52>_xo<0>1  (
    .I0(enc_dec_IBUF_66),
    .I1(key_116_IBUF_142),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .O(\Midori/rounds/Mxor_ProcessedKey<52>_xo<0> )
  );
  LUT6 #(
    .INIT ( 64'hD7D77DD782822882 ))
  \Midori/rounds/Mxor_ProcessedKey<52>_xo<0>2  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_52_IBUF_206),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [3]),
    .I4(\controller/roundCounter/count [1]),
    .I5(\Midori/rounds/Mxor_ProcessedKey<52>_xo<0> ),
    .O(\Midori/rounds/ProcessedKey[52] )
  );
  LUT5 #(
    .INIT ( 32'hCCCC3963 ))
  \Midori/rounds/Mxor_ProcessedKey<48>_xo<0>1  (
    .I0(enc_dec_IBUF_66),
    .I1(key_48_IBUF_210),
    .I2(\controller/roundCounter/count [3]),
    .I3(\controller/roundCounter/count [2]),
    .I4(\controller/roundCounter/count [1]),
    .O(\Midori/rounds/Mxor_ProcessedKey<48>_xo<0> )
  );
  LUT6 #(
    .INIT ( 64'hBEBBBBEB14111141 ))
  \Midori/rounds/Mxor_ProcessedKey<48>_xo<0>2  (
    .I0(\controller/roundCounter/count [0]),
    .I1(key_112_IBUF_146),
    .I2(\controller/roundCounter/count [1]),
    .I3(enc_dec_IBUF_66),
    .I4(\controller/roundCounter/count [3]),
    .I5(\Midori/rounds/Mxor_ProcessedKey<48>_xo<0> ),
    .O(\Midori/rounds/ProcessedKey[48] )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \Midori/rounds/Mxor_ProcessedKey<40>_xo<0>_SW0  (
    .I0(key_104_IBUF_154),
    .I1(\controller/roundCounter/count [2]),
    .O(N9)
  );
  LUT6 #(
    .INIT ( 64'hAAAA033FAAAAFCC0 ))
  \Midori/rounds/Mxor_ProcessedKey<40>_xo<0>  (
    .I0(key_40_IBUF_218),
    .I1(enc_dec_IBUF_66),
    .I2(\controller/roundCounter/count [3]),
    .I3(\controller/roundCounter/count [1]),
    .I4(\controller/roundCounter/count [0]),
    .I5(N9),
    .O(\Midori/rounds/ProcessedKey[40] )
  );
  IBUF   input_63_IBUF (
    .I(input_0[63]),
    .O(input_63_IBUF_0)
  );
  IBUF   input_62_IBUF (
    .I(input_0[62]),
    .O(input_62_IBUF_1)
  );
  IBUF   input_61_IBUF (
    .I(input_0[61]),
    .O(input_61_IBUF_2)
  );
  IBUF   input_60_IBUF (
    .I(input_0[60]),
    .O(input_60_IBUF_3)
  );
  IBUF   input_59_IBUF (
    .I(input_0[59]),
    .O(input_59_IBUF_4)
  );
  IBUF   input_58_IBUF (
    .I(input_0[58]),
    .O(input_58_IBUF_5)
  );
  IBUF   input_57_IBUF (
    .I(input_0[57]),
    .O(input_57_IBUF_6)
  );
  IBUF   input_56_IBUF (
    .I(input_0[56]),
    .O(input_56_IBUF_7)
  );
  IBUF   input_55_IBUF (
    .I(input_0[55]),
    .O(input_55_IBUF_8)
  );
  IBUF   input_54_IBUF (
    .I(input_0[54]),
    .O(input_54_IBUF_9)
  );
  IBUF   input_53_IBUF (
    .I(input_0[53]),
    .O(input_53_IBUF_10)
  );
  IBUF   input_52_IBUF (
    .I(input_0[52]),
    .O(input_52_IBUF_11)
  );
  IBUF   input_51_IBUF (
    .I(input_0[51]),
    .O(input_51_IBUF_12)
  );
  IBUF   input_50_IBUF (
    .I(input_0[50]),
    .O(input_50_IBUF_13)
  );
  IBUF   input_49_IBUF (
    .I(input_0[49]),
    .O(input_49_IBUF_14)
  );
  IBUF   input_48_IBUF (
    .I(input_0[48]),
    .O(input_48_IBUF_15)
  );
  IBUF   input_47_IBUF (
    .I(input_0[47]),
    .O(input_47_IBUF_16)
  );
  IBUF   input_46_IBUF (
    .I(input_0[46]),
    .O(input_46_IBUF_17)
  );
  IBUF   input_45_IBUF (
    .I(input_0[45]),
    .O(input_45_IBUF_18)
  );
  IBUF   input_44_IBUF (
    .I(input_0[44]),
    .O(input_44_IBUF_19)
  );
  IBUF   input_43_IBUF (
    .I(input_0[43]),
    .O(input_43_IBUF_20)
  );
  IBUF   input_42_IBUF (
    .I(input_0[42]),
    .O(input_42_IBUF_21)
  );
  IBUF   input_41_IBUF (
    .I(input_0[41]),
    .O(input_41_IBUF_22)
  );
  IBUF   input_40_IBUF (
    .I(input_0[40]),
    .O(input_40_IBUF_23)
  );
  IBUF   input_39_IBUF (
    .I(input_0[39]),
    .O(input_39_IBUF_24)
  );
  IBUF   input_38_IBUF (
    .I(input_0[38]),
    .O(input_38_IBUF_25)
  );
  IBUF   input_37_IBUF (
    .I(input_0[37]),
    .O(input_37_IBUF_26)
  );
  IBUF   input_36_IBUF (
    .I(input_0[36]),
    .O(input_36_IBUF_27)
  );
  IBUF   input_35_IBUF (
    .I(input_0[35]),
    .O(input_35_IBUF_28)
  );
  IBUF   input_34_IBUF (
    .I(input_0[34]),
    .O(input_34_IBUF_29)
  );
  IBUF   input_33_IBUF (
    .I(input_0[33]),
    .O(input_33_IBUF_30)
  );
  IBUF   input_32_IBUF (
    .I(input_0[32]),
    .O(input_32_IBUF_31)
  );
  IBUF   input_31_IBUF (
    .I(input_0[31]),
    .O(input_31_IBUF_32)
  );
  IBUF   input_30_IBUF (
    .I(input_0[30]),
    .O(input_30_IBUF_33)
  );
  IBUF   input_29_IBUF (
    .I(input_0[29]),
    .O(input_29_IBUF_34)
  );
  IBUF   input_28_IBUF (
    .I(input_0[28]),
    .O(input_28_IBUF_35)
  );
  IBUF   input_27_IBUF (
    .I(input_0[27]),
    .O(input_27_IBUF_36)
  );
  IBUF   input_26_IBUF (
    .I(input_0[26]),
    .O(input_26_IBUF_37)
  );
  IBUF   input_25_IBUF (
    .I(input_0[25]),
    .O(input_25_IBUF_38)
  );
  IBUF   input_24_IBUF (
    .I(input_0[24]),
    .O(input_24_IBUF_39)
  );
  IBUF   input_23_IBUF (
    .I(input_0[23]),
    .O(input_23_IBUF_40)
  );
  IBUF   input_22_IBUF (
    .I(input_0[22]),
    .O(input_22_IBUF_41)
  );
  IBUF   input_21_IBUF (
    .I(input_0[21]),
    .O(input_21_IBUF_42)
  );
  IBUF   input_20_IBUF (
    .I(input_0[20]),
    .O(input_20_IBUF_43)
  );
  IBUF   input_19_IBUF (
    .I(input_0[19]),
    .O(input_19_IBUF_44)
  );
  IBUF   input_18_IBUF (
    .I(input_0[18]),
    .O(input_18_IBUF_45)
  );
  IBUF   input_17_IBUF (
    .I(input_0[17]),
    .O(input_17_IBUF_46)
  );
  IBUF   input_16_IBUF (
    .I(input_0[16]),
    .O(input_16_IBUF_47)
  );
  IBUF   input_15_IBUF (
    .I(input_0[15]),
    .O(input_15_IBUF_48)
  );
  IBUF   input_14_IBUF (
    .I(input_0[14]),
    .O(input_14_IBUF_49)
  );
  IBUF   input_13_IBUF (
    .I(input_0[13]),
    .O(input_13_IBUF_50)
  );
  IBUF   input_12_IBUF (
    .I(input_0[12]),
    .O(input_12_IBUF_51)
  );
  IBUF   input_11_IBUF (
    .I(input_0[11]),
    .O(input_11_IBUF_52)
  );
  IBUF   input_10_IBUF (
    .I(input_0[10]),
    .O(input_10_IBUF_53)
  );
  IBUF   input_9_IBUF (
    .I(input_0[9]),
    .O(input_9_IBUF_54)
  );
  IBUF   input_8_IBUF (
    .I(input_0[8]),
    .O(input_8_IBUF_55)
  );
  IBUF   input_7_IBUF (
    .I(input_0[7]),
    .O(input_7_IBUF_56)
  );
  IBUF   input_6_IBUF (
    .I(input_0[6]),
    .O(input_6_IBUF_57)
  );
  IBUF   input_5_IBUF (
    .I(input_0[5]),
    .O(input_5_IBUF_58)
  );
  IBUF   input_4_IBUF (
    .I(input_0[4]),
    .O(input_4_IBUF_59)
  );
  IBUF   input_3_IBUF (
    .I(input_0[3]),
    .O(input_3_IBUF_60)
  );
  IBUF   input_2_IBUF (
    .I(input_0[2]),
    .O(input_2_IBUF_61)
  );
  IBUF   input_1_IBUF (
    .I(input_0[1]),
    .O(input_1_IBUF_62)
  );
  IBUF   input_0_IBUF (
    .I(input_0[0]),
    .O(input_0_IBUF_63)
  );
  IBUF   key_127_IBUF (
    .I(key[127]),
    .O(key_127_IBUF_131)
  );
  IBUF   key_126_IBUF (
    .I(key[126]),
    .O(key_126_IBUF_132)
  );
  IBUF   key_125_IBUF (
    .I(key[125]),
    .O(key_125_IBUF_133)
  );
  IBUF   key_124_IBUF (
    .I(key[124]),
    .O(key_124_IBUF_134)
  );
  IBUF   key_123_IBUF (
    .I(key[123]),
    .O(key_123_IBUF_135)
  );
  IBUF   key_122_IBUF (
    .I(key[122]),
    .O(key_122_IBUF_136)
  );
  IBUF   key_121_IBUF (
    .I(key[121]),
    .O(key_121_IBUF_137)
  );
  IBUF   key_120_IBUF (
    .I(key[120]),
    .O(key_120_IBUF_138)
  );
  IBUF   key_119_IBUF (
    .I(key[119]),
    .O(key_119_IBUF_139)
  );
  IBUF   key_118_IBUF (
    .I(key[118]),
    .O(key_118_IBUF_140)
  );
  IBUF   key_117_IBUF (
    .I(key[117]),
    .O(key_117_IBUF_141)
  );
  IBUF   key_116_IBUF (
    .I(key[116]),
    .O(key_116_IBUF_142)
  );
  IBUF   key_115_IBUF (
    .I(key[115]),
    .O(key_115_IBUF_143)
  );
  IBUF   key_114_IBUF (
    .I(key[114]),
    .O(key_114_IBUF_144)
  );
  IBUF   key_113_IBUF (
    .I(key[113]),
    .O(key_113_IBUF_145)
  );
  IBUF   key_112_IBUF (
    .I(key[112]),
    .O(key_112_IBUF_146)
  );
  IBUF   key_111_IBUF (
    .I(key[111]),
    .O(key_111_IBUF_147)
  );
  IBUF   key_110_IBUF (
    .I(key[110]),
    .O(key_110_IBUF_148)
  );
  IBUF   key_109_IBUF (
    .I(key[109]),
    .O(key_109_IBUF_149)
  );
  IBUF   key_108_IBUF (
    .I(key[108]),
    .O(key_108_IBUF_150)
  );
  IBUF   key_107_IBUF (
    .I(key[107]),
    .O(key_107_IBUF_151)
  );
  IBUF   key_106_IBUF (
    .I(key[106]),
    .O(key_106_IBUF_152)
  );
  IBUF   key_105_IBUF (
    .I(key[105]),
    .O(key_105_IBUF_153)
  );
  IBUF   key_104_IBUF (
    .I(key[104]),
    .O(key_104_IBUF_154)
  );
  IBUF   key_103_IBUF (
    .I(key[103]),
    .O(key_103_IBUF_155)
  );
  IBUF   key_102_IBUF (
    .I(key[102]),
    .O(key_102_IBUF_156)
  );
  IBUF   key_101_IBUF (
    .I(key[101]),
    .O(key_101_IBUF_157)
  );
  IBUF   key_100_IBUF (
    .I(key[100]),
    .O(key_100_IBUF_158)
  );
  IBUF   key_99_IBUF (
    .I(key[99]),
    .O(key_99_IBUF_159)
  );
  IBUF   key_98_IBUF (
    .I(key[98]),
    .O(key_98_IBUF_160)
  );
  IBUF   key_97_IBUF (
    .I(key[97]),
    .O(key_97_IBUF_161)
  );
  IBUF   key_96_IBUF (
    .I(key[96]),
    .O(key_96_IBUF_162)
  );
  IBUF   key_95_IBUF (
    .I(key[95]),
    .O(key_95_IBUF_163)
  );
  IBUF   key_94_IBUF (
    .I(key[94]),
    .O(key_94_IBUF_164)
  );
  IBUF   key_93_IBUF (
    .I(key[93]),
    .O(key_93_IBUF_165)
  );
  IBUF   key_92_IBUF (
    .I(key[92]),
    .O(key_92_IBUF_166)
  );
  IBUF   key_91_IBUF (
    .I(key[91]),
    .O(key_91_IBUF_167)
  );
  IBUF   key_90_IBUF (
    .I(key[90]),
    .O(key_90_IBUF_168)
  );
  IBUF   key_89_IBUF (
    .I(key[89]),
    .O(key_89_IBUF_169)
  );
  IBUF   key_88_IBUF (
    .I(key[88]),
    .O(key_88_IBUF_170)
  );
  IBUF   key_87_IBUF (
    .I(key[87]),
    .O(key_87_IBUF_171)
  );
  IBUF   key_86_IBUF (
    .I(key[86]),
    .O(key_86_IBUF_172)
  );
  IBUF   key_85_IBUF (
    .I(key[85]),
    .O(key_85_IBUF_173)
  );
  IBUF   key_84_IBUF (
    .I(key[84]),
    .O(key_84_IBUF_174)
  );
  IBUF   key_83_IBUF (
    .I(key[83]),
    .O(key_83_IBUF_175)
  );
  IBUF   key_82_IBUF (
    .I(key[82]),
    .O(key_82_IBUF_176)
  );
  IBUF   key_81_IBUF (
    .I(key[81]),
    .O(key_81_IBUF_177)
  );
  IBUF   key_80_IBUF (
    .I(key[80]),
    .O(key_80_IBUF_178)
  );
  IBUF   key_79_IBUF (
    .I(key[79]),
    .O(key_79_IBUF_179)
  );
  IBUF   key_78_IBUF (
    .I(key[78]),
    .O(key_78_IBUF_180)
  );
  IBUF   key_77_IBUF (
    .I(key[77]),
    .O(key_77_IBUF_181)
  );
  IBUF   key_76_IBUF (
    .I(key[76]),
    .O(key_76_IBUF_182)
  );
  IBUF   key_75_IBUF (
    .I(key[75]),
    .O(key_75_IBUF_183)
  );
  IBUF   key_74_IBUF (
    .I(key[74]),
    .O(key_74_IBUF_184)
  );
  IBUF   key_73_IBUF (
    .I(key[73]),
    .O(key_73_IBUF_185)
  );
  IBUF   key_72_IBUF (
    .I(key[72]),
    .O(key_72_IBUF_186)
  );
  IBUF   key_71_IBUF (
    .I(key[71]),
    .O(key_71_IBUF_187)
  );
  IBUF   key_70_IBUF (
    .I(key[70]),
    .O(key_70_IBUF_188)
  );
  IBUF   key_69_IBUF (
    .I(key[69]),
    .O(key_69_IBUF_189)
  );
  IBUF   key_68_IBUF (
    .I(key[68]),
    .O(key_68_IBUF_190)
  );
  IBUF   key_67_IBUF (
    .I(key[67]),
    .O(key_67_IBUF_191)
  );
  IBUF   key_66_IBUF (
    .I(key[66]),
    .O(key_66_IBUF_192)
  );
  IBUF   key_65_IBUF (
    .I(key[65]),
    .O(key_65_IBUF_193)
  );
  IBUF   key_64_IBUF (
    .I(key[64]),
    .O(key_64_IBUF_194)
  );
  IBUF   key_63_IBUF (
    .I(key[63]),
    .O(key_63_IBUF_195)
  );
  IBUF   key_62_IBUF (
    .I(key[62]),
    .O(key_62_IBUF_196)
  );
  IBUF   key_61_IBUF (
    .I(key[61]),
    .O(key_61_IBUF_197)
  );
  IBUF   key_60_IBUF (
    .I(key[60]),
    .O(key_60_IBUF_198)
  );
  IBUF   key_59_IBUF (
    .I(key[59]),
    .O(key_59_IBUF_199)
  );
  IBUF   key_58_IBUF (
    .I(key[58]),
    .O(key_58_IBUF_200)
  );
  IBUF   key_57_IBUF (
    .I(key[57]),
    .O(key_57_IBUF_201)
  );
  IBUF   key_56_IBUF (
    .I(key[56]),
    .O(key_56_IBUF_202)
  );
  IBUF   key_55_IBUF (
    .I(key[55]),
    .O(key_55_IBUF_203)
  );
  IBUF   key_54_IBUF (
    .I(key[54]),
    .O(key_54_IBUF_204)
  );
  IBUF   key_53_IBUF (
    .I(key[53]),
    .O(key_53_IBUF_205)
  );
  IBUF   key_52_IBUF (
    .I(key[52]),
    .O(key_52_IBUF_206)
  );
  IBUF   key_51_IBUF (
    .I(key[51]),
    .O(key_51_IBUF_207)
  );
  IBUF   key_50_IBUF (
    .I(key[50]),
    .O(key_50_IBUF_208)
  );
  IBUF   key_49_IBUF (
    .I(key[49]),
    .O(key_49_IBUF_209)
  );
  IBUF   key_48_IBUF (
    .I(key[48]),
    .O(key_48_IBUF_210)
  );
  IBUF   key_47_IBUF (
    .I(key[47]),
    .O(key_47_IBUF_211)
  );
  IBUF   key_46_IBUF (
    .I(key[46]),
    .O(key_46_IBUF_212)
  );
  IBUF   key_45_IBUF (
    .I(key[45]),
    .O(key_45_IBUF_213)
  );
  IBUF   key_44_IBUF (
    .I(key[44]),
    .O(key_44_IBUF_214)
  );
  IBUF   key_43_IBUF (
    .I(key[43]),
    .O(key_43_IBUF_215)
  );
  IBUF   key_42_IBUF (
    .I(key[42]),
    .O(key_42_IBUF_216)
  );
  IBUF   key_41_IBUF (
    .I(key[41]),
    .O(key_41_IBUF_217)
  );
  IBUF   key_40_IBUF (
    .I(key[40]),
    .O(key_40_IBUF_218)
  );
  IBUF   key_39_IBUF (
    .I(key[39]),
    .O(key_39_IBUF_219)
  );
  IBUF   key_38_IBUF (
    .I(key[38]),
    .O(key_38_IBUF_220)
  );
  IBUF   key_37_IBUF (
    .I(key[37]),
    .O(key_37_IBUF_221)
  );
  IBUF   key_36_IBUF (
    .I(key[36]),
    .O(key_36_IBUF_222)
  );
  IBUF   key_35_IBUF (
    .I(key[35]),
    .O(key_35_IBUF_223)
  );
  IBUF   key_34_IBUF (
    .I(key[34]),
    .O(key_34_IBUF_224)
  );
  IBUF   key_33_IBUF (
    .I(key[33]),
    .O(key_33_IBUF_225)
  );
  IBUF   key_32_IBUF (
    .I(key[32]),
    .O(key_32_IBUF_226)
  );
  IBUF   key_31_IBUF (
    .I(key[31]),
    .O(key_31_IBUF_227)
  );
  IBUF   key_30_IBUF (
    .I(key[30]),
    .O(key_30_IBUF_228)
  );
  IBUF   key_29_IBUF (
    .I(key[29]),
    .O(key_29_IBUF_229)
  );
  IBUF   key_28_IBUF (
    .I(key[28]),
    .O(key_28_IBUF_230)
  );
  IBUF   key_27_IBUF (
    .I(key[27]),
    .O(key_27_IBUF_231)
  );
  IBUF   key_26_IBUF (
    .I(key[26]),
    .O(key_26_IBUF_232)
  );
  IBUF   key_25_IBUF (
    .I(key[25]),
    .O(key_25_IBUF_233)
  );
  IBUF   key_24_IBUF (
    .I(key[24]),
    .O(key_24_IBUF_234)
  );
  IBUF   key_23_IBUF (
    .I(key[23]),
    .O(key_23_IBUF_235)
  );
  IBUF   key_22_IBUF (
    .I(key[22]),
    .O(key_22_IBUF_236)
  );
  IBUF   key_21_IBUF (
    .I(key[21]),
    .O(key_21_IBUF_237)
  );
  IBUF   key_20_IBUF (
    .I(key[20]),
    .O(key_20_IBUF_238)
  );
  IBUF   key_19_IBUF (
    .I(key[19]),
    .O(key_19_IBUF_239)
  );
  IBUF   key_18_IBUF (
    .I(key[18]),
    .O(key_18_IBUF_240)
  );
  IBUF   key_17_IBUF (
    .I(key[17]),
    .O(key_17_IBUF_241)
  );
  IBUF   key_16_IBUF (
    .I(key[16]),
    .O(key_16_IBUF_242)
  );
  IBUF   key_15_IBUF (
    .I(key[15]),
    .O(key_15_IBUF_243)
  );
  IBUF   key_14_IBUF (
    .I(key[14]),
    .O(key_14_IBUF_244)
  );
  IBUF   key_13_IBUF (
    .I(key[13]),
    .O(key_13_IBUF_245)
  );
  IBUF   key_12_IBUF (
    .I(key[12]),
    .O(key_12_IBUF_246)
  );
  IBUF   key_11_IBUF (
    .I(key[11]),
    .O(key_11_IBUF_247)
  );
  IBUF   key_10_IBUF (
    .I(key[10]),
    .O(key_10_IBUF_248)
  );
  IBUF   key_9_IBUF (
    .I(key[9]),
    .O(key_9_IBUF_249)
  );
  IBUF   key_8_IBUF (
    .I(key[8]),
    .O(key_8_IBUF_250)
  );
  IBUF   key_7_IBUF (
    .I(key[7]),
    .O(key_7_IBUF_251)
  );
  IBUF   key_6_IBUF (
    .I(key[6]),
    .O(key_6_IBUF_252)
  );
  IBUF   key_5_IBUF (
    .I(key[5]),
    .O(key_5_IBUF_253)
  );
  IBUF   key_4_IBUF (
    .I(key[4]),
    .O(key_4_IBUF_254)
  );
  IBUF   key_3_IBUF (
    .I(key[3]),
    .O(key_3_IBUF_255)
  );
  IBUF   key_2_IBUF (
    .I(key[2]),
    .O(key_2_IBUF_256)
  );
  IBUF   key_1_IBUF (
    .I(key[1]),
    .O(key_1_IBUF_257)
  );
  IBUF   key_0_IBUF (
    .I(key[0]),
    .O(key_0_IBUF_258)
  );
  IBUF   reset_IBUF (
    .I(reset),
    .O(reset_IBUF_65)
  );
  IBUF   enc_dec_IBUF (
    .I(enc_dec),
    .O(enc_dec_IBUF_66)
  );
  OBUF   output_63_OBUF (
    .I(output_63_OBUF_67),
    .O(output_1[63])
  );
  OBUF   output_62_OBUF (
    .I(output_62_OBUF_68),
    .O(output_1[62])
  );
  OBUF   output_61_OBUF (
    .I(output_61_OBUF_69),
    .O(output_1[61])
  );
  OBUF   output_60_OBUF (
    .I(output_60_OBUF_70),
    .O(output_1[60])
  );
  OBUF   output_59_OBUF (
    .I(output_59_OBUF_71),
    .O(output_1[59])
  );
  OBUF   output_58_OBUF (
    .I(output_58_OBUF_72),
    .O(output_1[58])
  );
  OBUF   output_57_OBUF (
    .I(output_57_OBUF_73),
    .O(output_1[57])
  );
  OBUF   output_56_OBUF (
    .I(output_56_OBUF_74),
    .O(output_1[56])
  );
  OBUF   output_55_OBUF (
    .I(output_55_OBUF_75),
    .O(output_1[55])
  );
  OBUF   output_54_OBUF (
    .I(output_54_OBUF_76),
    .O(output_1[54])
  );
  OBUF   output_53_OBUF (
    .I(output_53_OBUF_77),
    .O(output_1[53])
  );
  OBUF   output_52_OBUF (
    .I(output_52_OBUF_78),
    .O(output_1[52])
  );
  OBUF   output_51_OBUF (
    .I(output_51_OBUF_79),
    .O(output_1[51])
  );
  OBUF   output_50_OBUF (
    .I(output_50_OBUF_80),
    .O(output_1[50])
  );
  OBUF   output_49_OBUF (
    .I(output_49_OBUF_81),
    .O(output_1[49])
  );
  OBUF   output_48_OBUF (
    .I(output_48_OBUF_82),
    .O(output_1[48])
  );
  OBUF   output_47_OBUF (
    .I(output_47_OBUF_83),
    .O(output_1[47])
  );
  OBUF   output_46_OBUF (
    .I(output_46_OBUF_84),
    .O(output_1[46])
  );
  OBUF   output_45_OBUF (
    .I(output_45_OBUF_85),
    .O(output_1[45])
  );
  OBUF   output_44_OBUF (
    .I(output_44_OBUF_86),
    .O(output_1[44])
  );
  OBUF   output_43_OBUF (
    .I(output_43_OBUF_87),
    .O(output_1[43])
  );
  OBUF   output_42_OBUF (
    .I(output_42_OBUF_88),
    .O(output_1[42])
  );
  OBUF   output_41_OBUF (
    .I(output_41_OBUF_89),
    .O(output_1[41])
  );
  OBUF   output_40_OBUF (
    .I(output_40_OBUF_90),
    .O(output_1[40])
  );
  OBUF   output_39_OBUF (
    .I(output_39_OBUF_91),
    .O(output_1[39])
  );
  OBUF   output_38_OBUF (
    .I(output_38_OBUF_92),
    .O(output_1[38])
  );
  OBUF   output_37_OBUF (
    .I(output_37_OBUF_93),
    .O(output_1[37])
  );
  OBUF   output_36_OBUF (
    .I(output_36_OBUF_94),
    .O(output_1[36])
  );
  OBUF   output_35_OBUF (
    .I(output_35_OBUF_95),
    .O(output_1[35])
  );
  OBUF   output_34_OBUF (
    .I(output_34_OBUF_96),
    .O(output_1[34])
  );
  OBUF   output_33_OBUF (
    .I(output_33_OBUF_97),
    .O(output_1[33])
  );
  OBUF   output_32_OBUF (
    .I(output_32_OBUF_98),
    .O(output_1[32])
  );
  OBUF   output_31_OBUF (
    .I(output_31_OBUF_99),
    .O(output_1[31])
  );
  OBUF   output_30_OBUF (
    .I(output_30_OBUF_100),
    .O(output_1[30])
  );
  OBUF   output_29_OBUF (
    .I(output_29_OBUF_101),
    .O(output_1[29])
  );
  OBUF   output_28_OBUF (
    .I(output_28_OBUF_102),
    .O(output_1[28])
  );
  OBUF   output_27_OBUF (
    .I(output_27_OBUF_103),
    .O(output_1[27])
  );
  OBUF   output_26_OBUF (
    .I(output_26_OBUF_104),
    .O(output_1[26])
  );
  OBUF   output_25_OBUF (
    .I(output_25_OBUF_105),
    .O(output_1[25])
  );
  OBUF   output_24_OBUF (
    .I(output_24_OBUF_106),
    .O(output_1[24])
  );
  OBUF   output_23_OBUF (
    .I(output_23_OBUF_107),
    .O(output_1[23])
  );
  OBUF   output_22_OBUF (
    .I(output_22_OBUF_108),
    .O(output_1[22])
  );
  OBUF   output_21_OBUF (
    .I(output_21_OBUF_109),
    .O(output_1[21])
  );
  OBUF   output_20_OBUF (
    .I(output_20_OBUF_110),
    .O(output_1[20])
  );
  OBUF   output_19_OBUF (
    .I(output_19_OBUF_111),
    .O(output_1[19])
  );
  OBUF   output_18_OBUF (
    .I(output_18_OBUF_112),
    .O(output_1[18])
  );
  OBUF   output_17_OBUF (
    .I(output_17_OBUF_113),
    .O(output_1[17])
  );
  OBUF   output_16_OBUF (
    .I(output_16_OBUF_114),
    .O(output_1[16])
  );
  OBUF   output_15_OBUF (
    .I(output_15_OBUF_115),
    .O(output_1[15])
  );
  OBUF   output_14_OBUF (
    .I(output_14_OBUF_116),
    .O(output_1[14])
  );
  OBUF   output_13_OBUF (
    .I(output_13_OBUF_117),
    .O(output_1[13])
  );
  OBUF   output_12_OBUF (
    .I(output_12_OBUF_118),
    .O(output_1[12])
  );
  OBUF   output_11_OBUF (
    .I(output_11_OBUF_119),
    .O(output_1[11])
  );
  OBUF   output_10_OBUF (
    .I(output_10_OBUF_120),
    .O(output_1[10])
  );
  OBUF   output_9_OBUF (
    .I(output_9_OBUF_121),
    .O(output_1[9])
  );
  OBUF   output_8_OBUF (
    .I(output_8_OBUF_122),
    .O(output_1[8])
  );
  OBUF   output_7_OBUF (
    .I(output_7_OBUF_123),
    .O(output_1[7])
  );
  OBUF   output_6_OBUF (
    .I(output_6_OBUF_124),
    .O(output_1[6])
  );
  OBUF   output_5_OBUF (
    .I(output_5_OBUF_125),
    .O(output_1[5])
  );
  OBUF   output_4_OBUF (
    .I(output_4_OBUF_126),
    .O(output_1[4])
  );
  OBUF   output_3_OBUF (
    .I(output_3_OBUF_127),
    .O(output_1[3])
  );
  OBUF   output_2_OBUF (
    .I(output_2_OBUF_128),
    .O(output_1[2])
  );
  OBUF   output_1_OBUF (
    .I(output_1_OBUF_129),
    .O(output_1[1])
  );
  OBUF   output_0_OBUF (
    .I(output_0_OBUF_130),
    .O(output_1[0])
  );
  OBUF   done_OBUF (
    .I(done_OBUF_259),
    .O(done)
  );
  LUT6 #(
    .INIT ( 64'hAFCF50305F3FA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[60].mux_inst/Mmux_Q11  (
    .I0(key_60_IBUF_198),
    .I1(key_124_IBUF_134),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [60]),
    .I5(\Midori/rounds/constant_MUX/Mram_roundConstant15 ),
    .O(\Midori/rounds/mul_input [60])
  );
  LUT6 #(
    .INIT ( 64'hAFCF50305F3FA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[8].mux_inst/Mmux_Q11  (
    .I0(key_8_IBUF_250),
    .I1(key_72_IBUF_186),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [8]),
    .I5(\Midori/rounds/constant_MUX/Mram_roundConstant2 ),
    .O(\Midori/rounds/mul_input [8])
  );
  LUT3 #(
    .INIT ( 8'hA6 ))
  \Midori/rounds/Mxor_ProcessedKey<48>_xo<0>2_SW0  (
    .I0(key_112_IBUF_146),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [1]),
    .O(N111)
  );
  LUT6 #(
    .INIT ( 64'h75FD20A8DF578A02 ))
  \Midori/rounds/mul_input_Inst/gen_mux[48].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [0]),
    .I2(N111),
    .I3(\Midori/rounds/Mxor_ProcessedKey<48>_xo<0> ),
    .I4(\Midori/rounds_Output [0]),
    .I5(\Midori/rounds_Output [48]),
    .O(\Midori/rounds/mul_input [48])
  );
  LUT4 #(
    .INIT ( 16'hA569 ))
  \Midori/rounds/Mxor_ProcessedKey<52>_xo<0>2_SW0  (
    .I0(key_52_IBUF_206),
    .I1(\controller/roundCounter/count [3]),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .O(N13)
  );
  LUT6 #(
    .INIT ( 64'h57DF028AFD75A820 ))
  \Midori/rounds/mul_input_Inst/gen_mux[52].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [0]),
    .I2(\Midori/rounds/Mxor_ProcessedKey<52>_xo<0> ),
    .I3(N13),
    .I4(\Midori/rounds_Output [40]),
    .I5(\Midori/rounds_Output [52]),
    .O(\Midori/rounds/mul_input [52])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Midori/rounds/Mxor_ProcessedKey<44>_xo<0>1_SW0  (
    .I0(key_44_IBUF_214),
    .I1(key_108_IBUF_150),
    .I2(\controller/roundCounter/count [0]),
    .O(N15)
  );
  LUT5 #(
    .INIT ( 32'hD87272D8 ))
  \Midori/rounds/mul_input_Inst/gen_mux[44].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(N15),
    .I2(\Midori/rounds_Output [4]),
    .I3(\Midori/rounds_Output [44]),
    .I4(\Midori/rounds/constant_MUX/Mram_roundConstant11 ),
    .O(\Midori/rounds/mul_input [44])
  );
  LUT4 #(
    .INIT ( 16'hA666 ))
  \Midori/rounds/Mxor_ProcessedKey<36>_xo<0>2_SW0  (
    .I0(key_36_IBUF_222),
    .I1(\controller/roundCounter/count_1_1_1069 ),
    .I2(\controller/roundCounter/count [3]),
    .I3(\controller/roundCounter/count [2]),
    .O(N17)
  );
  LUT6 #(
    .INIT ( 64'h57DF028AFD75A820 ))
  \Midori/rounds/mul_input_Inst/gen_mux[36].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(\controller/roundCounter/count [0]),
    .I2(\Midori/rounds/Mxor_ProcessedKey<36>_xo<0> ),
    .I3(N17),
    .I4(\Midori/rounds_Output [16]),
    .I5(\Midori/rounds_Output [36]),
    .O(\Midori/rounds/mul_input [36])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Midori/rounds/Mxor_ProcessedKey<32>_xo<0>1_SW0  (
    .I0(key_32_IBUF_226),
    .I1(key_96_IBUF_162),
    .I2(\controller/roundCounter/count [0]),
    .O(N19)
  );
  LUT5 #(
    .INIT ( 32'hD87272D8 ))
  \Midori/rounds/mul_input_Inst/gen_mux[32].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(N19),
    .I2(\Midori/rounds_Output [56]),
    .I3(\Midori/rounds_Output [32]),
    .I4(\Midori/rounds/constant_MUX/Mram_roundConstant8 ),
    .O(\Midori/rounds/mul_input [32])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Midori/rounds/Mxor_ProcessedKey<28>_xo<0>1_SW0  (
    .I0(key_28_IBUF_230),
    .I1(key_92_IBUF_166),
    .I2(\controller/roundCounter/count [0]),
    .O(N21)
  );
  LUT5 #(
    .INIT ( 32'hD87272D8 ))
  \Midori/rounds/mul_input_Inst/gen_mux[28].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(N21),
    .I2(\Midori/rounds_Output [24]),
    .I3(\Midori/rounds_Output [28]),
    .I4(\Midori/rounds/constant_MUX/Mram_roundConstant7 ),
    .O(\Midori/rounds/mul_input [28])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Midori/rounds/Mxor_ProcessedKey<24>_xo<0>1_SW0  (
    .I0(key_24_IBUF_234),
    .I1(key_88_IBUF_170),
    .I2(\controller/roundCounter/count [0]),
    .O(N23)
  );
  LUT5 #(
    .INIT ( 32'hD87272D8 ))
  \Midori/rounds/mul_input_Inst/gen_mux[24].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(N23),
    .I2(\Midori/rounds_Output [48]),
    .I3(\Midori/rounds_Output [24]),
    .I4(\Midori/rounds/constant_MUX/Mram_roundConstant6 ),
    .O(\Midori/rounds/mul_input [24])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Midori/rounds/Mxor_ProcessedKey<20>_xo<0>1_SW0  (
    .I0(key_20_IBUF_238),
    .I1(key_84_IBUF_174),
    .I2(\controller/roundCounter/count [0]),
    .O(N25)
  );
  LUT5 #(
    .INIT ( 32'hD87272D8 ))
  \Midori/rounds/mul_input_Inst/gen_mux[20].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(N25),
    .I2(\Midori/rounds_Output [12]),
    .I3(\Midori/rounds_Output [20]),
    .I4(\Midori/rounds/constant_MUX/Mram_roundConstant5 ),
    .O(\Midori/rounds/mul_input [20])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Midori/rounds/Mxor_ProcessedKey<12>_xo<0>1_SW0  (
    .I0(key_12_IBUF_246),
    .I1(key_76_IBUF_182),
    .I2(\controller/roundCounter/count [0]),
    .O(N27)
  );
  LUT5 #(
    .INIT ( 32'hD87272D8 ))
  \Midori/rounds/mul_input_Inst/gen_mux[12].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(N27),
    .I2(\Midori/rounds_Output [32]),
    .I3(\Midori/rounds_Output [12]),
    .I4(\Midori/rounds/constant_MUX/Mram_roundConstant3 ),
    .O(\Midori/rounds/mul_input [12])
  );
  LUT3 #(
    .INIT ( 8'hAC ))
  \Midori/rounds/Mxor_ProcessedKey<4>_xo<0>1_SW0  (
    .I0(key_4_IBUF_254),
    .I1(key_68_IBUF_190),
    .I2(\controller/roundCounter/count [0]),
    .O(N29)
  );
  LUT5 #(
    .INIT ( 32'hD87272D8 ))
  \Midori/rounds/mul_input_Inst/gen_mux[4].mux_inst/Mmux_Q11  (
    .I0(enc_dec_IBUF_66),
    .I1(N29),
    .I2(\Midori/rounds_Output [52]),
    .I3(\Midori/rounds_Output [4]),
    .I4(\Midori/rounds/constant_MUX/Mram_roundConstant1 ),
    .O(\Midori/rounds/mul_input [4])
  );
  LUT4 #(
    .INIT ( 16'hA596 ))
  \Midori/rounds/mul_input_Inst/gen_mux[40].mux_inst/Mmux_Q11_SW0  (
    .I0(key_104_IBUF_154),
    .I1(\controller/roundCounter/count_3_2_1071 ),
    .I2(\controller/roundCounter/count [2]),
    .I3(\controller/roundCounter/count [1]),
    .O(N34)
  );
  LUT6 #(
    .INIT ( 64'h7F734C40B3BF808C ))
  \Midori/rounds/mul_input_Inst/gen_mux[40].mux_inst/Mmux_Q11  (
    .I0(key_40_IBUF_218),
    .I1(enc_dec_IBUF_66),
    .I2(\controller/roundCounter/count [0]),
    .I3(N34),
    .I4(\Midori/rounds_Output [44]),
    .I5(\Midori/rounds_Output [40]),
    .O(\Midori/rounds/mul_input [40])
  );
  LUT5 #(
    .INIT ( 32'h5F3FA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[63].mux_inst/Mmux_Q11  (
    .I0(key_63_IBUF_195),
    .I1(key_127_IBUF_131),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [63]),
    .O(\Midori/rounds/mul_input [63])
  );
  LUT5 #(
    .INIT ( 32'h5F3FA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[62].mux_inst/Mmux_Q11  (
    .I0(key_62_IBUF_196),
    .I1(key_126_IBUF_132),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [62]),
    .O(\Midori/rounds/mul_input [62])
  );
  LUT5 #(
    .INIT ( 32'h5F3FA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[61].mux_inst/Mmux_Q11  (
    .I0(key_61_IBUF_197),
    .I1(key_125_IBUF_133),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [61]),
    .O(\Midori/rounds/mul_input [61])
  );
  LUT5 #(
    .INIT ( 32'h5F3FA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[11].mux_inst/Mmux_Q11  (
    .I0(key_11_IBUF_247),
    .I1(key_75_IBUF_183),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [11]),
    .O(\Midori/rounds/mul_input [11])
  );
  LUT5 #(
    .INIT ( 32'h5F3FA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[10].mux_inst/Mmux_Q11  (
    .I0(key_10_IBUF_248),
    .I1(key_74_IBUF_184),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [10]),
    .O(\Midori/rounds/mul_input [10])
  );
  LUT5 #(
    .INIT ( 32'h5F3FA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[9].mux_inst/Mmux_Q11  (
    .I0(key_9_IBUF_249),
    .I1(key_73_IBUF_185),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [9]),
    .O(\Midori/rounds/mul_input [9])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[59].mux_inst/Mmux_Q11  (
    .I0(key_59_IBUF_199),
    .I1(key_123_IBUF_135),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [23]),
    .I5(\Midori/rounds_Output [59]),
    .O(\Midori/rounds/mul_input [59])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[58].mux_inst/Mmux_Q11  (
    .I0(key_58_IBUF_200),
    .I1(key_122_IBUF_136),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [22]),
    .I5(\Midori/rounds_Output [58]),
    .O(\Midori/rounds/mul_input [58])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[57].mux_inst/Mmux_Q11  (
    .I0(key_57_IBUF_201),
    .I1(key_121_IBUF_137),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [21]),
    .I5(\Midori/rounds_Output [57]),
    .O(\Midori/rounds/mul_input [57])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[55].mux_inst/Mmux_Q11  (
    .I0(key_55_IBUF_203),
    .I1(key_119_IBUF_139),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [43]),
    .I5(\Midori/rounds_Output [55]),
    .O(\Midori/rounds/mul_input [55])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[54].mux_inst/Mmux_Q11  (
    .I0(key_54_IBUF_204),
    .I1(key_118_IBUF_140),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [42]),
    .I5(\Midori/rounds_Output [54]),
    .O(\Midori/rounds/mul_input [54])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[53].mux_inst/Mmux_Q11  (
    .I0(key_53_IBUF_205),
    .I1(key_117_IBUF_141),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [41]),
    .I5(\Midori/rounds_Output [53]),
    .O(\Midori/rounds/mul_input [53])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[51].mux_inst/Mmux_Q11  (
    .I0(key_51_IBUF_207),
    .I1(key_115_IBUF_143),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [3]),
    .I5(\Midori/rounds_Output [51]),
    .O(\Midori/rounds/mul_input [51])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[50].mux_inst/Mmux_Q11  (
    .I0(key_50_IBUF_208),
    .I1(key_114_IBUF_144),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [2]),
    .I5(\Midori/rounds_Output [50]),
    .O(\Midori/rounds/mul_input [50])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[49].mux_inst/Mmux_Q11  (
    .I0(key_49_IBUF_209),
    .I1(key_113_IBUF_145),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [1]),
    .I5(\Midori/rounds_Output [49]),
    .O(\Midori/rounds/mul_input [49])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[47].mux_inst/Mmux_Q11  (
    .I0(key_47_IBUF_211),
    .I1(key_111_IBUF_147),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [7]),
    .I5(\Midori/rounds_Output [47]),
    .O(\Midori/rounds/mul_input [47])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[46].mux_inst/Mmux_Q11  (
    .I0(key_46_IBUF_212),
    .I1(key_110_IBUF_148),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [6]),
    .I5(\Midori/rounds_Output [46]),
    .O(\Midori/rounds/mul_input [46])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[45].mux_inst/Mmux_Q11  (
    .I0(key_45_IBUF_213),
    .I1(key_109_IBUF_149),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [5]),
    .I5(\Midori/rounds_Output [45]),
    .O(\Midori/rounds/mul_input [45])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[43].mux_inst/Mmux_Q11  (
    .I0(key_43_IBUF_215),
    .I1(key_107_IBUF_151),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [47]),
    .I5(\Midori/rounds_Output [43]),
    .O(\Midori/rounds/mul_input [43])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[42].mux_inst/Mmux_Q11  (
    .I0(key_42_IBUF_216),
    .I1(key_106_IBUF_152),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [46]),
    .I5(\Midori/rounds_Output [42]),
    .O(\Midori/rounds/mul_input [42])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[41].mux_inst/Mmux_Q11  (
    .I0(key_41_IBUF_217),
    .I1(key_105_IBUF_153),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [45]),
    .I5(\Midori/rounds_Output [41]),
    .O(\Midori/rounds/mul_input [41])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[39].mux_inst/Mmux_Q11  (
    .I0(key_39_IBUF_219),
    .I1(key_103_IBUF_155),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [19]),
    .I5(\Midori/rounds_Output [39]),
    .O(\Midori/rounds/mul_input [39])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[38].mux_inst/Mmux_Q11  (
    .I0(key_38_IBUF_220),
    .I1(key_102_IBUF_156),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [18]),
    .I5(\Midori/rounds_Output [38]),
    .O(\Midori/rounds/mul_input [38])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[37].mux_inst/Mmux_Q11  (
    .I0(key_37_IBUF_221),
    .I1(key_101_IBUF_157),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [17]),
    .I5(\Midori/rounds_Output [37]),
    .O(\Midori/rounds/mul_input [37])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[35].mux_inst/Mmux_Q11  (
    .I0(key_35_IBUF_223),
    .I1(key_99_IBUF_159),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [59]),
    .I5(\Midori/rounds_Output [35]),
    .O(\Midori/rounds/mul_input [35])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[34].mux_inst/Mmux_Q11  (
    .I0(key_34_IBUF_224),
    .I1(key_98_IBUF_160),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [58]),
    .I5(\Midori/rounds_Output [34]),
    .O(\Midori/rounds/mul_input [34])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[33].mux_inst/Mmux_Q11  (
    .I0(key_33_IBUF_225),
    .I1(key_97_IBUF_161),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [57]),
    .I5(\Midori/rounds_Output [33]),
    .O(\Midori/rounds/mul_input [33])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[31].mux_inst/Mmux_Q11  (
    .I0(key_31_IBUF_227),
    .I1(key_95_IBUF_163),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [27]),
    .I5(\Midori/rounds_Output [31]),
    .O(\Midori/rounds/mul_input [31])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[30].mux_inst/Mmux_Q11  (
    .I0(key_30_IBUF_228),
    .I1(key_94_IBUF_164),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [26]),
    .I5(\Midori/rounds_Output [30]),
    .O(\Midori/rounds/mul_input [30])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[29].mux_inst/Mmux_Q11  (
    .I0(key_29_IBUF_229),
    .I1(key_93_IBUF_165),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [25]),
    .I5(\Midori/rounds_Output [29]),
    .O(\Midori/rounds/mul_input [29])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[27].mux_inst/Mmux_Q11  (
    .I0(key_27_IBUF_231),
    .I1(key_91_IBUF_167),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [51]),
    .I5(\Midori/rounds_Output [27]),
    .O(\Midori/rounds/mul_input [27])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[26].mux_inst/Mmux_Q11  (
    .I0(key_26_IBUF_232),
    .I1(key_90_IBUF_168),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [50]),
    .I5(\Midori/rounds_Output [26]),
    .O(\Midori/rounds/mul_input [26])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[25].mux_inst/Mmux_Q11  (
    .I0(key_25_IBUF_233),
    .I1(key_89_IBUF_169),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [49]),
    .I5(\Midori/rounds_Output [25]),
    .O(\Midori/rounds/mul_input [25])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[23].mux_inst/Mmux_Q11  (
    .I0(key_23_IBUF_235),
    .I1(key_87_IBUF_171),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [15]),
    .I5(\Midori/rounds_Output [23]),
    .O(\Midori/rounds/mul_input [23])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[22].mux_inst/Mmux_Q11  (
    .I0(key_22_IBUF_236),
    .I1(key_86_IBUF_172),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [14]),
    .I5(\Midori/rounds_Output [22]),
    .O(\Midori/rounds/mul_input [22])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[21].mux_inst/Mmux_Q11  (
    .I0(key_21_IBUF_237),
    .I1(key_85_IBUF_173),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [13]),
    .I5(\Midori/rounds_Output [21]),
    .O(\Midori/rounds/mul_input [21])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[19].mux_inst/Mmux_Q11  (
    .I0(key_19_IBUF_239),
    .I1(key_83_IBUF_175),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [39]),
    .I5(\Midori/rounds_Output [19]),
    .O(\Midori/rounds/mul_input [19])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[18].mux_inst/Mmux_Q11  (
    .I0(key_18_IBUF_240),
    .I1(key_82_IBUF_176),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [38]),
    .I5(\Midori/rounds_Output [18]),
    .O(\Midori/rounds/mul_input [18])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[17].mux_inst/Mmux_Q11  (
    .I0(key_17_IBUF_241),
    .I1(key_81_IBUF_177),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [37]),
    .I5(\Midori/rounds_Output [17]),
    .O(\Midori/rounds/mul_input [17])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[15].mux_inst/Mmux_Q11  (
    .I0(key_15_IBUF_243),
    .I1(key_79_IBUF_179),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [35]),
    .I5(\Midori/rounds_Output [15]),
    .O(\Midori/rounds/mul_input [15])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[14].mux_inst/Mmux_Q11  (
    .I0(key_14_IBUF_244),
    .I1(key_78_IBUF_180),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [34]),
    .I5(\Midori/rounds_Output [14]),
    .O(\Midori/rounds/mul_input [14])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[13].mux_inst/Mmux_Q11  (
    .I0(key_13_IBUF_245),
    .I1(key_77_IBUF_181),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [33]),
    .I5(\Midori/rounds_Output [13]),
    .O(\Midori/rounds/mul_input [13])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[7].mux_inst/Mmux_Q11  (
    .I0(key_7_IBUF_251),
    .I1(key_71_IBUF_187),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [55]),
    .I5(\Midori/rounds_Output [7]),
    .O(\Midori/rounds/mul_input [7])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[6].mux_inst/Mmux_Q11  (
    .I0(key_6_IBUF_252),
    .I1(key_70_IBUF_188),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [54]),
    .I5(\Midori/rounds_Output [6]),
    .O(\Midori/rounds/mul_input [6])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[5].mux_inst/Mmux_Q11  (
    .I0(key_5_IBUF_253),
    .I1(key_69_IBUF_189),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [53]),
    .I5(\Midori/rounds_Output [5]),
    .O(\Midori/rounds/mul_input [5])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[3].mux_inst/Mmux_Q11  (
    .I0(key_3_IBUF_255),
    .I1(key_67_IBUF_191),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [31]),
    .I5(\Midori/rounds_Output [3]),
    .O(\Midori/rounds/mul_input [3])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[2].mux_inst/Mmux_Q11  (
    .I0(key_2_IBUF_256),
    .I1(key_66_IBUF_192),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [30]),
    .I5(\Midori/rounds_Output [2]),
    .O(\Midori/rounds/mul_input [2])
  );
  LUT6 #(
    .INIT ( 64'h5F3F5030AFCFA0C0 ))
  \Midori/rounds/mul_input_Inst/gen_mux[1].mux_inst/Mmux_Q11  (
    .I0(key_1_IBUF_257),
    .I1(key_65_IBUF_193),
    .I2(enc_dec_IBUF_66),
    .I3(\controller/roundCounter/count [0]),
    .I4(\Midori/rounds_Output [29]),
    .I5(\Midori/rounds_Output [1]),
    .O(\Midori/rounds/mul_input [1])
  );
  FDR   \controller/roundCounter/count_3_1  (
    .C(clk_BUFGP_64),
    .D(Result[3]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count_3_1_1066 )
  );
  FDR   \controller/roundCounter/count_2_1  (
    .C(clk_BUFGP_64),
    .D(Result[2]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count_2_1_1067 )
  );
  FDR   \controller/roundCounter/count_0_1  (
    .C(clk_BUFGP_64),
    .D(Result[0]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count_0_1_1068 )
  );
  FDR   \controller/roundCounter/count_1_1  (
    .C(clk_BUFGP_64),
    .D(Result[1]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count_1_1_1069 )
  );
  FDR   \controller/roundCounter/count_2_2  (
    .C(clk_BUFGP_64),
    .D(Result[2]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count_2_2_1070 )
  );
  FDR   \controller/roundCounter/count_3_2  (
    .C(clk_BUFGP_64),
    .D(Result[3]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count_3_2_1071 )
  );
  FDR   \controller/roundCounter/count_1_2  (
    .C(clk_BUFGP_64),
    .D(Result[1]),
    .R(reset_IBUF_65),
    .Q(\controller/roundCounter/count_1_2_1072 )
  );
  MUXF7   \Midori/rounds/Mxor_ProcessedKey<0>_xo<0>  (
    .I0(N36),
    .I1(N37),
    .S(\controller/roundCounter/count [2]),
    .O(\Midori/rounds/ProcessedKey[0] )
  );
  LUT6 #(
    .INIT ( 64'h2D88DD2878DD887D ))
  \Midori/rounds/Mxor_ProcessedKey<0>_xo<0>_F  (
    .I0(\controller/roundCounter/count_0_1_1068 ),
    .I1(key_0_IBUF_258),
    .I2(\controller/roundCounter/count_1_1_1069 ),
    .I3(enc_dec_IBUF_66),
    .I4(\controller/roundCounter/count [3]),
    .I5(key_64_IBUF_194),
    .O(N36)
  );
  LUT6 #(
    .INIT ( 64'hBEBEBEAF14141405 ))
  \Midori/rounds/Mxor_ProcessedKey<0>_xo<0>_G  (
    .I0(\controller/roundCounter/count_0_1_1068 ),
    .I1(enc_dec_IBUF_66),
    .I2(key_64_IBUF_194),
    .I3(\controller/roundCounter/count_3_1_1066 ),
    .I4(\controller/roundCounter/count_1_2_1072 ),
    .I5(key_0_IBUF_258),
    .O(N37)
  );
  MUXF7   \Midori/rounds/Mxor_ProcessedKey<16>_xo<0>  (
    .I0(N38),
    .I1(N39),
    .S(\controller/roundCounter/count [3]),
    .O(\Midori/rounds/ProcessedKey[16] )
  );
  LUT6 #(
    .INIT ( 64'hE4C6286CB1937D39 ))
  \Midori/rounds/Mxor_ProcessedKey<16>_xo<0>_F  (
    .I0(\controller/roundCounter/count_0_1_1068 ),
    .I1(\controller/roundCounter/count_2_1_1067 ),
    .I2(key_16_IBUF_242),
    .I3(enc_dec_IBUF_66),
    .I4(\controller/roundCounter/count_1_2_1072 ),
    .I5(key_80_IBUF_178),
    .O(N38)
  );
  LUT6 #(
    .INIT ( 64'h9A569A56CF039A56 ))
  \Midori/rounds/Mxor_ProcessedKey<16>_xo<0>_G  (
    .I0(\controller/roundCounter/count_2_1_1067 ),
    .I1(\controller/roundCounter/count_0_1_1068 ),
    .I2(key_80_IBUF_178),
    .I3(key_16_IBUF_242),
    .I4(\controller/roundCounter/count_1_2_1072 ),
    .I5(enc_dec_IBUF_66),
    .O(N39)
  );
  MUXF7   \Midori/rounds/Mxor_ProcessedKey<56>_xo<0>  (
    .I0(N40),
    .I1(N41),
    .S(\controller/roundCounter/count [3]),
    .O(\Midori/rounds/ProcessedKey[56] )
  );
  LUT6 #(
    .INIT ( 64'hD282D77787D78222 ))
  \Midori/rounds/Mxor_ProcessedKey<56>_xo<0>_F  (
    .I0(\controller/roundCounter/count_0_1_1068 ),
    .I1(key_56_IBUF_202),
    .I2(\controller/roundCounter/count_1_1_1069 ),
    .I3(\controller/roundCounter/count_2_2_1070 ),
    .I4(enc_dec_IBUF_66),
    .I5(key_120_IBUF_138),
    .O(N40)
  );
  LUT6 #(
    .INIT ( 64'hD7825F9382D70AC6 ))
  \Midori/rounds/Mxor_ProcessedKey<56>_xo<0>_G  (
    .I0(\controller/roundCounter/count_0_1_1068 ),
    .I1(\controller/roundCounter/count_1_1_1069 ),
    .I2(key_56_IBUF_202),
    .I3(enc_dec_IBUF_66),
    .I4(\controller/roundCounter/count [2]),
    .I5(key_120_IBUF_138),
    .O(N41)
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_64)
  );
  INV   \controller/roundCounter/Mcount_count_xor<0>11_INV_0  (
    .I(\controller/roundCounter/count [0]),
    .O(Result[0])
  );
endmodule

