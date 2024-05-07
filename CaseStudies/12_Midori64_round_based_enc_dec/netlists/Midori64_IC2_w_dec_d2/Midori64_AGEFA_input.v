
module Midori64 ( clk, reset, DataIn, DataOut, key, enc_dec, done );
  (* AGEMA = "secure" *)   input [63:0]  DataIn;
  (* AGEMA = "secure" *)   input [127:0] key;
  (* AGEMA = "clock" *)    input clk;
  (* AGEMA = "reset" *)    input reset;
  (* AGEMA = "control" *) input enc_dec;

  output [63:0] DataOut;
  (* AGEMA = "control" *) output done;

  wire   RegEnable, controller_n4, controller_n3, controller_n2,
         controller_roundCounter_n9, controller_roundCounter_n8,
         controller_roundCounter_n7, controller_roundCounter_n6,
         controller_roundCounter_n5, controller_roundCounter_n4,
         controller_roundCounter_n3, controller_roundCounter_n24,
         controller_roundCounter_n25, controller_roundCounter_n1,
         controller_roundCounter_n26, controller_roundCounter_n27,
         controller_roundCounter_count_reg_0__QN,
         controller_roundCounter_count_reg_2__QN,
         controller_roundCounter_count_reg_3__QN, Midori_rounds_n16,
         Midori_rounds_n15, Midori_rounds_n14, Midori_rounds_n13,
         Midori_rounds_n12, Midori_rounds_n11, Midori_rounds_n10,
         Midori_rounds_n9, Midori_rounds_n8, Midori_rounds_n7,
         Midori_rounds_n6, Midori_rounds_n5, Midori_rounds_n4,
         Midori_rounds_n3, Midori_rounds_n2, Midori_rounds_n1,
         Midori_rounds_SelectedKey_0_, Midori_rounds_SelectedKey_1_,
         Midori_rounds_SelectedKey_2_, Midori_rounds_SelectedKey_3_,
         Midori_rounds_SelectedKey_4_, Midori_rounds_SelectedKey_5_,
         Midori_rounds_SelectedKey_6_, Midori_rounds_SelectedKey_7_,
         Midori_rounds_SelectedKey_8_, Midori_rounds_SelectedKey_9_,
         Midori_rounds_SelectedKey_10_, Midori_rounds_SelectedKey_11_,
         Midori_rounds_SelectedKey_12_, Midori_rounds_SelectedKey_13_,
         Midori_rounds_SelectedKey_14_, Midori_rounds_SelectedKey_15_,
         Midori_rounds_SelectedKey_16_, Midori_rounds_SelectedKey_17_,
         Midori_rounds_SelectedKey_18_, Midori_rounds_SelectedKey_19_,
         Midori_rounds_SelectedKey_20_, Midori_rounds_SelectedKey_21_,
         Midori_rounds_SelectedKey_22_, Midori_rounds_SelectedKey_23_,
         Midori_rounds_SelectedKey_24_, Midori_rounds_SelectedKey_25_,
         Midori_rounds_SelectedKey_26_, Midori_rounds_SelectedKey_27_,
         Midori_rounds_SelectedKey_28_, Midori_rounds_SelectedKey_29_,
         Midori_rounds_SelectedKey_30_, Midori_rounds_SelectedKey_31_,
         Midori_rounds_SelectedKey_32_, Midori_rounds_SelectedKey_33_,
         Midori_rounds_SelectedKey_34_, Midori_rounds_SelectedKey_35_,
         Midori_rounds_SelectedKey_36_, Midori_rounds_SelectedKey_37_,
         Midori_rounds_SelectedKey_38_, Midori_rounds_SelectedKey_39_,
         Midori_rounds_SelectedKey_40_, Midori_rounds_SelectedKey_41_,
         Midori_rounds_SelectedKey_42_, Midori_rounds_SelectedKey_43_,
         Midori_rounds_SelectedKey_44_, Midori_rounds_SelectedKey_45_,
         Midori_rounds_SelectedKey_46_, Midori_rounds_SelectedKey_47_,
         Midori_rounds_SelectedKey_48_, Midori_rounds_SelectedKey_49_,
         Midori_rounds_SelectedKey_50_, Midori_rounds_SelectedKey_51_,
         Midori_rounds_SelectedKey_52_, Midori_rounds_SelectedKey_53_,
         Midori_rounds_SelectedKey_54_, Midori_rounds_SelectedKey_55_,
         Midori_rounds_SelectedKey_56_, Midori_rounds_SelectedKey_57_,
         Midori_rounds_SelectedKey_58_, Midori_rounds_SelectedKey_59_,
         Midori_rounds_SelectedKey_60_, Midori_rounds_SelectedKey_61_,
         Midori_rounds_SelectedKey_62_, Midori_rounds_SelectedKey_63_,
         Midori_rounds_constant_MUX_n106, Midori_rounds_constant_MUX_n105,
         Midori_rounds_constant_MUX_n104, Midori_rounds_constant_MUX_n103,
         Midori_rounds_constant_MUX_n102, Midori_rounds_constant_MUX_n101,
         Midori_rounds_constant_MUX_n100, Midori_rounds_constant_MUX_n99,
         Midori_rounds_constant_MUX_n98, Midori_rounds_constant_MUX_n97,
         Midori_rounds_constant_MUX_n96, Midori_rounds_constant_MUX_n95,
         Midori_rounds_constant_MUX_n94, Midori_rounds_constant_MUX_n93,
         Midori_rounds_constant_MUX_n92, Midori_rounds_constant_MUX_n91,
         Midori_rounds_constant_MUX_n90, Midori_rounds_constant_MUX_n89,
         Midori_rounds_constant_MUX_n88, Midori_rounds_constant_MUX_n87,
         Midori_rounds_constant_MUX_n86, Midori_rounds_constant_MUX_n85,
         Midori_rounds_constant_MUX_n84, Midori_rounds_constant_MUX_n83,
         Midori_rounds_constant_MUX_n82, Midori_rounds_constant_MUX_n81,
         Midori_rounds_constant_MUX_n80, Midori_rounds_constant_MUX_n79,
         Midori_rounds_constant_MUX_n78, Midori_rounds_constant_MUX_n77,
         Midori_rounds_constant_MUX_n76, Midori_rounds_constant_MUX_n75,
         Midori_rounds_constant_MUX_n74, Midori_rounds_constant_MUX_n73,
         Midori_rounds_constant_MUX_n72, Midori_rounds_constant_MUX_n71,
         Midori_rounds_constant_MUX_n70, Midori_rounds_constant_MUX_n69,
         Midori_rounds_constant_MUX_n68, Midori_rounds_constant_MUX_n67,
         Midori_rounds_constant_MUX_n66, Midori_rounds_constant_MUX_n65,
         Midori_rounds_constant_MUX_n64, Midori_rounds_constant_MUX_n63,
         Midori_rounds_constant_MUX_n62, Midori_rounds_constant_MUX_n61,
         Midori_rounds_constant_MUX_n60, Midori_rounds_constant_MUX_n59,
         Midori_rounds_constant_MUX_n58, Midori_rounds_constant_MUX_n57,
         Midori_rounds_constant_MUX_n56, Midori_rounds_constant_MUX_n55,
         Midori_rounds_constant_MUX_n54, Midori_rounds_constant_MUX_n53,
         Midori_rounds_constant_MUX_n52, Midori_rounds_constant_MUX_n51,
         Midori_rounds_constant_MUX_n50, Midori_rounds_constant_MUX_n49,
         Midori_rounds_constant_MUX_n48, Midori_rounds_constant_MUX_n47,
         Midori_rounds_constant_MUX_n46, Midori_rounds_constant_MUX_n45,
         Midori_rounds_constant_MUX_n44, Midori_rounds_constant_MUX_n43,
         Midori_rounds_constant_MUX_n42, Midori_rounds_constant_MUX_n41,
         Midori_rounds_constant_MUX_n40, Midori_rounds_constant_MUX_n39,
         Midori_rounds_constant_MUX_n38, Midori_rounds_constant_MUX_n37,
         Midori_rounds_constant_MUX_n36, Midori_rounds_constant_MUX_n35,
         Midori_rounds_constant_MUX_n34, Midori_rounds_constant_MUX_n33,
         Midori_rounds_constant_MUX_n32, Midori_rounds_constant_MUX_n31,
         Midori_rounds_constant_MUX_n30, Midori_rounds_constant_MUX_n29,
         Midori_rounds_constant_MUX_n28, Midori_rounds_constant_MUX_n27,
         Midori_rounds_constant_MUX_n26, Midori_rounds_constant_MUX_n25,
         Midori_rounds_constant_MUX_n24, Midori_rounds_constant_MUX_n23,
         Midori_rounds_constant_MUX_n22, Midori_rounds_constant_MUX_n21,
         Midori_rounds_constant_MUX_n20, Midori_rounds_constant_MUX_n19,
         Midori_rounds_constant_MUX_n18, Midori_rounds_constant_MUX_n17,
         Midori_rounds_MUXInst_n11, Midori_rounds_MUXInst_n10,
         Midori_rounds_MUXInst_n9, Midori_rounds_MUXInst_n8,
         Midori_rounds_roundResult_Reg_n9, Midori_rounds_roundResult_Reg_n8,
         Midori_rounds_roundResult_Reg_n7,
         Midori_rounds_roundResult_Reg_SFF_0_n5,
         Midori_rounds_roundResult_Reg_SFF_0_DQ,
         Midori_rounds_roundResult_Reg_SFF_0_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_1_n5,
         Midori_rounds_roundResult_Reg_SFF_1_DQ,
         Midori_rounds_roundResult_Reg_SFF_1_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_2_n5,
         Midori_rounds_roundResult_Reg_SFF_2_DQ,
         Midori_rounds_roundResult_Reg_SFF_2_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_3_n5,
         Midori_rounds_roundResult_Reg_SFF_3_DQ,
         Midori_rounds_roundResult_Reg_SFF_3_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_4_n5,
         Midori_rounds_roundResult_Reg_SFF_4_DQ,
         Midori_rounds_roundResult_Reg_SFF_4_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_5_n5,
         Midori_rounds_roundResult_Reg_SFF_5_DQ,
         Midori_rounds_roundResult_Reg_SFF_5_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_6_n5,
         Midori_rounds_roundResult_Reg_SFF_6_DQ,
         Midori_rounds_roundResult_Reg_SFF_6_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_7_n5,
         Midori_rounds_roundResult_Reg_SFF_7_DQ,
         Midori_rounds_roundResult_Reg_SFF_7_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_8_n5,
         Midori_rounds_roundResult_Reg_SFF_8_DQ,
         Midori_rounds_roundResult_Reg_SFF_8_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_9_n5,
         Midori_rounds_roundResult_Reg_SFF_9_DQ,
         Midori_rounds_roundResult_Reg_SFF_9_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_10_n5,
         Midori_rounds_roundResult_Reg_SFF_10_DQ,
         Midori_rounds_roundResult_Reg_SFF_10_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_11_n5,
         Midori_rounds_roundResult_Reg_SFF_11_DQ,
         Midori_rounds_roundResult_Reg_SFF_11_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_12_n5,
         Midori_rounds_roundResult_Reg_SFF_12_DQ,
         Midori_rounds_roundResult_Reg_SFF_12_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_13_n5,
         Midori_rounds_roundResult_Reg_SFF_13_DQ,
         Midori_rounds_roundResult_Reg_SFF_13_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_14_n5,
         Midori_rounds_roundResult_Reg_SFF_14_DQ,
         Midori_rounds_roundResult_Reg_SFF_14_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_15_n5,
         Midori_rounds_roundResult_Reg_SFF_15_DQ,
         Midori_rounds_roundResult_Reg_SFF_15_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_16_n5,
         Midori_rounds_roundResult_Reg_SFF_16_DQ,
         Midori_rounds_roundResult_Reg_SFF_16_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_17_n5,
         Midori_rounds_roundResult_Reg_SFF_17_DQ,
         Midori_rounds_roundResult_Reg_SFF_17_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_18_n5,
         Midori_rounds_roundResult_Reg_SFF_18_DQ,
         Midori_rounds_roundResult_Reg_SFF_18_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_19_n5,
         Midori_rounds_roundResult_Reg_SFF_19_DQ,
         Midori_rounds_roundResult_Reg_SFF_19_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_20_n5,
         Midori_rounds_roundResult_Reg_SFF_20_DQ,
         Midori_rounds_roundResult_Reg_SFF_20_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_21_n5,
         Midori_rounds_roundResult_Reg_SFF_21_DQ,
         Midori_rounds_roundResult_Reg_SFF_21_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_22_n5,
         Midori_rounds_roundResult_Reg_SFF_22_DQ,
         Midori_rounds_roundResult_Reg_SFF_22_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_23_n5,
         Midori_rounds_roundResult_Reg_SFF_23_DQ,
         Midori_rounds_roundResult_Reg_SFF_23_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_24_n5,
         Midori_rounds_roundResult_Reg_SFF_24_DQ,
         Midori_rounds_roundResult_Reg_SFF_24_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_25_n5,
         Midori_rounds_roundResult_Reg_SFF_25_DQ,
         Midori_rounds_roundResult_Reg_SFF_25_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_26_n5,
         Midori_rounds_roundResult_Reg_SFF_26_DQ,
         Midori_rounds_roundResult_Reg_SFF_26_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_27_n5,
         Midori_rounds_roundResult_Reg_SFF_27_DQ,
         Midori_rounds_roundResult_Reg_SFF_27_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_28_n5,
         Midori_rounds_roundResult_Reg_SFF_28_DQ,
         Midori_rounds_roundResult_Reg_SFF_28_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_29_n5,
         Midori_rounds_roundResult_Reg_SFF_29_DQ,
         Midori_rounds_roundResult_Reg_SFF_29_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_30_n5,
         Midori_rounds_roundResult_Reg_SFF_30_DQ,
         Midori_rounds_roundResult_Reg_SFF_30_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_31_n5,
         Midori_rounds_roundResult_Reg_SFF_31_DQ,
         Midori_rounds_roundResult_Reg_SFF_31_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_32_n5,
         Midori_rounds_roundResult_Reg_SFF_32_DQ,
         Midori_rounds_roundResult_Reg_SFF_32_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_33_n5,
         Midori_rounds_roundResult_Reg_SFF_33_DQ,
         Midori_rounds_roundResult_Reg_SFF_33_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_34_n5,
         Midori_rounds_roundResult_Reg_SFF_34_DQ,
         Midori_rounds_roundResult_Reg_SFF_34_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_35_n5,
         Midori_rounds_roundResult_Reg_SFF_35_DQ,
         Midori_rounds_roundResult_Reg_SFF_35_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_36_n5,
         Midori_rounds_roundResult_Reg_SFF_36_DQ,
         Midori_rounds_roundResult_Reg_SFF_36_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_37_n5,
         Midori_rounds_roundResult_Reg_SFF_37_DQ,
         Midori_rounds_roundResult_Reg_SFF_37_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_38_n5,
         Midori_rounds_roundResult_Reg_SFF_38_DQ,
         Midori_rounds_roundResult_Reg_SFF_38_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_39_n5,
         Midori_rounds_roundResult_Reg_SFF_39_DQ,
         Midori_rounds_roundResult_Reg_SFF_39_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_40_n5,
         Midori_rounds_roundResult_Reg_SFF_40_DQ,
         Midori_rounds_roundResult_Reg_SFF_40_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_41_n5,
         Midori_rounds_roundResult_Reg_SFF_41_DQ,
         Midori_rounds_roundResult_Reg_SFF_41_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_42_n5,
         Midori_rounds_roundResult_Reg_SFF_42_DQ,
         Midori_rounds_roundResult_Reg_SFF_42_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_43_n5,
         Midori_rounds_roundResult_Reg_SFF_43_DQ,
         Midori_rounds_roundResult_Reg_SFF_43_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_44_n5,
         Midori_rounds_roundResult_Reg_SFF_44_DQ,
         Midori_rounds_roundResult_Reg_SFF_44_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_45_n5,
         Midori_rounds_roundResult_Reg_SFF_45_DQ,
         Midori_rounds_roundResult_Reg_SFF_45_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_46_n5,
         Midori_rounds_roundResult_Reg_SFF_46_DQ,
         Midori_rounds_roundResult_Reg_SFF_46_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_47_n5,
         Midori_rounds_roundResult_Reg_SFF_47_DQ,
         Midori_rounds_roundResult_Reg_SFF_47_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_48_n5,
         Midori_rounds_roundResult_Reg_SFF_48_DQ,
         Midori_rounds_roundResult_Reg_SFF_48_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_49_n5,
         Midori_rounds_roundResult_Reg_SFF_49_DQ,
         Midori_rounds_roundResult_Reg_SFF_49_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_50_n5,
         Midori_rounds_roundResult_Reg_SFF_50_DQ,
         Midori_rounds_roundResult_Reg_SFF_50_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_51_n5,
         Midori_rounds_roundResult_Reg_SFF_51_DQ,
         Midori_rounds_roundResult_Reg_SFF_51_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_52_n5,
         Midori_rounds_roundResult_Reg_SFF_52_DQ,
         Midori_rounds_roundResult_Reg_SFF_52_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_53_n5,
         Midori_rounds_roundResult_Reg_SFF_53_DQ,
         Midori_rounds_roundResult_Reg_SFF_53_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_54_n5,
         Midori_rounds_roundResult_Reg_SFF_54_DQ,
         Midori_rounds_roundResult_Reg_SFF_54_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_55_n5,
         Midori_rounds_roundResult_Reg_SFF_55_DQ,
         Midori_rounds_roundResult_Reg_SFF_55_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_56_n5,
         Midori_rounds_roundResult_Reg_SFF_56_DQ,
         Midori_rounds_roundResult_Reg_SFF_56_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_57_n5,
         Midori_rounds_roundResult_Reg_SFF_57_DQ,
         Midori_rounds_roundResult_Reg_SFF_57_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_58_n5,
         Midori_rounds_roundResult_Reg_SFF_58_DQ,
         Midori_rounds_roundResult_Reg_SFF_58_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_59_n5,
         Midori_rounds_roundResult_Reg_SFF_59_DQ,
         Midori_rounds_roundResult_Reg_SFF_59_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_60_n5,
         Midori_rounds_roundResult_Reg_SFF_60_DQ,
         Midori_rounds_roundResult_Reg_SFF_60_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_61_n5,
         Midori_rounds_roundResult_Reg_SFF_61_DQ,
         Midori_rounds_roundResult_Reg_SFF_61_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_62_n5,
         Midori_rounds_roundResult_Reg_SFF_62_DQ,
         Midori_rounds_roundResult_Reg_SFF_62_Q_reg_QN,
         Midori_rounds_roundResult_Reg_SFF_63_n5,
         Midori_rounds_roundResult_Reg_SFF_63_DQ,
         Midori_rounds_roundResult_Reg_SFF_63_Q_reg_QN,
         Midori_rounds_sub_sBox_PRINCE_0_n15,
         Midori_rounds_sub_sBox_PRINCE_0_n14,
         Midori_rounds_sub_sBox_PRINCE_0_n13,
         Midori_rounds_sub_sBox_PRINCE_0_n12,
         Midori_rounds_sub_sBox_PRINCE_0_n11,
         Midori_rounds_sub_sBox_PRINCE_0_n10,
         Midori_rounds_sub_sBox_PRINCE_0_n9,
         Midori_rounds_sub_sBox_PRINCE_0_n8,
         Midori_rounds_sub_sBox_PRINCE_0_n7,
         Midori_rounds_sub_sBox_PRINCE_0_n6,
         Midori_rounds_sub_sBox_PRINCE_0_n5,
         Midori_rounds_sub_sBox_PRINCE_0_n4,
         Midori_rounds_sub_sBox_PRINCE_0_n3,
         Midori_rounds_sub_sBox_PRINCE_0_n2,
         Midori_rounds_sub_sBox_PRINCE_0_n1,
         Midori_rounds_sub_sBox_PRINCE_1_n15,
         Midori_rounds_sub_sBox_PRINCE_1_n14,
         Midori_rounds_sub_sBox_PRINCE_1_n13,
         Midori_rounds_sub_sBox_PRINCE_1_n12,
         Midori_rounds_sub_sBox_PRINCE_1_n11,
         Midori_rounds_sub_sBox_PRINCE_1_n10,
         Midori_rounds_sub_sBox_PRINCE_1_n9,
         Midori_rounds_sub_sBox_PRINCE_1_n8,
         Midori_rounds_sub_sBox_PRINCE_1_n7,
         Midori_rounds_sub_sBox_PRINCE_1_n6,
         Midori_rounds_sub_sBox_PRINCE_1_n5,
         Midori_rounds_sub_sBox_PRINCE_1_n4,
         Midori_rounds_sub_sBox_PRINCE_1_n3,
         Midori_rounds_sub_sBox_PRINCE_1_n2,
         Midori_rounds_sub_sBox_PRINCE_1_n1,
         Midori_rounds_sub_sBox_PRINCE_2_n15,
         Midori_rounds_sub_sBox_PRINCE_2_n14,
         Midori_rounds_sub_sBox_PRINCE_2_n13,
         Midori_rounds_sub_sBox_PRINCE_2_n12,
         Midori_rounds_sub_sBox_PRINCE_2_n11,
         Midori_rounds_sub_sBox_PRINCE_2_n10,
         Midori_rounds_sub_sBox_PRINCE_2_n9,
         Midori_rounds_sub_sBox_PRINCE_2_n8,
         Midori_rounds_sub_sBox_PRINCE_2_n7,
         Midori_rounds_sub_sBox_PRINCE_2_n6,
         Midori_rounds_sub_sBox_PRINCE_2_n5,
         Midori_rounds_sub_sBox_PRINCE_2_n4,
         Midori_rounds_sub_sBox_PRINCE_2_n3,
         Midori_rounds_sub_sBox_PRINCE_2_n2,
         Midori_rounds_sub_sBox_PRINCE_2_n1,
         Midori_rounds_sub_sBox_PRINCE_3_n15,
         Midori_rounds_sub_sBox_PRINCE_3_n14,
         Midori_rounds_sub_sBox_PRINCE_3_n13,
         Midori_rounds_sub_sBox_PRINCE_3_n12,
         Midori_rounds_sub_sBox_PRINCE_3_n11,
         Midori_rounds_sub_sBox_PRINCE_3_n10,
         Midori_rounds_sub_sBox_PRINCE_3_n9,
         Midori_rounds_sub_sBox_PRINCE_3_n8,
         Midori_rounds_sub_sBox_PRINCE_3_n7,
         Midori_rounds_sub_sBox_PRINCE_3_n6,
         Midori_rounds_sub_sBox_PRINCE_3_n5,
         Midori_rounds_sub_sBox_PRINCE_3_n4,
         Midori_rounds_sub_sBox_PRINCE_3_n3,
         Midori_rounds_sub_sBox_PRINCE_3_n2,
         Midori_rounds_sub_sBox_PRINCE_3_n1,
         Midori_rounds_sub_sBox_PRINCE_4_n15,
         Midori_rounds_sub_sBox_PRINCE_4_n14,
         Midori_rounds_sub_sBox_PRINCE_4_n13,
         Midori_rounds_sub_sBox_PRINCE_4_n12,
         Midori_rounds_sub_sBox_PRINCE_4_n11,
         Midori_rounds_sub_sBox_PRINCE_4_n10,
         Midori_rounds_sub_sBox_PRINCE_4_n9,
         Midori_rounds_sub_sBox_PRINCE_4_n8,
         Midori_rounds_sub_sBox_PRINCE_4_n7,
         Midori_rounds_sub_sBox_PRINCE_4_n6,
         Midori_rounds_sub_sBox_PRINCE_4_n5,
         Midori_rounds_sub_sBox_PRINCE_4_n4,
         Midori_rounds_sub_sBox_PRINCE_4_n3,
         Midori_rounds_sub_sBox_PRINCE_4_n2,
         Midori_rounds_sub_sBox_PRINCE_4_n1,
         Midori_rounds_sub_sBox_PRINCE_5_n15,
         Midori_rounds_sub_sBox_PRINCE_5_n14,
         Midori_rounds_sub_sBox_PRINCE_5_n13,
         Midori_rounds_sub_sBox_PRINCE_5_n12,
         Midori_rounds_sub_sBox_PRINCE_5_n11,
         Midori_rounds_sub_sBox_PRINCE_5_n10,
         Midori_rounds_sub_sBox_PRINCE_5_n9,
         Midori_rounds_sub_sBox_PRINCE_5_n8,
         Midori_rounds_sub_sBox_PRINCE_5_n7,
         Midori_rounds_sub_sBox_PRINCE_5_n6,
         Midori_rounds_sub_sBox_PRINCE_5_n5,
         Midori_rounds_sub_sBox_PRINCE_5_n4,
         Midori_rounds_sub_sBox_PRINCE_5_n3,
         Midori_rounds_sub_sBox_PRINCE_5_n2,
         Midori_rounds_sub_sBox_PRINCE_5_n1,
         Midori_rounds_sub_sBox_PRINCE_6_n15,
         Midori_rounds_sub_sBox_PRINCE_6_n14,
         Midori_rounds_sub_sBox_PRINCE_6_n13,
         Midori_rounds_sub_sBox_PRINCE_6_n12,
         Midori_rounds_sub_sBox_PRINCE_6_n11,
         Midori_rounds_sub_sBox_PRINCE_6_n10,
         Midori_rounds_sub_sBox_PRINCE_6_n9,
         Midori_rounds_sub_sBox_PRINCE_6_n8,
         Midori_rounds_sub_sBox_PRINCE_6_n7,
         Midori_rounds_sub_sBox_PRINCE_6_n6,
         Midori_rounds_sub_sBox_PRINCE_6_n5,
         Midori_rounds_sub_sBox_PRINCE_6_n4,
         Midori_rounds_sub_sBox_PRINCE_6_n3,
         Midori_rounds_sub_sBox_PRINCE_6_n2,
         Midori_rounds_sub_sBox_PRINCE_6_n1,
         Midori_rounds_sub_sBox_PRINCE_7_n15,
         Midori_rounds_sub_sBox_PRINCE_7_n14,
         Midori_rounds_sub_sBox_PRINCE_7_n13,
         Midori_rounds_sub_sBox_PRINCE_7_n12,
         Midori_rounds_sub_sBox_PRINCE_7_n11,
         Midori_rounds_sub_sBox_PRINCE_7_n10,
         Midori_rounds_sub_sBox_PRINCE_7_n9,
         Midori_rounds_sub_sBox_PRINCE_7_n8,
         Midori_rounds_sub_sBox_PRINCE_7_n7,
         Midori_rounds_sub_sBox_PRINCE_7_n6,
         Midori_rounds_sub_sBox_PRINCE_7_n5,
         Midori_rounds_sub_sBox_PRINCE_7_n4,
         Midori_rounds_sub_sBox_PRINCE_7_n3,
         Midori_rounds_sub_sBox_PRINCE_7_n2,
         Midori_rounds_sub_sBox_PRINCE_7_n1,
         Midori_rounds_sub_sBox_PRINCE_8_n15,
         Midori_rounds_sub_sBox_PRINCE_8_n14,
         Midori_rounds_sub_sBox_PRINCE_8_n13,
         Midori_rounds_sub_sBox_PRINCE_8_n12,
         Midori_rounds_sub_sBox_PRINCE_8_n11,
         Midori_rounds_sub_sBox_PRINCE_8_n10,
         Midori_rounds_sub_sBox_PRINCE_8_n9,
         Midori_rounds_sub_sBox_PRINCE_8_n8,
         Midori_rounds_sub_sBox_PRINCE_8_n7,
         Midori_rounds_sub_sBox_PRINCE_8_n6,
         Midori_rounds_sub_sBox_PRINCE_8_n5,
         Midori_rounds_sub_sBox_PRINCE_8_n4,
         Midori_rounds_sub_sBox_PRINCE_8_n3,
         Midori_rounds_sub_sBox_PRINCE_8_n2,
         Midori_rounds_sub_sBox_PRINCE_8_n1,
         Midori_rounds_sub_sBox_PRINCE_9_n15,
         Midori_rounds_sub_sBox_PRINCE_9_n14,
         Midori_rounds_sub_sBox_PRINCE_9_n13,
         Midori_rounds_sub_sBox_PRINCE_9_n12,
         Midori_rounds_sub_sBox_PRINCE_9_n11,
         Midori_rounds_sub_sBox_PRINCE_9_n10,
         Midori_rounds_sub_sBox_PRINCE_9_n9,
         Midori_rounds_sub_sBox_PRINCE_9_n8,
         Midori_rounds_sub_sBox_PRINCE_9_n7,
         Midori_rounds_sub_sBox_PRINCE_9_n6,
         Midori_rounds_sub_sBox_PRINCE_9_n5,
         Midori_rounds_sub_sBox_PRINCE_9_n4,
         Midori_rounds_sub_sBox_PRINCE_9_n3,
         Midori_rounds_sub_sBox_PRINCE_9_n2,
         Midori_rounds_sub_sBox_PRINCE_9_n1,
         Midori_rounds_sub_sBox_PRINCE_10_n15,
         Midori_rounds_sub_sBox_PRINCE_10_n14,
         Midori_rounds_sub_sBox_PRINCE_10_n13,
         Midori_rounds_sub_sBox_PRINCE_10_n12,
         Midori_rounds_sub_sBox_PRINCE_10_n11,
         Midori_rounds_sub_sBox_PRINCE_10_n10,
         Midori_rounds_sub_sBox_PRINCE_10_n9,
         Midori_rounds_sub_sBox_PRINCE_10_n8,
         Midori_rounds_sub_sBox_PRINCE_10_n7,
         Midori_rounds_sub_sBox_PRINCE_10_n6,
         Midori_rounds_sub_sBox_PRINCE_10_n5,
         Midori_rounds_sub_sBox_PRINCE_10_n4,
         Midori_rounds_sub_sBox_PRINCE_10_n3,
         Midori_rounds_sub_sBox_PRINCE_10_n2,
         Midori_rounds_sub_sBox_PRINCE_10_n1,
         Midori_rounds_sub_sBox_PRINCE_11_n15,
         Midori_rounds_sub_sBox_PRINCE_11_n14,
         Midori_rounds_sub_sBox_PRINCE_11_n13,
         Midori_rounds_sub_sBox_PRINCE_11_n12,
         Midori_rounds_sub_sBox_PRINCE_11_n11,
         Midori_rounds_sub_sBox_PRINCE_11_n10,
         Midori_rounds_sub_sBox_PRINCE_11_n9,
         Midori_rounds_sub_sBox_PRINCE_11_n8,
         Midori_rounds_sub_sBox_PRINCE_11_n7,
         Midori_rounds_sub_sBox_PRINCE_11_n6,
         Midori_rounds_sub_sBox_PRINCE_11_n5,
         Midori_rounds_sub_sBox_PRINCE_11_n4,
         Midori_rounds_sub_sBox_PRINCE_11_n3,
         Midori_rounds_sub_sBox_PRINCE_11_n2,
         Midori_rounds_sub_sBox_PRINCE_11_n1,
         Midori_rounds_sub_sBox_PRINCE_12_n15,
         Midori_rounds_sub_sBox_PRINCE_12_n14,
         Midori_rounds_sub_sBox_PRINCE_12_n13,
         Midori_rounds_sub_sBox_PRINCE_12_n12,
         Midori_rounds_sub_sBox_PRINCE_12_n11,
         Midori_rounds_sub_sBox_PRINCE_12_n10,
         Midori_rounds_sub_sBox_PRINCE_12_n9,
         Midori_rounds_sub_sBox_PRINCE_12_n8,
         Midori_rounds_sub_sBox_PRINCE_12_n7,
         Midori_rounds_sub_sBox_PRINCE_12_n6,
         Midori_rounds_sub_sBox_PRINCE_12_n5,
         Midori_rounds_sub_sBox_PRINCE_12_n4,
         Midori_rounds_sub_sBox_PRINCE_12_n3,
         Midori_rounds_sub_sBox_PRINCE_12_n2,
         Midori_rounds_sub_sBox_PRINCE_12_n1,
         Midori_rounds_sub_sBox_PRINCE_13_n15,
         Midori_rounds_sub_sBox_PRINCE_13_n14,
         Midori_rounds_sub_sBox_PRINCE_13_n13,
         Midori_rounds_sub_sBox_PRINCE_13_n12,
         Midori_rounds_sub_sBox_PRINCE_13_n11,
         Midori_rounds_sub_sBox_PRINCE_13_n10,
         Midori_rounds_sub_sBox_PRINCE_13_n9,
         Midori_rounds_sub_sBox_PRINCE_13_n8,
         Midori_rounds_sub_sBox_PRINCE_13_n7,
         Midori_rounds_sub_sBox_PRINCE_13_n6,
         Midori_rounds_sub_sBox_PRINCE_13_n5,
         Midori_rounds_sub_sBox_PRINCE_13_n4,
         Midori_rounds_sub_sBox_PRINCE_13_n3,
         Midori_rounds_sub_sBox_PRINCE_13_n2,
         Midori_rounds_sub_sBox_PRINCE_13_n1,
         Midori_rounds_sub_sBox_PRINCE_14_n15,
         Midori_rounds_sub_sBox_PRINCE_14_n14,
         Midori_rounds_sub_sBox_PRINCE_14_n13,
         Midori_rounds_sub_sBox_PRINCE_14_n12,
         Midori_rounds_sub_sBox_PRINCE_14_n11,
         Midori_rounds_sub_sBox_PRINCE_14_n10,
         Midori_rounds_sub_sBox_PRINCE_14_n9,
         Midori_rounds_sub_sBox_PRINCE_14_n8,
         Midori_rounds_sub_sBox_PRINCE_14_n7,
         Midori_rounds_sub_sBox_PRINCE_14_n6,
         Midori_rounds_sub_sBox_PRINCE_14_n5,
         Midori_rounds_sub_sBox_PRINCE_14_n4,
         Midori_rounds_sub_sBox_PRINCE_14_n3,
         Midori_rounds_sub_sBox_PRINCE_14_n2,
         Midori_rounds_sub_sBox_PRINCE_14_n1,
         Midori_rounds_sub_sBox_PRINCE_15_n15,
         Midori_rounds_sub_sBox_PRINCE_15_n14,
         Midori_rounds_sub_sBox_PRINCE_15_n13,
         Midori_rounds_sub_sBox_PRINCE_15_n12,
         Midori_rounds_sub_sBox_PRINCE_15_n11,
         Midori_rounds_sub_sBox_PRINCE_15_n10,
         Midori_rounds_sub_sBox_PRINCE_15_n9,
         Midori_rounds_sub_sBox_PRINCE_15_n8,
         Midori_rounds_sub_sBox_PRINCE_15_n7,
         Midori_rounds_sub_sBox_PRINCE_15_n6,
         Midori_rounds_sub_sBox_PRINCE_15_n5,
         Midori_rounds_sub_sBox_PRINCE_15_n4,
         Midori_rounds_sub_sBox_PRINCE_15_n3,
         Midori_rounds_sub_sBox_PRINCE_15_n2,
         Midori_rounds_sub_sBox_PRINCE_15_n1, Midori_rounds_mul_MC1_n8,
         Midori_rounds_mul_MC1_n7, Midori_rounds_mul_MC1_n6,
         Midori_rounds_mul_MC1_n5, Midori_rounds_mul_MC1_n4,
         Midori_rounds_mul_MC1_n3, Midori_rounds_mul_MC1_n2,
         Midori_rounds_mul_MC1_n1, Midori_rounds_mul_MC2_n8,
         Midori_rounds_mul_MC2_n7, Midori_rounds_mul_MC2_n6,
         Midori_rounds_mul_MC2_n5, Midori_rounds_mul_MC2_n4,
         Midori_rounds_mul_MC2_n3, Midori_rounds_mul_MC2_n2,
         Midori_rounds_mul_MC2_n1, Midori_rounds_mul_MC3_n8,
         Midori_rounds_mul_MC3_n7, Midori_rounds_mul_MC3_n6,
         Midori_rounds_mul_MC3_n5, Midori_rounds_mul_MC3_n4,
         Midori_rounds_mul_MC3_n3, Midori_rounds_mul_MC3_n2,
         Midori_rounds_mul_MC3_n1, Midori_rounds_mul_MC4_n8,
         Midori_rounds_mul_MC4_n7, Midori_rounds_mul_MC4_n6,
         Midori_rounds_mul_MC4_n5, Midori_rounds_mul_MC4_n4,
         Midori_rounds_mul_MC4_n3, Midori_rounds_mul_MC4_n2,
         Midori_rounds_mul_MC4_n1;
  wire   [63:0] wk;
  wire   [3:0] round_Signal;
  wire   [63:0] Midori_add_Result_Start;
  wire   [63:0] Midori_rounds_mul_ResultXORkey;
  wire   [63:0] Midori_rounds_SR_Inv_Result;
  (* AGEMA = "layer" *) wire   [63:0] Midori_rounds_mul_input;
  (* AGEMA = "layer" *) wire   [63:0] Midori_rounds_sub_ResultXORkey;
  (* AGEMA = "layer" *) wire   [63:0] Midori_rounds_SR_Result;
  wire   [63:0] Midori_rounds_roundReg_out;
  wire   [63:0] Midori_rounds_round_Result;
  wire   [15:0] Midori_rounds_round_Constant;

  XOR2_X1 keys_U64 ( .A(key[73]), .B(key[9]), .Z(wk[9]) );
  XOR2_X1 keys_U63 ( .A(key[72]), .B(key[8]), .Z(wk[8]) );
  XOR2_X1 keys_U62 ( .A(key[71]), .B(key[7]), .Z(wk[7]) );
  XOR2_X1 keys_U61 ( .A(key[6]), .B(key[70]), .Z(wk[6]) );
  XOR2_X1 keys_U60 ( .A(key[127]), .B(key[63]), .Z(wk[63]) );
  XOR2_X1 keys_U59 ( .A(key[126]), .B(key[62]), .Z(wk[62]) );
  XOR2_X1 keys_U58 ( .A(key[125]), .B(key[61]), .Z(wk[61]) );
  XOR2_X1 keys_U57 ( .A(key[124]), .B(key[60]), .Z(wk[60]) );
  XOR2_X1 keys_U56 ( .A(key[5]), .B(key[69]), .Z(wk[5]) );
  XOR2_X1 keys_U55 ( .A(key[123]), .B(key[59]), .Z(wk[59]) );
  XOR2_X1 keys_U54 ( .A(key[122]), .B(key[58]), .Z(wk[58]) );
  XOR2_X1 keys_U53 ( .A(key[121]), .B(key[57]), .Z(wk[57]) );
  XOR2_X1 keys_U52 ( .A(key[120]), .B(key[56]), .Z(wk[56]) );
  XOR2_X1 keys_U51 ( .A(key[119]), .B(key[55]), .Z(wk[55]) );
  XOR2_X1 keys_U50 ( .A(key[118]), .B(key[54]), .Z(wk[54]) );
  XOR2_X1 keys_U49 ( .A(key[117]), .B(key[53]), .Z(wk[53]) );
  XOR2_X1 keys_U48 ( .A(key[116]), .B(key[52]), .Z(wk[52]) );
  XOR2_X1 keys_U47 ( .A(key[115]), .B(key[51]), .Z(wk[51]) );
  XOR2_X1 keys_U46 ( .A(key[114]), .B(key[50]), .Z(wk[50]) );
  XOR2_X1 keys_U45 ( .A(key[4]), .B(key[68]), .Z(wk[4]) );
  XOR2_X1 keys_U44 ( .A(key[113]), .B(key[49]), .Z(wk[49]) );
  XOR2_X1 keys_U43 ( .A(key[112]), .B(key[48]), .Z(wk[48]) );
  XOR2_X1 keys_U42 ( .A(key[111]), .B(key[47]), .Z(wk[47]) );
  XOR2_X1 keys_U41 ( .A(key[110]), .B(key[46]), .Z(wk[46]) );
  XOR2_X1 keys_U40 ( .A(key[109]), .B(key[45]), .Z(wk[45]) );
  XOR2_X1 keys_U39 ( .A(key[108]), .B(key[44]), .Z(wk[44]) );
  XOR2_X1 keys_U38 ( .A(key[107]), .B(key[43]), .Z(wk[43]) );
  XOR2_X1 keys_U37 ( .A(key[106]), .B(key[42]), .Z(wk[42]) );
  XOR2_X1 keys_U36 ( .A(key[105]), .B(key[41]), .Z(wk[41]) );
  XOR2_X1 keys_U35 ( .A(key[104]), .B(key[40]), .Z(wk[40]) );
  XOR2_X1 keys_U34 ( .A(key[3]), .B(key[67]), .Z(wk[3]) );
  XOR2_X1 keys_U33 ( .A(key[103]), .B(key[39]), .Z(wk[39]) );
  XOR2_X1 keys_U32 ( .A(key[102]), .B(key[38]), .Z(wk[38]) );
  XOR2_X1 keys_U31 ( .A(key[101]), .B(key[37]), .Z(wk[37]) );
  XOR2_X1 keys_U30 ( .A(key[100]), .B(key[36]), .Z(wk[36]) );
  XOR2_X1 keys_U29 ( .A(key[35]), .B(key[99]), .Z(wk[35]) );
  XOR2_X1 keys_U28 ( .A(key[34]), .B(key[98]), .Z(wk[34]) );
  XOR2_X1 keys_U27 ( .A(key[33]), .B(key[97]), .Z(wk[33]) );
  XOR2_X1 keys_U26 ( .A(key[32]), .B(key[96]), .Z(wk[32]) );
  XOR2_X1 keys_U25 ( .A(key[31]), .B(key[95]), .Z(wk[31]) );
  XOR2_X1 keys_U24 ( .A(key[30]), .B(key[94]), .Z(wk[30]) );
  XOR2_X1 keys_U23 ( .A(key[2]), .B(key[66]), .Z(wk[2]) );
  XOR2_X1 keys_U22 ( .A(key[29]), .B(key[93]), .Z(wk[29]) );
  XOR2_X1 keys_U21 ( .A(key[28]), .B(key[92]), .Z(wk[28]) );
  XOR2_X1 keys_U20 ( .A(key[27]), .B(key[91]), .Z(wk[27]) );
  XOR2_X1 keys_U19 ( .A(key[26]), .B(key[90]), .Z(wk[26]) );
  XOR2_X1 keys_U18 ( .A(key[25]), .B(key[89]), .Z(wk[25]) );
  XOR2_X1 keys_U17 ( .A(key[24]), .B(key[88]), .Z(wk[24]) );
  XOR2_X1 keys_U16 ( .A(key[23]), .B(key[87]), .Z(wk[23]) );
  XOR2_X1 keys_U15 ( .A(key[22]), .B(key[86]), .Z(wk[22]) );
  XOR2_X1 keys_U14 ( .A(key[21]), .B(key[85]), .Z(wk[21]) );
  XOR2_X1 keys_U13 ( .A(key[20]), .B(key[84]), .Z(wk[20]) );
  XOR2_X1 keys_U12 ( .A(key[1]), .B(key[65]), .Z(wk[1]) );
  XOR2_X1 keys_U11 ( .A(key[19]), .B(key[83]), .Z(wk[19]) );
  XOR2_X1 keys_U10 ( .A(key[18]), .B(key[82]), .Z(wk[18]) );
  XOR2_X1 keys_U9 ( .A(key[17]), .B(key[81]), .Z(wk[17]) );
  XOR2_X1 keys_U8 ( .A(key[16]), .B(key[80]), .Z(wk[16]) );
  XOR2_X1 keys_U7 ( .A(key[15]), .B(key[79]), .Z(wk[15]) );
  XOR2_X1 keys_U6 ( .A(key[14]), .B(key[78]), .Z(wk[14]) );
  XOR2_X1 keys_U5 ( .A(key[13]), .B(key[77]), .Z(wk[13]) );
  XOR2_X1 keys_U4 ( .A(key[12]), .B(key[76]), .Z(wk[12]) );
  XOR2_X1 keys_U3 ( .A(key[11]), .B(key[75]), .Z(wk[11]) );
  XOR2_X1 keys_U2 ( .A(key[10]), .B(key[74]), .Z(wk[10]) );
  XOR2_X1 keys_U1 ( .A(key[0]), .B(key[64]), .Z(wk[0]) );
  NOR2_X1 controller_U5 ( .A1(controller_n4), .A2(controller_n3), .ZN(done) );
  NAND2_X1 controller_U4 ( .A1(round_Signal[0]), .A2(round_Signal[1]), .ZN(
        controller_n3) );
  NAND2_X1 controller_U3 ( .A1(round_Signal[2]), .A2(round_Signal[3]), .ZN(
        controller_n4) );
  INV_X1 controller_U2 ( .A(reset), .ZN(controller_n2) );
  NAND2_X1 controller_U1 ( .A1(done), .A2(controller_n2), .ZN(RegEnable) );
  NOR2_X1 controller_roundCounter_U11 ( .A1(reset), .A2(
        controller_roundCounter_n9), .ZN(controller_roundCounter_n27) );
  XNOR2_X1 controller_roundCounter_U10 ( .A(round_Signal[0]), .B(RegEnable), 
        .ZN(controller_roundCounter_n9) );
  NOR2_X1 controller_roundCounter_U9 ( .A1(reset), .A2(
        controller_roundCounter_n8), .ZN(controller_roundCounter_n26) );
  XOR2_X1 controller_roundCounter_U8 ( .A(round_Signal[1]), .B(
        controller_roundCounter_n7), .Z(controller_roundCounter_n8) );
  NOR2_X1 controller_roundCounter_U7 ( .A1(reset), .A2(
        controller_roundCounter_n6), .ZN(controller_roundCounter_n25) );
  XNOR2_X1 controller_roundCounter_U6 ( .A(round_Signal[2]), .B(
        controller_roundCounter_n5), .ZN(controller_roundCounter_n6) );
  NOR2_X1 controller_roundCounter_U5 ( .A1(reset), .A2(
        controller_roundCounter_n4), .ZN(controller_roundCounter_n24) );
  XOR2_X1 controller_roundCounter_U4 ( .A(round_Signal[3]), .B(
        controller_roundCounter_n3), .Z(controller_roundCounter_n4) );
  NAND2_X1 controller_roundCounter_U3 ( .A1(controller_roundCounter_n5), .A2(
        round_Signal[2]), .ZN(controller_roundCounter_n3) );
  NOR2_X1 controller_roundCounter_U2 ( .A1(controller_roundCounter_n1), .A2(
        controller_roundCounter_n7), .ZN(controller_roundCounter_n5) );
  NAND2_X1 controller_roundCounter_U1 ( .A1(RegEnable), .A2(round_Signal[0]), 
        .ZN(controller_roundCounter_n7) );
  INV_X1 controller_roundCounter_count_reg_0__U1 ( .A(round_Signal[0]), .ZN(
        controller_roundCounter_count_reg_0__QN) );
  DFF_X1 controller_roundCounter_count_reg_0__FF_FF ( .D(
        controller_roundCounter_n27), .CK(clk), .Q(round_Signal[0]), .QN() );
  INV_X1 controller_roundCounter_count_reg_1__U1 ( .A(round_Signal[1]), .ZN(
        controller_roundCounter_n1) );
  DFF_X1 controller_roundCounter_count_reg_1__FF_FF ( .D(
        controller_roundCounter_n26), .CK(clk), .Q(round_Signal[1]), .QN() );
  INV_X1 controller_roundCounter_count_reg_2__U1 ( .A(round_Signal[2]), .ZN(
        controller_roundCounter_count_reg_2__QN) );
  DFF_X1 controller_roundCounter_count_reg_2__FF_FF ( .D(
        controller_roundCounter_n25), .CK(clk), .Q(round_Signal[2]), .QN() );
  INV_X1 controller_roundCounter_count_reg_3__U1 ( .A(round_Signal[3]), .ZN(
        controller_roundCounter_count_reg_3__QN) );
  DFF_X1 controller_roundCounter_count_reg_3__FF_FF ( .D(
        controller_roundCounter_n24), .CK(clk), .Q(round_Signal[3]), .QN() );
  XOR2_X1 Midori_U128 ( .A(wk[9]), .B(Midori_rounds_SR_Result[9]), .Z(
        DataOut[9]) );
  XOR2_X1 Midori_U127 ( .A(wk[8]), .B(Midori_rounds_SR_Result[8]), .Z(
        DataOut[8]) );
  XOR2_X1 Midori_U126 ( .A(wk[7]), .B(Midori_rounds_SR_Result[47]), .Z(
        DataOut[7]) );
  XOR2_X1 Midori_U125 ( .A(wk[6]), .B(Midori_rounds_SR_Result[46]), .Z(
        DataOut[6]) );
  XOR2_X1 Midori_U124 ( .A(wk[63]), .B(Midori_rounds_SR_Result[63]), .Z(
        DataOut[63]) );
  XOR2_X1 Midori_U123 ( .A(wk[62]), .B(Midori_rounds_SR_Result[62]), .Z(
        DataOut[62]) );
  XOR2_X1 Midori_U122 ( .A(wk[61]), .B(Midori_rounds_SR_Result[61]), .Z(
        DataOut[61]) );
  XOR2_X1 Midori_U121 ( .A(wk[60]), .B(Midori_rounds_SR_Result[60]), .Z(
        DataOut[60]) );
  XOR2_X1 Midori_U120 ( .A(wk[5]), .B(Midori_rounds_SR_Result[45]), .Z(
        DataOut[5]) );
  XOR2_X1 Midori_U119 ( .A(wk[59]), .B(Midori_rounds_SR_Result[35]), .Z(
        DataOut[59]) );
  XOR2_X1 Midori_U118 ( .A(wk[58]), .B(Midori_rounds_SR_Result[34]), .Z(
        DataOut[58]) );
  XOR2_X1 Midori_U117 ( .A(wk[57]), .B(Midori_rounds_SR_Result[33]), .Z(
        DataOut[57]) );
  XOR2_X1 Midori_U116 ( .A(wk[56]), .B(Midori_rounds_SR_Result[32]), .Z(
        DataOut[56]) );
  XOR2_X1 Midori_U115 ( .A(wk[55]), .B(Midori_rounds_SR_Result[7]), .Z(
        DataOut[55]) );
  XOR2_X1 Midori_U114 ( .A(wk[54]), .B(Midori_rounds_SR_Result[6]), .Z(
        DataOut[54]) );
  XOR2_X1 Midori_U113 ( .A(wk[53]), .B(Midori_rounds_SR_Result[5]), .Z(
        DataOut[53]) );
  XOR2_X1 Midori_U112 ( .A(wk[52]), .B(Midori_rounds_SR_Result[4]), .Z(
        DataOut[52]) );
  XOR2_X1 Midori_U111 ( .A(wk[51]), .B(Midori_rounds_SR_Result[27]), .Z(
        DataOut[51]) );
  XOR2_X1 Midori_U110 ( .A(wk[50]), .B(Midori_rounds_SR_Result[26]), .Z(
        DataOut[50]) );
  XOR2_X1 Midori_U109 ( .A(wk[4]), .B(Midori_rounds_SR_Result[44]), .Z(
        DataOut[4]) );
  XOR2_X1 Midori_U108 ( .A(wk[49]), .B(Midori_rounds_SR_Result[25]), .Z(
        DataOut[49]) );
  XOR2_X1 Midori_U107 ( .A(wk[48]), .B(Midori_rounds_SR_Result[24]), .Z(
        DataOut[48]) );
  XOR2_X1 Midori_U106 ( .A(wk[47]), .B(Midori_rounds_SR_Result[43]), .Z(
        DataOut[47]) );
  XOR2_X1 Midori_U105 ( .A(wk[46]), .B(Midori_rounds_SR_Result[42]), .Z(
        DataOut[46]) );
  XOR2_X1 Midori_U104 ( .A(wk[45]), .B(Midori_rounds_SR_Result[41]), .Z(
        DataOut[45]) );
  XOR2_X1 Midori_U103 ( .A(wk[44]), .B(Midori_rounds_SR_Result[40]), .Z(
        DataOut[44]) );
  XOR2_X1 Midori_U102 ( .A(wk[43]), .B(Midori_rounds_SR_Result[55]), .Z(
        DataOut[43]) );
  XOR2_X1 Midori_U101 ( .A(wk[42]), .B(Midori_rounds_SR_Result[54]), .Z(
        DataOut[42]) );
  XOR2_X1 Midori_U100 ( .A(wk[41]), .B(Midori_rounds_SR_Result[53]), .Z(
        DataOut[41]) );
  XOR2_X1 Midori_U99 ( .A(wk[40]), .B(Midori_rounds_SR_Result[52]), .Z(
        DataOut[40]) );
  XOR2_X1 Midori_U98 ( .A(wk[3]), .B(Midori_rounds_SR_Result[51]), .Z(
        DataOut[3]) );
  XOR2_X1 Midori_U97 ( .A(wk[39]), .B(Midori_rounds_SR_Result[19]), .Z(
        DataOut[39]) );
  XOR2_X1 Midori_U96 ( .A(wk[38]), .B(Midori_rounds_SR_Result[18]), .Z(
        DataOut[38]) );
  XOR2_X1 Midori_U95 ( .A(wk[37]), .B(Midori_rounds_SR_Result[17]), .Z(
        DataOut[37]) );
  XOR2_X1 Midori_U94 ( .A(wk[36]), .B(Midori_rounds_SR_Result[16]), .Z(
        DataOut[36]) );
  XOR2_X1 Midori_U93 ( .A(wk[35]), .B(Midori_rounds_SR_Result[15]), .Z(
        DataOut[35]) );
  XOR2_X1 Midori_U92 ( .A(wk[34]), .B(Midori_rounds_SR_Result[14]), .Z(
        DataOut[34]) );
  XOR2_X1 Midori_U91 ( .A(wk[33]), .B(Midori_rounds_SR_Result[13]), .Z(
        DataOut[33]) );
  XOR2_X1 Midori_U90 ( .A(wk[32]), .B(Midori_rounds_SR_Result[12]), .Z(
        DataOut[32]) );
  XOR2_X1 Midori_U89 ( .A(wk[31]), .B(Midori_rounds_SR_Result[3]), .Z(
        DataOut[31]) );
  XOR2_X1 Midori_U88 ( .A(wk[30]), .B(Midori_rounds_SR_Result[2]), .Z(
        DataOut[30]) );
  XOR2_X1 Midori_U87 ( .A(wk[2]), .B(Midori_rounds_SR_Result[50]), .Z(
        DataOut[2]) );
  XOR2_X1 Midori_U86 ( .A(wk[29]), .B(Midori_rounds_SR_Result[1]), .Z(
        DataOut[29]) );
  XOR2_X1 Midori_U85 ( .A(wk[28]), .B(Midori_rounds_SR_Result[0]), .Z(
        DataOut[28]) );
  XOR2_X1 Midori_U84 ( .A(wk[27]), .B(Midori_rounds_SR_Result[31]), .Z(
        DataOut[27]) );
  XOR2_X1 Midori_U83 ( .A(wk[26]), .B(Midori_rounds_SR_Result[30]), .Z(
        DataOut[26]) );
  XOR2_X1 Midori_U82 ( .A(wk[25]), .B(Midori_rounds_SR_Result[29]), .Z(
        DataOut[25]) );
  XOR2_X1 Midori_U81 ( .A(wk[24]), .B(Midori_rounds_SR_Result[28]), .Z(
        DataOut[24]) );
  XOR2_X1 Midori_U80 ( .A(wk[23]), .B(Midori_rounds_SR_Result[59]), .Z(
        DataOut[23]) );
  XOR2_X1 Midori_U79 ( .A(wk[22]), .B(Midori_rounds_SR_Result[58]), .Z(
        DataOut[22]) );
  XOR2_X1 Midori_U78 ( .A(wk[21]), .B(Midori_rounds_SR_Result[57]), .Z(
        DataOut[21]) );
  XOR2_X1 Midori_U77 ( .A(wk[20]), .B(Midori_rounds_SR_Result[56]), .Z(
        DataOut[20]) );
  XOR2_X1 Midori_U76 ( .A(wk[1]), .B(Midori_rounds_SR_Result[49]), .Z(
        DataOut[1]) );
  XOR2_X1 Midori_U75 ( .A(wk[19]), .B(Midori_rounds_SR_Result[39]), .Z(
        DataOut[19]) );
  XOR2_X1 Midori_U74 ( .A(wk[18]), .B(Midori_rounds_SR_Result[38]), .Z(
        DataOut[18]) );
  XOR2_X1 Midori_U73 ( .A(wk[17]), .B(Midori_rounds_SR_Result[37]), .Z(
        DataOut[17]) );
  XOR2_X1 Midori_U72 ( .A(wk[16]), .B(Midori_rounds_SR_Result[36]), .Z(
        DataOut[16]) );
  XOR2_X1 Midori_U71 ( .A(wk[15]), .B(Midori_rounds_SR_Result[23]), .Z(
        DataOut[15]) );
  XOR2_X1 Midori_U70 ( .A(wk[14]), .B(Midori_rounds_SR_Result[22]), .Z(
        DataOut[14]) );
  XOR2_X1 Midori_U69 ( .A(wk[13]), .B(Midori_rounds_SR_Result[21]), .Z(
        DataOut[13]) );
  XOR2_X1 Midori_U68 ( .A(wk[12]), .B(Midori_rounds_SR_Result[20]), .Z(
        DataOut[12]) );
  XOR2_X1 Midori_U67 ( .A(wk[11]), .B(Midori_rounds_SR_Result[11]), .Z(
        DataOut[11]) );
  XOR2_X1 Midori_U66 ( .A(wk[10]), .B(Midori_rounds_SR_Result[10]), .Z(
        DataOut[10]) );
  XOR2_X1 Midori_U65 ( .A(wk[0]), .B(Midori_rounds_SR_Result[48]), .Z(
        DataOut[0]) );
  XOR2_X1 Midori_U64 ( .A(wk[9]), .B(DataIn[9]), .Z(Midori_add_Result_Start[9]) );
  XOR2_X1 Midori_U63 ( .A(wk[8]), .B(DataIn[8]), .Z(Midori_add_Result_Start[8]) );
  XOR2_X1 Midori_U62 ( .A(wk[7]), .B(DataIn[7]), .Z(Midori_add_Result_Start[7]) );
  XOR2_X1 Midori_U61 ( .A(wk[6]), .B(DataIn[6]), .Z(Midori_add_Result_Start[6]) );
  XOR2_X1 Midori_U60 ( .A(wk[63]), .B(DataIn[63]), .Z(
        Midori_add_Result_Start[63]) );
  XOR2_X1 Midori_U59 ( .A(wk[62]), .B(DataIn[62]), .Z(
        Midori_add_Result_Start[62]) );
  XOR2_X1 Midori_U58 ( .A(wk[61]), .B(DataIn[61]), .Z(
        Midori_add_Result_Start[61]) );
  XOR2_X1 Midori_U57 ( .A(wk[60]), .B(DataIn[60]), .Z(
        Midori_add_Result_Start[60]) );
  XOR2_X1 Midori_U56 ( .A(wk[5]), .B(DataIn[5]), .Z(Midori_add_Result_Start[5]) );
  XOR2_X1 Midori_U55 ( .A(wk[59]), .B(DataIn[59]), .Z(
        Midori_add_Result_Start[59]) );
  XOR2_X1 Midori_U54 ( .A(wk[58]), .B(DataIn[58]), .Z(
        Midori_add_Result_Start[58]) );
  XOR2_X1 Midori_U53 ( .A(wk[57]), .B(DataIn[57]), .Z(
        Midori_add_Result_Start[57]) );
  XOR2_X1 Midori_U52 ( .A(wk[56]), .B(DataIn[56]), .Z(
        Midori_add_Result_Start[56]) );
  XOR2_X1 Midori_U51 ( .A(wk[55]), .B(DataIn[55]), .Z(
        Midori_add_Result_Start[55]) );
  XOR2_X1 Midori_U50 ( .A(wk[54]), .B(DataIn[54]), .Z(
        Midori_add_Result_Start[54]) );
  XOR2_X1 Midori_U49 ( .A(wk[53]), .B(DataIn[53]), .Z(
        Midori_add_Result_Start[53]) );
  XOR2_X1 Midori_U48 ( .A(wk[52]), .B(DataIn[52]), .Z(
        Midori_add_Result_Start[52]) );
  XOR2_X1 Midori_U47 ( .A(wk[51]), .B(DataIn[51]), .Z(
        Midori_add_Result_Start[51]) );
  XOR2_X1 Midori_U46 ( .A(wk[50]), .B(DataIn[50]), .Z(
        Midori_add_Result_Start[50]) );
  XOR2_X1 Midori_U45 ( .A(wk[4]), .B(DataIn[4]), .Z(Midori_add_Result_Start[4]) );
  XOR2_X1 Midori_U44 ( .A(wk[49]), .B(DataIn[49]), .Z(
        Midori_add_Result_Start[49]) );
  XOR2_X1 Midori_U43 ( .A(wk[48]), .B(DataIn[48]), .Z(
        Midori_add_Result_Start[48]) );
  XOR2_X1 Midori_U42 ( .A(wk[47]), .B(DataIn[47]), .Z(
        Midori_add_Result_Start[47]) );
  XOR2_X1 Midori_U41 ( .A(wk[46]), .B(DataIn[46]), .Z(
        Midori_add_Result_Start[46]) );
  XOR2_X1 Midori_U40 ( .A(wk[45]), .B(DataIn[45]), .Z(
        Midori_add_Result_Start[45]) );
  XOR2_X1 Midori_U39 ( .A(wk[44]), .B(DataIn[44]), .Z(
        Midori_add_Result_Start[44]) );
  XOR2_X1 Midori_U38 ( .A(wk[43]), .B(DataIn[43]), .Z(
        Midori_add_Result_Start[43]) );
  XOR2_X1 Midori_U37 ( .A(wk[42]), .B(DataIn[42]), .Z(
        Midori_add_Result_Start[42]) );
  XOR2_X1 Midori_U36 ( .A(wk[41]), .B(DataIn[41]), .Z(
        Midori_add_Result_Start[41]) );
  XOR2_X1 Midori_U35 ( .A(wk[40]), .B(DataIn[40]), .Z(
        Midori_add_Result_Start[40]) );
  XOR2_X1 Midori_U34 ( .A(wk[3]), .B(DataIn[3]), .Z(Midori_add_Result_Start[3]) );
  XOR2_X1 Midori_U33 ( .A(wk[39]), .B(DataIn[39]), .Z(
        Midori_add_Result_Start[39]) );
  XOR2_X1 Midori_U32 ( .A(wk[38]), .B(DataIn[38]), .Z(
        Midori_add_Result_Start[38]) );
  XOR2_X1 Midori_U31 ( .A(wk[37]), .B(DataIn[37]), .Z(
        Midori_add_Result_Start[37]) );
  XOR2_X1 Midori_U30 ( .A(wk[36]), .B(DataIn[36]), .Z(
        Midori_add_Result_Start[36]) );
  XOR2_X1 Midori_U29 ( .A(wk[35]), .B(DataIn[35]), .Z(
        Midori_add_Result_Start[35]) );
  XOR2_X1 Midori_U28 ( .A(wk[34]), .B(DataIn[34]), .Z(
        Midori_add_Result_Start[34]) );
  XOR2_X1 Midori_U27 ( .A(wk[33]), .B(DataIn[33]), .Z(
        Midori_add_Result_Start[33]) );
  XOR2_X1 Midori_U26 ( .A(wk[32]), .B(DataIn[32]), .Z(
        Midori_add_Result_Start[32]) );
  XOR2_X1 Midori_U25 ( .A(wk[31]), .B(DataIn[31]), .Z(
        Midori_add_Result_Start[31]) );
  XOR2_X1 Midori_U24 ( .A(wk[30]), .B(DataIn[30]), .Z(
        Midori_add_Result_Start[30]) );
  XOR2_X1 Midori_U23 ( .A(wk[2]), .B(DataIn[2]), .Z(Midori_add_Result_Start[2]) );
  XOR2_X1 Midori_U22 ( .A(wk[29]), .B(DataIn[29]), .Z(
        Midori_add_Result_Start[29]) );
  XOR2_X1 Midori_U21 ( .A(wk[28]), .B(DataIn[28]), .Z(
        Midori_add_Result_Start[28]) );
  XOR2_X1 Midori_U20 ( .A(wk[27]), .B(DataIn[27]), .Z(
        Midori_add_Result_Start[27]) );
  XOR2_X1 Midori_U19 ( .A(wk[26]), .B(DataIn[26]), .Z(
        Midori_add_Result_Start[26]) );
  XOR2_X1 Midori_U18 ( .A(wk[25]), .B(DataIn[25]), .Z(
        Midori_add_Result_Start[25]) );
  XOR2_X1 Midori_U17 ( .A(wk[24]), .B(DataIn[24]), .Z(
        Midori_add_Result_Start[24]) );
  XOR2_X1 Midori_U16 ( .A(wk[23]), .B(DataIn[23]), .Z(
        Midori_add_Result_Start[23]) );
  XOR2_X1 Midori_U15 ( .A(wk[22]), .B(DataIn[22]), .Z(
        Midori_add_Result_Start[22]) );
  XOR2_X1 Midori_U14 ( .A(wk[21]), .B(DataIn[21]), .Z(
        Midori_add_Result_Start[21]) );
  XOR2_X1 Midori_U13 ( .A(wk[20]), .B(DataIn[20]), .Z(
        Midori_add_Result_Start[20]) );
  XOR2_X1 Midori_U12 ( .A(wk[1]), .B(DataIn[1]), .Z(Midori_add_Result_Start[1]) );
  XOR2_X1 Midori_U11 ( .A(wk[19]), .B(DataIn[19]), .Z(
        Midori_add_Result_Start[19]) );
  XOR2_X1 Midori_U10 ( .A(wk[18]), .B(DataIn[18]), .Z(
        Midori_add_Result_Start[18]) );
  XOR2_X1 Midori_U9 ( .A(wk[17]), .B(DataIn[17]), .Z(
        Midori_add_Result_Start[17]) );
  XOR2_X1 Midori_U8 ( .A(wk[16]), .B(DataIn[16]), .Z(
        Midori_add_Result_Start[16]) );
  XOR2_X1 Midori_U7 ( .A(wk[15]), .B(DataIn[15]), .Z(
        Midori_add_Result_Start[15]) );
  XOR2_X1 Midori_U6 ( .A(wk[14]), .B(DataIn[14]), .Z(
        Midori_add_Result_Start[14]) );
  XOR2_X1 Midori_U5 ( .A(wk[13]), .B(DataIn[13]), .Z(
        Midori_add_Result_Start[13]) );
  XOR2_X1 Midori_U4 ( .A(wk[12]), .B(DataIn[12]), .Z(
        Midori_add_Result_Start[12]) );
  XOR2_X1 Midori_U3 ( .A(wk[11]), .B(DataIn[11]), .Z(
        Midori_add_Result_Start[11]) );
  XOR2_X1 Midori_U2 ( .A(wk[10]), .B(DataIn[10]), .Z(
        Midori_add_Result_Start[10]) );
  XOR2_X1 Midori_U1 ( .A(wk[0]), .B(DataIn[0]), .Z(Midori_add_Result_Start[0])
         );
  XOR2_X1 Midori_rounds_U144 ( .A(Midori_rounds_SelectedKey_9_), .B(
        Midori_rounds_SR_Result[9]), .Z(Midori_rounds_sub_ResultXORkey[9]) );
  XNOR2_X1 Midori_rounds_U143 ( .A(Midori_rounds_SR_Result[8]), .B(
        Midori_rounds_n16), .ZN(Midori_rounds_sub_ResultXORkey[8]) );
  XOR2_X1 Midori_rounds_U142 ( .A(Midori_rounds_SelectedKey_7_), .B(
        Midori_rounds_SR_Result[47]), .Z(Midori_rounds_sub_ResultXORkey[7]) );
  XOR2_X1 Midori_rounds_U141 ( .A(Midori_rounds_SelectedKey_6_), .B(
        Midori_rounds_SR_Result[46]), .Z(Midori_rounds_sub_ResultXORkey[6]) );
  XOR2_X1 Midori_rounds_U140 ( .A(Midori_rounds_SelectedKey_63_), .B(
        Midori_rounds_SR_Result[63]), .Z(Midori_rounds_sub_ResultXORkey[63])
         );
  XOR2_X1 Midori_rounds_U139 ( .A(Midori_rounds_SelectedKey_62_), .B(
        Midori_rounds_SR_Result[62]), .Z(Midori_rounds_sub_ResultXORkey[62])
         );
  XOR2_X1 Midori_rounds_U138 ( .A(Midori_rounds_SelectedKey_61_), .B(
        Midori_rounds_SR_Result[61]), .Z(Midori_rounds_sub_ResultXORkey[61])
         );
  XNOR2_X1 Midori_rounds_U137 ( .A(Midori_rounds_SR_Result[60]), .B(
        Midori_rounds_n15), .ZN(Midori_rounds_sub_ResultXORkey[60]) );
  XOR2_X1 Midori_rounds_U136 ( .A(Midori_rounds_SelectedKey_5_), .B(
        Midori_rounds_SR_Result[45]), .Z(Midori_rounds_sub_ResultXORkey[5]) );
  XOR2_X1 Midori_rounds_U135 ( .A(Midori_rounds_SelectedKey_59_), .B(
        Midori_rounds_SR_Result[35]), .Z(Midori_rounds_sub_ResultXORkey[59])
         );
  XOR2_X1 Midori_rounds_U134 ( .A(Midori_rounds_SelectedKey_58_), .B(
        Midori_rounds_SR_Result[34]), .Z(Midori_rounds_sub_ResultXORkey[58])
         );
  XOR2_X1 Midori_rounds_U133 ( .A(Midori_rounds_SelectedKey_57_), .B(
        Midori_rounds_SR_Result[33]), .Z(Midori_rounds_sub_ResultXORkey[57])
         );
  XNOR2_X1 Midori_rounds_U132 ( .A(Midori_rounds_SR_Result[32]), .B(
        Midori_rounds_n14), .ZN(Midori_rounds_sub_ResultXORkey[56]) );
  XOR2_X1 Midori_rounds_U131 ( .A(Midori_rounds_SelectedKey_55_), .B(
        Midori_rounds_SR_Result[7]), .Z(Midori_rounds_sub_ResultXORkey[55]) );
  XOR2_X1 Midori_rounds_U130 ( .A(Midori_rounds_SelectedKey_54_), .B(
        Midori_rounds_SR_Result[6]), .Z(Midori_rounds_sub_ResultXORkey[54]) );
  XOR2_X1 Midori_rounds_U129 ( .A(Midori_rounds_SelectedKey_53_), .B(
        Midori_rounds_SR_Result[5]), .Z(Midori_rounds_sub_ResultXORkey[53]) );
  XNOR2_X1 Midori_rounds_U128 ( .A(Midori_rounds_SR_Result[4]), .B(
        Midori_rounds_n13), .ZN(Midori_rounds_sub_ResultXORkey[52]) );
  XOR2_X1 Midori_rounds_U127 ( .A(Midori_rounds_SelectedKey_51_), .B(
        Midori_rounds_SR_Result[27]), .Z(Midori_rounds_sub_ResultXORkey[51])
         );
  XOR2_X1 Midori_rounds_U126 ( .A(Midori_rounds_SelectedKey_50_), .B(
        Midori_rounds_SR_Result[26]), .Z(Midori_rounds_sub_ResultXORkey[50])
         );
  XNOR2_X1 Midori_rounds_U125 ( .A(Midori_rounds_SR_Result[44]), .B(
        Midori_rounds_n12), .ZN(Midori_rounds_sub_ResultXORkey[4]) );
  XOR2_X1 Midori_rounds_U124 ( .A(Midori_rounds_SelectedKey_49_), .B(
        Midori_rounds_SR_Result[25]), .Z(Midori_rounds_sub_ResultXORkey[49])
         );
  XNOR2_X1 Midori_rounds_U123 ( .A(Midori_rounds_SR_Result[24]), .B(
        Midori_rounds_n11), .ZN(Midori_rounds_sub_ResultXORkey[48]) );
  XOR2_X1 Midori_rounds_U122 ( .A(Midori_rounds_SelectedKey_47_), .B(
        Midori_rounds_SR_Result[43]), .Z(Midori_rounds_sub_ResultXORkey[47])
         );
  XOR2_X1 Midori_rounds_U121 ( .A(Midori_rounds_SelectedKey_46_), .B(
        Midori_rounds_SR_Result[42]), .Z(Midori_rounds_sub_ResultXORkey[46])
         );
  XOR2_X1 Midori_rounds_U120 ( .A(Midori_rounds_SelectedKey_45_), .B(
        Midori_rounds_SR_Result[41]), .Z(Midori_rounds_sub_ResultXORkey[45])
         );
  XNOR2_X1 Midori_rounds_U119 ( .A(Midori_rounds_SR_Result[40]), .B(
        Midori_rounds_n10), .ZN(Midori_rounds_sub_ResultXORkey[44]) );
  XOR2_X1 Midori_rounds_U118 ( .A(Midori_rounds_SelectedKey_43_), .B(
        Midori_rounds_SR_Result[55]), .Z(Midori_rounds_sub_ResultXORkey[43])
         );
  XOR2_X1 Midori_rounds_U117 ( .A(Midori_rounds_SelectedKey_42_), .B(
        Midori_rounds_SR_Result[54]), .Z(Midori_rounds_sub_ResultXORkey[42])
         );
  XOR2_X1 Midori_rounds_U116 ( .A(Midori_rounds_SelectedKey_41_), .B(
        Midori_rounds_SR_Result[53]), .Z(Midori_rounds_sub_ResultXORkey[41])
         );
  XNOR2_X1 Midori_rounds_U115 ( .A(Midori_rounds_SR_Result[52]), .B(
        Midori_rounds_n9), .ZN(Midori_rounds_sub_ResultXORkey[40]) );
  XOR2_X1 Midori_rounds_U114 ( .A(Midori_rounds_SelectedKey_3_), .B(
        Midori_rounds_SR_Result[51]), .Z(Midori_rounds_sub_ResultXORkey[3]) );
  XOR2_X1 Midori_rounds_U113 ( .A(Midori_rounds_SelectedKey_39_), .B(
        Midori_rounds_SR_Result[19]), .Z(Midori_rounds_sub_ResultXORkey[39])
         );
  XOR2_X1 Midori_rounds_U112 ( .A(Midori_rounds_SelectedKey_38_), .B(
        Midori_rounds_SR_Result[18]), .Z(Midori_rounds_sub_ResultXORkey[38])
         );
  XOR2_X1 Midori_rounds_U111 ( .A(Midori_rounds_SelectedKey_37_), .B(
        Midori_rounds_SR_Result[17]), .Z(Midori_rounds_sub_ResultXORkey[37])
         );
  XNOR2_X1 Midori_rounds_U110 ( .A(Midori_rounds_SR_Result[16]), .B(
        Midori_rounds_n8), .ZN(Midori_rounds_sub_ResultXORkey[36]) );
  XOR2_X1 Midori_rounds_U109 ( .A(Midori_rounds_SelectedKey_35_), .B(
        Midori_rounds_SR_Result[15]), .Z(Midori_rounds_sub_ResultXORkey[35])
         );
  XOR2_X1 Midori_rounds_U108 ( .A(Midori_rounds_SelectedKey_34_), .B(
        Midori_rounds_SR_Result[14]), .Z(Midori_rounds_sub_ResultXORkey[34])
         );
  XOR2_X1 Midori_rounds_U107 ( .A(Midori_rounds_SelectedKey_33_), .B(
        Midori_rounds_SR_Result[13]), .Z(Midori_rounds_sub_ResultXORkey[33])
         );
  XNOR2_X1 Midori_rounds_U106 ( .A(Midori_rounds_SR_Result[12]), .B(
        Midori_rounds_n7), .ZN(Midori_rounds_sub_ResultXORkey[32]) );
  XOR2_X1 Midori_rounds_U105 ( .A(Midori_rounds_SelectedKey_31_), .B(
        Midori_rounds_SR_Result[3]), .Z(Midori_rounds_sub_ResultXORkey[31]) );
  XOR2_X1 Midori_rounds_U104 ( .A(Midori_rounds_SelectedKey_30_), .B(
        Midori_rounds_SR_Result[2]), .Z(Midori_rounds_sub_ResultXORkey[30]) );
  XOR2_X1 Midori_rounds_U103 ( .A(Midori_rounds_SelectedKey_2_), .B(
        Midori_rounds_SR_Result[50]), .Z(Midori_rounds_sub_ResultXORkey[2]) );
  XOR2_X1 Midori_rounds_U102 ( .A(Midori_rounds_SelectedKey_29_), .B(
        Midori_rounds_SR_Result[1]), .Z(Midori_rounds_sub_ResultXORkey[29]) );
  XNOR2_X1 Midori_rounds_U101 ( .A(Midori_rounds_SR_Result[0]), .B(
        Midori_rounds_n6), .ZN(Midori_rounds_sub_ResultXORkey[28]) );
  XOR2_X1 Midori_rounds_U100 ( .A(Midori_rounds_SelectedKey_27_), .B(
        Midori_rounds_SR_Result[31]), .Z(Midori_rounds_sub_ResultXORkey[27])
         );
  XOR2_X1 Midori_rounds_U99 ( .A(Midori_rounds_SelectedKey_26_), .B(
        Midori_rounds_SR_Result[30]), .Z(Midori_rounds_sub_ResultXORkey[26])
         );
  XOR2_X1 Midori_rounds_U98 ( .A(Midori_rounds_SelectedKey_25_), .B(
        Midori_rounds_SR_Result[29]), .Z(Midori_rounds_sub_ResultXORkey[25])
         );
  XNOR2_X1 Midori_rounds_U97 ( .A(Midori_rounds_SR_Result[28]), .B(
        Midori_rounds_n5), .ZN(Midori_rounds_sub_ResultXORkey[24]) );
  XOR2_X1 Midori_rounds_U96 ( .A(Midori_rounds_SelectedKey_23_), .B(
        Midori_rounds_SR_Result[59]), .Z(Midori_rounds_sub_ResultXORkey[23])
         );
  XOR2_X1 Midori_rounds_U95 ( .A(Midori_rounds_SelectedKey_22_), .B(
        Midori_rounds_SR_Result[58]), .Z(Midori_rounds_sub_ResultXORkey[22])
         );
  XOR2_X1 Midori_rounds_U94 ( .A(Midori_rounds_SelectedKey_21_), .B(
        Midori_rounds_SR_Result[57]), .Z(Midori_rounds_sub_ResultXORkey[21])
         );
  XNOR2_X1 Midori_rounds_U93 ( .A(Midori_rounds_SR_Result[56]), .B(
        Midori_rounds_n4), .ZN(Midori_rounds_sub_ResultXORkey[20]) );
  XOR2_X1 Midori_rounds_U92 ( .A(Midori_rounds_SelectedKey_1_), .B(
        Midori_rounds_SR_Result[49]), .Z(Midori_rounds_sub_ResultXORkey[1]) );
  XOR2_X1 Midori_rounds_U91 ( .A(Midori_rounds_SelectedKey_19_), .B(
        Midori_rounds_SR_Result[39]), .Z(Midori_rounds_sub_ResultXORkey[19])
         );
  XOR2_X1 Midori_rounds_U90 ( .A(Midori_rounds_SelectedKey_18_), .B(
        Midori_rounds_SR_Result[38]), .Z(Midori_rounds_sub_ResultXORkey[18])
         );
  XOR2_X1 Midori_rounds_U89 ( .A(Midori_rounds_SelectedKey_17_), .B(
        Midori_rounds_SR_Result[37]), .Z(Midori_rounds_sub_ResultXORkey[17])
         );
  XNOR2_X1 Midori_rounds_U88 ( .A(Midori_rounds_SR_Result[36]), .B(
        Midori_rounds_n3), .ZN(Midori_rounds_sub_ResultXORkey[16]) );
  XOR2_X1 Midori_rounds_U87 ( .A(Midori_rounds_SelectedKey_15_), .B(
        Midori_rounds_SR_Result[23]), .Z(Midori_rounds_sub_ResultXORkey[15])
         );
  XOR2_X1 Midori_rounds_U86 ( .A(Midori_rounds_SelectedKey_14_), .B(
        Midori_rounds_SR_Result[22]), .Z(Midori_rounds_sub_ResultXORkey[14])
         );
  XOR2_X1 Midori_rounds_U85 ( .A(Midori_rounds_SelectedKey_13_), .B(
        Midori_rounds_SR_Result[21]), .Z(Midori_rounds_sub_ResultXORkey[13])
         );
  XNOR2_X1 Midori_rounds_U84 ( .A(Midori_rounds_SR_Result[20]), .B(
        Midori_rounds_n2), .ZN(Midori_rounds_sub_ResultXORkey[12]) );
  XOR2_X1 Midori_rounds_U83 ( .A(Midori_rounds_SelectedKey_11_), .B(
        Midori_rounds_SR_Result[11]), .Z(Midori_rounds_sub_ResultXORkey[11])
         );
  XOR2_X1 Midori_rounds_U82 ( .A(Midori_rounds_SelectedKey_10_), .B(
        Midori_rounds_SR_Result[10]), .Z(Midori_rounds_sub_ResultXORkey[10])
         );
  XNOR2_X1 Midori_rounds_U81 ( .A(Midori_rounds_SR_Result[48]), .B(
        Midori_rounds_n1), .ZN(Midori_rounds_sub_ResultXORkey[0]) );
  XOR2_X1 Midori_rounds_U80 ( .A(Midori_rounds_SelectedKey_9_), .B(
        Midori_rounds_SR_Inv_Result[9]), .Z(Midori_rounds_mul_ResultXORkey[9])
         );
  XNOR2_X1 Midori_rounds_U79 ( .A(Midori_rounds_SR_Inv_Result[8]), .B(
        Midori_rounds_n16), .ZN(Midori_rounds_mul_ResultXORkey[8]) );
  XNOR2_X1 Midori_rounds_U78 ( .A(Midori_rounds_SelectedKey_8_), .B(
        Midori_rounds_round_Constant[2]), .ZN(Midori_rounds_n16) );
  XOR2_X1 Midori_rounds_U77 ( .A(Midori_rounds_SelectedKey_7_), .B(
        Midori_rounds_SR_Inv_Result[55]), .Z(Midori_rounds_mul_ResultXORkey[7]) );
  XOR2_X1 Midori_rounds_U76 ( .A(Midori_rounds_SelectedKey_6_), .B(
        Midori_rounds_SR_Inv_Result[54]), .Z(Midori_rounds_mul_ResultXORkey[6]) );
  XOR2_X1 Midori_rounds_U75 ( .A(Midori_rounds_SelectedKey_63_), .B(
        Midori_rounds_SR_Inv_Result[63]), .Z(
        Midori_rounds_mul_ResultXORkey[63]) );
  XOR2_X1 Midori_rounds_U74 ( .A(Midori_rounds_SelectedKey_62_), .B(
        Midori_rounds_SR_Inv_Result[62]), .Z(
        Midori_rounds_mul_ResultXORkey[62]) );
  XOR2_X1 Midori_rounds_U73 ( .A(Midori_rounds_SelectedKey_61_), .B(
        Midori_rounds_SR_Inv_Result[61]), .Z(
        Midori_rounds_mul_ResultXORkey[61]) );
  XNOR2_X1 Midori_rounds_U72 ( .A(Midori_rounds_SR_Inv_Result[60]), .B(
        Midori_rounds_n15), .ZN(Midori_rounds_mul_ResultXORkey[60]) );
  XNOR2_X1 Midori_rounds_U71 ( .A(Midori_rounds_SelectedKey_60_), .B(
        Midori_rounds_round_Constant[15]), .ZN(Midori_rounds_n15) );
  XOR2_X1 Midori_rounds_U70 ( .A(Midori_rounds_SelectedKey_5_), .B(
        Midori_rounds_SR_Inv_Result[53]), .Z(Midori_rounds_mul_ResultXORkey[5]) );
  XOR2_X1 Midori_rounds_U69 ( .A(Midori_rounds_SelectedKey_59_), .B(
        Midori_rounds_SR_Inv_Result[23]), .Z(
        Midori_rounds_mul_ResultXORkey[59]) );
  XOR2_X1 Midori_rounds_U68 ( .A(Midori_rounds_SelectedKey_58_), .B(
        Midori_rounds_SR_Inv_Result[22]), .Z(
        Midori_rounds_mul_ResultXORkey[58]) );
  XOR2_X1 Midori_rounds_U67 ( .A(Midori_rounds_SelectedKey_57_), .B(
        Midori_rounds_SR_Inv_Result[21]), .Z(
        Midori_rounds_mul_ResultXORkey[57]) );
  XNOR2_X1 Midori_rounds_U66 ( .A(Midori_rounds_SR_Inv_Result[20]), .B(
        Midori_rounds_n14), .ZN(Midori_rounds_mul_ResultXORkey[56]) );
  XNOR2_X1 Midori_rounds_U65 ( .A(Midori_rounds_SelectedKey_56_), .B(
        Midori_rounds_round_Constant[14]), .ZN(Midori_rounds_n14) );
  XOR2_X1 Midori_rounds_U64 ( .A(Midori_rounds_SelectedKey_55_), .B(
        Midori_rounds_SR_Inv_Result[43]), .Z(
        Midori_rounds_mul_ResultXORkey[55]) );
  XOR2_X1 Midori_rounds_U63 ( .A(Midori_rounds_SelectedKey_54_), .B(
        Midori_rounds_SR_Inv_Result[42]), .Z(
        Midori_rounds_mul_ResultXORkey[54]) );
  XOR2_X1 Midori_rounds_U62 ( .A(Midori_rounds_SelectedKey_53_), .B(
        Midori_rounds_SR_Inv_Result[41]), .Z(
        Midori_rounds_mul_ResultXORkey[53]) );
  XNOR2_X1 Midori_rounds_U61 ( .A(Midori_rounds_SR_Inv_Result[40]), .B(
        Midori_rounds_n13), .ZN(Midori_rounds_mul_ResultXORkey[52]) );
  XNOR2_X1 Midori_rounds_U60 ( .A(Midori_rounds_SelectedKey_52_), .B(
        Midori_rounds_round_Constant[13]), .ZN(Midori_rounds_n13) );
  XOR2_X1 Midori_rounds_U59 ( .A(Midori_rounds_SelectedKey_51_), .B(
        Midori_rounds_SR_Inv_Result[3]), .Z(Midori_rounds_mul_ResultXORkey[51]) );
  XOR2_X1 Midori_rounds_U58 ( .A(Midori_rounds_SelectedKey_50_), .B(
        Midori_rounds_SR_Inv_Result[2]), .Z(Midori_rounds_mul_ResultXORkey[50]) );
  XNOR2_X1 Midori_rounds_U57 ( .A(Midori_rounds_SR_Inv_Result[52]), .B(
        Midori_rounds_n12), .ZN(Midori_rounds_mul_ResultXORkey[4]) );
  XNOR2_X1 Midori_rounds_U56 ( .A(Midori_rounds_SelectedKey_4_), .B(
        Midori_rounds_round_Constant[1]), .ZN(Midori_rounds_n12) );
  XOR2_X1 Midori_rounds_U55 ( .A(Midori_rounds_SelectedKey_49_), .B(
        Midori_rounds_SR_Inv_Result[1]), .Z(Midori_rounds_mul_ResultXORkey[49]) );
  XNOR2_X1 Midori_rounds_U54 ( .A(Midori_rounds_SR_Inv_Result[0]), .B(
        Midori_rounds_n11), .ZN(Midori_rounds_mul_ResultXORkey[48]) );
  XNOR2_X1 Midori_rounds_U53 ( .A(Midori_rounds_SelectedKey_48_), .B(
        Midori_rounds_round_Constant[12]), .ZN(Midori_rounds_n11) );
  XOR2_X1 Midori_rounds_U52 ( .A(Midori_rounds_SelectedKey_47_), .B(
        Midori_rounds_SR_Inv_Result[7]), .Z(Midori_rounds_mul_ResultXORkey[47]) );
  XOR2_X1 Midori_rounds_U51 ( .A(Midori_rounds_SelectedKey_46_), .B(
        Midori_rounds_SR_Inv_Result[6]), .Z(Midori_rounds_mul_ResultXORkey[46]) );
  XOR2_X1 Midori_rounds_U50 ( .A(Midori_rounds_SelectedKey_45_), .B(
        Midori_rounds_SR_Inv_Result[5]), .Z(Midori_rounds_mul_ResultXORkey[45]) );
  XNOR2_X1 Midori_rounds_U49 ( .A(Midori_rounds_SR_Inv_Result[4]), .B(
        Midori_rounds_n10), .ZN(Midori_rounds_mul_ResultXORkey[44]) );
  XNOR2_X1 Midori_rounds_U48 ( .A(Midori_rounds_SelectedKey_44_), .B(
        Midori_rounds_round_Constant[11]), .ZN(Midori_rounds_n10) );
  XOR2_X1 Midori_rounds_U47 ( .A(Midori_rounds_SelectedKey_43_), .B(
        Midori_rounds_SR_Inv_Result[47]), .Z(
        Midori_rounds_mul_ResultXORkey[43]) );
  XOR2_X1 Midori_rounds_U46 ( .A(Midori_rounds_SelectedKey_42_), .B(
        Midori_rounds_SR_Inv_Result[46]), .Z(
        Midori_rounds_mul_ResultXORkey[42]) );
  XOR2_X1 Midori_rounds_U45 ( .A(Midori_rounds_SelectedKey_41_), .B(
        Midori_rounds_SR_Inv_Result[45]), .Z(
        Midori_rounds_mul_ResultXORkey[41]) );
  XNOR2_X1 Midori_rounds_U44 ( .A(Midori_rounds_SR_Inv_Result[44]), .B(
        Midori_rounds_n9), .ZN(Midori_rounds_mul_ResultXORkey[40]) );
  XNOR2_X1 Midori_rounds_U43 ( .A(Midori_rounds_SelectedKey_40_), .B(
        Midori_rounds_round_Constant[10]), .ZN(Midori_rounds_n9) );
  XOR2_X1 Midori_rounds_U42 ( .A(Midori_rounds_SelectedKey_3_), .B(
        Midori_rounds_SR_Inv_Result[31]), .Z(Midori_rounds_mul_ResultXORkey[3]) );
  XOR2_X1 Midori_rounds_U41 ( .A(Midori_rounds_SelectedKey_39_), .B(
        Midori_rounds_SR_Inv_Result[19]), .Z(
        Midori_rounds_mul_ResultXORkey[39]) );
  XOR2_X1 Midori_rounds_U40 ( .A(Midori_rounds_SelectedKey_38_), .B(
        Midori_rounds_SR_Inv_Result[18]), .Z(
        Midori_rounds_mul_ResultXORkey[38]) );
  XOR2_X1 Midori_rounds_U39 ( .A(Midori_rounds_SelectedKey_37_), .B(
        Midori_rounds_SR_Inv_Result[17]), .Z(
        Midori_rounds_mul_ResultXORkey[37]) );
  XNOR2_X1 Midori_rounds_U38 ( .A(Midori_rounds_SR_Inv_Result[16]), .B(
        Midori_rounds_n8), .ZN(Midori_rounds_mul_ResultXORkey[36]) );
  XNOR2_X1 Midori_rounds_U37 ( .A(Midori_rounds_SelectedKey_36_), .B(
        Midori_rounds_round_Constant[9]), .ZN(Midori_rounds_n8) );
  XOR2_X1 Midori_rounds_U36 ( .A(Midori_rounds_SelectedKey_35_), .B(
        Midori_rounds_SR_Inv_Result[59]), .Z(
        Midori_rounds_mul_ResultXORkey[35]) );
  XOR2_X1 Midori_rounds_U35 ( .A(Midori_rounds_SelectedKey_34_), .B(
        Midori_rounds_SR_Inv_Result[58]), .Z(
        Midori_rounds_mul_ResultXORkey[34]) );
  XOR2_X1 Midori_rounds_U34 ( .A(Midori_rounds_SelectedKey_33_), .B(
        Midori_rounds_SR_Inv_Result[57]), .Z(
        Midori_rounds_mul_ResultXORkey[33]) );
  XNOR2_X1 Midori_rounds_U33 ( .A(Midori_rounds_SR_Inv_Result[56]), .B(
        Midori_rounds_n7), .ZN(Midori_rounds_mul_ResultXORkey[32]) );
  XNOR2_X1 Midori_rounds_U32 ( .A(Midori_rounds_SelectedKey_32_), .B(
        Midori_rounds_round_Constant[8]), .ZN(Midori_rounds_n7) );
  XOR2_X1 Midori_rounds_U31 ( .A(Midori_rounds_SelectedKey_31_), .B(
        Midori_rounds_SR_Inv_Result[27]), .Z(
        Midori_rounds_mul_ResultXORkey[31]) );
  XOR2_X1 Midori_rounds_U30 ( .A(Midori_rounds_SelectedKey_30_), .B(
        Midori_rounds_SR_Inv_Result[26]), .Z(
        Midori_rounds_mul_ResultXORkey[30]) );
  XOR2_X1 Midori_rounds_U29 ( .A(Midori_rounds_SelectedKey_2_), .B(
        Midori_rounds_SR_Inv_Result[30]), .Z(Midori_rounds_mul_ResultXORkey[2]) );
  XOR2_X1 Midori_rounds_U28 ( .A(Midori_rounds_SelectedKey_29_), .B(
        Midori_rounds_SR_Inv_Result[25]), .Z(
        Midori_rounds_mul_ResultXORkey[29]) );
  XNOR2_X1 Midori_rounds_U27 ( .A(Midori_rounds_SR_Inv_Result[24]), .B(
        Midori_rounds_n6), .ZN(Midori_rounds_mul_ResultXORkey[28]) );
  XNOR2_X1 Midori_rounds_U26 ( .A(Midori_rounds_SelectedKey_28_), .B(
        Midori_rounds_round_Constant[7]), .ZN(Midori_rounds_n6) );
  XOR2_X1 Midori_rounds_U25 ( .A(Midori_rounds_SelectedKey_27_), .B(
        Midori_rounds_SR_Inv_Result[51]), .Z(
        Midori_rounds_mul_ResultXORkey[27]) );
  XOR2_X1 Midori_rounds_U24 ( .A(Midori_rounds_SelectedKey_26_), .B(
        Midori_rounds_SR_Inv_Result[50]), .Z(
        Midori_rounds_mul_ResultXORkey[26]) );
  XOR2_X1 Midori_rounds_U23 ( .A(Midori_rounds_SelectedKey_25_), .B(
        Midori_rounds_SR_Inv_Result[49]), .Z(
        Midori_rounds_mul_ResultXORkey[25]) );
  XNOR2_X1 Midori_rounds_U22 ( .A(Midori_rounds_SR_Inv_Result[48]), .B(
        Midori_rounds_n5), .ZN(Midori_rounds_mul_ResultXORkey[24]) );
  XNOR2_X1 Midori_rounds_U21 ( .A(Midori_rounds_SelectedKey_24_), .B(
        Midori_rounds_round_Constant[6]), .ZN(Midori_rounds_n5) );
  XOR2_X1 Midori_rounds_U20 ( .A(Midori_rounds_SelectedKey_23_), .B(
        Midori_rounds_SR_Inv_Result[15]), .Z(
        Midori_rounds_mul_ResultXORkey[23]) );
  XOR2_X1 Midori_rounds_U19 ( .A(Midori_rounds_SelectedKey_22_), .B(
        Midori_rounds_SR_Inv_Result[14]), .Z(
        Midori_rounds_mul_ResultXORkey[22]) );
  XOR2_X1 Midori_rounds_U18 ( .A(Midori_rounds_SelectedKey_21_), .B(
        Midori_rounds_SR_Inv_Result[13]), .Z(
        Midori_rounds_mul_ResultXORkey[21]) );
  XNOR2_X1 Midori_rounds_U17 ( .A(Midori_rounds_SR_Inv_Result[12]), .B(
        Midori_rounds_n4), .ZN(Midori_rounds_mul_ResultXORkey[20]) );
  XNOR2_X1 Midori_rounds_U16 ( .A(Midori_rounds_SelectedKey_20_), .B(
        Midori_rounds_round_Constant[5]), .ZN(Midori_rounds_n4) );
  XOR2_X1 Midori_rounds_U15 ( .A(Midori_rounds_SelectedKey_1_), .B(
        Midori_rounds_SR_Inv_Result[29]), .Z(Midori_rounds_mul_ResultXORkey[1]) );
  XOR2_X1 Midori_rounds_U14 ( .A(Midori_rounds_SelectedKey_19_), .B(
        Midori_rounds_SR_Inv_Result[39]), .Z(
        Midori_rounds_mul_ResultXORkey[19]) );
  XOR2_X1 Midori_rounds_U13 ( .A(Midori_rounds_SelectedKey_18_), .B(
        Midori_rounds_SR_Inv_Result[38]), .Z(
        Midori_rounds_mul_ResultXORkey[18]) );
  XOR2_X1 Midori_rounds_U12 ( .A(Midori_rounds_SelectedKey_17_), .B(
        Midori_rounds_SR_Inv_Result[37]), .Z(
        Midori_rounds_mul_ResultXORkey[17]) );
  XNOR2_X1 Midori_rounds_U11 ( .A(Midori_rounds_SR_Inv_Result[36]), .B(
        Midori_rounds_n3), .ZN(Midori_rounds_mul_ResultXORkey[16]) );
  XNOR2_X1 Midori_rounds_U10 ( .A(Midori_rounds_SelectedKey_16_), .B(
        Midori_rounds_round_Constant[4]), .ZN(Midori_rounds_n3) );
  XOR2_X1 Midori_rounds_U9 ( .A(Midori_rounds_SelectedKey_15_), .B(
        Midori_rounds_SR_Inv_Result[35]), .Z(
        Midori_rounds_mul_ResultXORkey[15]) );
  XOR2_X1 Midori_rounds_U8 ( .A(Midori_rounds_SelectedKey_14_), .B(
        Midori_rounds_SR_Inv_Result[34]), .Z(
        Midori_rounds_mul_ResultXORkey[14]) );
  XOR2_X1 Midori_rounds_U7 ( .A(Midori_rounds_SelectedKey_13_), .B(
        Midori_rounds_SR_Inv_Result[33]), .Z(
        Midori_rounds_mul_ResultXORkey[13]) );
  XNOR2_X1 Midori_rounds_U6 ( .A(Midori_rounds_SR_Inv_Result[32]), .B(
        Midori_rounds_n2), .ZN(Midori_rounds_mul_ResultXORkey[12]) );
  XNOR2_X1 Midori_rounds_U5 ( .A(Midori_rounds_SelectedKey_12_), .B(
        Midori_rounds_round_Constant[3]), .ZN(Midori_rounds_n2) );
  XOR2_X1 Midori_rounds_U4 ( .A(Midori_rounds_SelectedKey_11_), .B(
        Midori_rounds_SR_Inv_Result[11]), .Z(
        Midori_rounds_mul_ResultXORkey[11]) );
  XOR2_X1 Midori_rounds_U3 ( .A(Midori_rounds_SelectedKey_10_), .B(
        Midori_rounds_SR_Inv_Result[10]), .Z(
        Midori_rounds_mul_ResultXORkey[10]) );
  XNOR2_X1 Midori_rounds_U2 ( .A(Midori_rounds_SR_Inv_Result[28]), .B(
        Midori_rounds_n1), .ZN(Midori_rounds_mul_ResultXORkey[0]) );
  XNOR2_X1 Midori_rounds_U1 ( .A(Midori_rounds_SelectedKey_0_), .B(
        Midori_rounds_round_Constant[0]), .ZN(Midori_rounds_n1) );
  NAND2_X1 Midori_rounds_constant_MUX_U106 ( .A1(
        Midori_rounds_constant_MUX_n106), .A2(Midori_rounds_constant_MUX_n105), 
        .ZN(Midori_rounds_round_Constant[9]) );
  NOR2_X1 Midori_rounds_constant_MUX_U105 ( .A1(
        Midori_rounds_constant_MUX_n104), .A2(Midori_rounds_constant_MUX_n103), 
        .ZN(Midori_rounds_constant_MUX_n106) );
  OR2_X1 Midori_rounds_constant_MUX_U104 ( .A1(Midori_rounds_constant_MUX_n102), .A2(Midori_rounds_constant_MUX_n101), .ZN(Midori_rounds_constant_MUX_n103)
         );
  NAND2_X1 Midori_rounds_constant_MUX_U103 ( .A1(
        Midori_rounds_constant_MUX_n100), .A2(Midori_rounds_constant_MUX_n99), 
        .ZN(Midori_rounds_round_Constant[8]) );
  NAND2_X1 Midori_rounds_constant_MUX_U102 ( .A1(
        Midori_rounds_constant_MUX_n98), .A2(Midori_rounds_constant_MUX_n97), 
        .ZN(Midori_rounds_round_Constant[7]) );
  NOR2_X1 Midori_rounds_constant_MUX_U101 ( .A1(
        Midori_rounds_round_Constant[11]), .A2(Midori_rounds_constant_MUX_n96), 
        .ZN(Midori_rounds_constant_MUX_n97) );
  NAND2_X1 Midori_rounds_constant_MUX_U100 ( .A1(
        Midori_rounds_constant_MUX_n95), .A2(Midori_rounds_constant_MUX_n94), 
        .ZN(Midori_rounds_constant_MUX_n96) );
  NOR2_X1 Midori_rounds_constant_MUX_U99 ( .A1(Midori_rounds_constant_MUX_n93), 
        .A2(Midori_rounds_constant_MUX_n92), .ZN(
        Midori_rounds_constant_MUX_n95) );
  NAND2_X1 Midori_rounds_constant_MUX_U98 ( .A1(Midori_rounds_constant_MUX_n91), .A2(Midori_rounds_constant_MUX_n90), .ZN(Midori_rounds_round_Constant[6]) );
  NOR2_X1 Midori_rounds_constant_MUX_U97 ( .A1(Midori_rounds_constant_MUX_n89), 
        .A2(Midori_rounds_constant_MUX_n88), .ZN(
        Midori_rounds_constant_MUX_n90) );
  NAND2_X1 Midori_rounds_constant_MUX_U96 ( .A1(Midori_rounds_constant_MUX_n87), .A2(Midori_rounds_constant_MUX_n86), .ZN(Midori_rounds_round_Constant[5]) );
  NOR2_X1 Midori_rounds_constant_MUX_U95 ( .A1(Midori_rounds_constant_MUX_n101), .A2(Midori_rounds_constant_MUX_n85), .ZN(Midori_rounds_constant_MUX_n86) );
  NAND2_X1 Midori_rounds_constant_MUX_U94 ( .A1(Midori_rounds_constant_MUX_n84), .A2(Midori_rounds_constant_MUX_n94), .ZN(Midori_rounds_constant_MUX_n85) );
  NAND2_X1 Midori_rounds_constant_MUX_U93 ( .A1(Midori_rounds_constant_MUX_n83), .A2(Midori_rounds_constant_MUX_n84), .ZN(Midori_rounds_round_Constant[4]) );
  NOR2_X1 Midori_rounds_constant_MUX_U92 ( .A1(Midori_rounds_constant_MUX_n82), 
        .A2(Midori_rounds_constant_MUX_n81), .ZN(
        Midori_rounds_constant_MUX_n84) );
  NAND2_X1 Midori_rounds_constant_MUX_U91 ( .A1(Midori_rounds_constant_MUX_n80), .A2(Midori_rounds_constant_MUX_n79), .ZN(Midori_rounds_round_Constant[3]) );
  NOR2_X1 Midori_rounds_constant_MUX_U90 ( .A1(Midori_rounds_constant_MUX_n104), .A2(Midori_rounds_constant_MUX_n78), .ZN(Midori_rounds_constant_MUX_n80) );
  NAND2_X1 Midori_rounds_constant_MUX_U89 ( .A1(Midori_rounds_constant_MUX_n77), .A2(Midori_rounds_constant_MUX_n94), .ZN(Midori_rounds_constant_MUX_n78) );
  INV_X1 Midori_rounds_constant_MUX_U88 ( .A(Midori_rounds_constant_MUX_n76), 
        .ZN(Midori_rounds_constant_MUX_n77) );
  OR2_X1 Midori_rounds_constant_MUX_U87 ( .A1(Midori_rounds_constant_MUX_n104), 
        .A2(Midori_rounds_constant_MUX_n75), .ZN(
        Midori_rounds_round_Constant[2]) );
  NAND2_X1 Midori_rounds_constant_MUX_U86 ( .A1(Midori_rounds_constant_MUX_n91), .A2(Midori_rounds_constant_MUX_n74), .ZN(Midori_rounds_constant_MUX_n75) );
  NOR2_X1 Midori_rounds_constant_MUX_U85 ( .A1(Midori_rounds_constant_MUX_n73), 
        .A2(Midori_rounds_constant_MUX_n101), .ZN(
        Midori_rounds_constant_MUX_n91) );
  NAND2_X1 Midori_rounds_constant_MUX_U84 ( .A1(Midori_rounds_constant_MUX_n72), .A2(Midori_rounds_constant_MUX_n99), .ZN(Midori_rounds_constant_MUX_n104) );
  NAND2_X1 Midori_rounds_constant_MUX_U83 ( .A1(Midori_rounds_constant_MUX_n71), .A2(Midori_rounds_constant_MUX_n70), .ZN(Midori_rounds_round_Constant[1]) );
  NOR2_X1 Midori_rounds_constant_MUX_U82 ( .A1(Midori_rounds_constant_MUX_n76), 
        .A2(Midori_rounds_constant_MUX_n69), .ZN(
        Midori_rounds_constant_MUX_n70) );
  OR2_X1 Midori_rounds_constant_MUX_U81 ( .A1(Midori_rounds_constant_MUX_n101), 
        .A2(Midori_rounds_constant_MUX_n93), .ZN(
        Midori_rounds_constant_MUX_n69) );
  INV_X1 Midori_rounds_constant_MUX_U80 ( .A(Midori_rounds_constant_MUX_n72), 
        .ZN(Midori_rounds_constant_MUX_n93) );
  NAND2_X1 Midori_rounds_constant_MUX_U79 ( .A1(Midori_rounds_constant_MUX_n68), .A2(Midori_rounds_constant_MUX_n67), .ZN(Midori_rounds_constant_MUX_n72) );
  NAND2_X1 Midori_rounds_constant_MUX_U78 ( .A1(Midori_rounds_constant_MUX_n66), .A2(Midori_rounds_constant_MUX_n65), .ZN(Midori_rounds_constant_MUX_n67) );
  NOR2_X1 Midori_rounds_constant_MUX_U77 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(Midori_rounds_constant_MUX_n64), .ZN(
        Midori_rounds_constant_MUX_n101) );
  MUX2_X1 Midori_rounds_constant_MUX_U76 ( .A(Midori_rounds_constant_MUX_n63), 
        .B(Midori_rounds_constant_MUX_n62), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n64) );
  NAND2_X1 Midori_rounds_constant_MUX_U75 ( .A1(Midori_rounds_constant_MUX_n61), .A2(Midori_rounds_constant_MUX_n60), .ZN(Midori_rounds_round_Constant[15])
         );
  NOR2_X1 Midori_rounds_constant_MUX_U74 ( .A1(Midori_rounds_constant_MUX_n89), 
        .A2(Midori_rounds_constant_MUX_n76), .ZN(
        Midori_rounds_constant_MUX_n61) );
  NAND2_X1 Midori_rounds_constant_MUX_U73 ( .A1(Midori_rounds_constant_MUX_n59), .A2(Midori_rounds_constant_MUX_n83), .ZN(Midori_rounds_round_Constant[14])
         );
  NOR2_X1 Midori_rounds_constant_MUX_U72 ( .A1(Midori_rounds_constant_MUX_n58), 
        .A2(Midori_rounds_constant_MUX_n57), .ZN(
        Midori_rounds_constant_MUX_n83) );
  NAND2_X1 Midori_rounds_constant_MUX_U71 ( .A1(
        Midori_rounds_constant_MUX_n105), .A2(Midori_rounds_constant_MUX_n94), 
        .ZN(Midori_rounds_constant_MUX_n57) );
  OR2_X1 Midori_rounds_constant_MUX_U70 ( .A1(Midori_rounds_constant_MUX_n18), 
        .A2(Midori_rounds_constant_MUX_n56), .ZN(
        Midori_rounds_constant_MUX_n94) );
  MUX2_X1 Midori_rounds_constant_MUX_U69 ( .A(Midori_rounds_constant_MUX_n55), 
        .B(Midori_rounds_constant_MUX_n54), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n56) );
  NAND2_X1 Midori_rounds_constant_MUX_U68 ( .A1(Midori_rounds_constant_MUX_n74), .A2(Midori_rounds_constant_MUX_n53), .ZN(Midori_rounds_round_Constant[13])
         );
  NOR2_X1 Midori_rounds_constant_MUX_U67 ( .A1(Midori_rounds_constant_MUX_n52), 
        .A2(Midori_rounds_constant_MUX_n51), .ZN(
        Midori_rounds_constant_MUX_n53) );
  INV_X1 Midori_rounds_constant_MUX_U66 ( .A(Midori_rounds_constant_MUX_n59), 
        .ZN(Midori_rounds_constant_MUX_n51) );
  NOR2_X1 Midori_rounds_constant_MUX_U65 ( .A1(Midori_rounds_constant_MUX_n50), 
        .A2(Midori_rounds_constant_MUX_n81), .ZN(
        Midori_rounds_constant_MUX_n74) );
  NAND2_X1 Midori_rounds_constant_MUX_U64 ( .A1(Midori_rounds_constant_MUX_n49), .A2(Midori_rounds_constant_MUX_n79), .ZN(Midori_rounds_round_Constant[12])
         );
  INV_X1 Midori_rounds_constant_MUX_U63 ( .A(Midori_rounds_constant_MUX_n73), 
        .ZN(Midori_rounds_constant_MUX_n79) );
  NOR2_X1 Midori_rounds_constant_MUX_U62 ( .A1(Midori_rounds_constant_MUX_n92), 
        .A2(Midori_rounds_constant_MUX_n48), .ZN(
        Midori_rounds_constant_MUX_n49) );
  NAND2_X1 Midori_rounds_constant_MUX_U61 ( .A1(
        Midori_rounds_constant_MUX_n100), .A2(Midori_rounds_constant_MUX_n59), 
        .ZN(Midori_rounds_constant_MUX_n48) );
  NOR2_X1 Midori_rounds_constant_MUX_U60 ( .A1(Midori_rounds_constant_MUX_n82), 
        .A2(Midori_rounds_constant_MUX_n58), .ZN(
        Midori_rounds_constant_MUX_n100) );
  NAND2_X1 Midori_rounds_constant_MUX_U59 ( .A1(Midori_rounds_constant_MUX_n87), .A2(Midori_rounds_constant_MUX_n47), .ZN(Midori_rounds_constant_MUX_n58) );
  NAND2_X1 Midori_rounds_constant_MUX_U58 ( .A1(Midori_rounds_constant_MUX_n18), .A2(Midori_rounds_constant_MUX_n46), .ZN(Midori_rounds_constant_MUX_n47) );
  NAND2_X1 Midori_rounds_constant_MUX_U57 ( .A1(Midori_rounds_constant_MUX_n54), .A2(Midori_rounds_constant_MUX_n66), .ZN(Midori_rounds_constant_MUX_n46) );
  NOR2_X1 Midori_rounds_constant_MUX_U56 ( .A1(Midori_rounds_constant_MUX_n89), 
        .A2(Midori_rounds_constant_MUX_n45), .ZN(
        Midori_rounds_constant_MUX_n87) );
  NOR2_X1 Midori_rounds_constant_MUX_U55 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(Midori_rounds_constant_MUX_n44), .ZN(
        Midori_rounds_constant_MUX_n45) );
  MUX2_X1 Midori_rounds_constant_MUX_U54 ( .A(Midori_rounds_constant_MUX_n65), 
        .B(Midori_rounds_constant_MUX_n55), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n44) );
  NOR2_X1 Midori_rounds_constant_MUX_U53 ( .A1(Midori_rounds_constant_MUX_n18), 
        .A2(Midori_rounds_constant_MUX_n43), .ZN(
        Midori_rounds_constant_MUX_n89) );
  MUX2_X1 Midori_rounds_constant_MUX_U52 ( .A(Midori_rounds_constant_MUX_n63), 
        .B(Midori_rounds_constant_MUX_n42), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n43) );
  OR2_X1 Midori_rounds_constant_MUX_U51 ( .A1(Midori_rounds_constant_MUX_n88), 
        .A2(Midori_rounds_constant_MUX_n102), .ZN(
        Midori_rounds_round_Constant[11]) );
  NAND2_X1 Midori_rounds_constant_MUX_U50 ( .A1(Midori_rounds_constant_MUX_n59), .A2(Midori_rounds_constant_MUX_n99), .ZN(Midori_rounds_constant_MUX_n88) );
  NAND2_X1 Midori_rounds_constant_MUX_U49 ( .A1(Midori_rounds_constant_MUX_n41), .A2(Midori_rounds_constant_MUX_n40), .ZN(Midori_rounds_constant_MUX_n99) );
  AND2_X1 Midori_rounds_constant_MUX_U48 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(round_Signal[2]), .ZN(Midori_rounds_constant_MUX_n40) );
  NOR2_X1 Midori_rounds_constant_MUX_U47 ( .A1(Midori_rounds_constant_MUX_n39), 
        .A2(Midori_rounds_constant_MUX_n76), .ZN(
        Midori_rounds_constant_MUX_n59) );
  NOR2_X1 Midori_rounds_constant_MUX_U46 ( .A1(Midori_rounds_constant_MUX_n18), 
        .A2(Midori_rounds_constant_MUX_n38), .ZN(
        Midori_rounds_constant_MUX_n76) );
  MUX2_X1 Midori_rounds_constant_MUX_U45 ( .A(Midori_rounds_constant_MUX_n54), 
        .B(Midori_rounds_constant_MUX_n55), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n38) );
  NOR2_X1 Midori_rounds_constant_MUX_U44 ( .A1(Midori_rounds_constant_MUX_n18), 
        .A2(Midori_rounds_constant_MUX_n37), .ZN(
        Midori_rounds_constant_MUX_n39) );
  MUX2_X1 Midori_rounds_constant_MUX_U43 ( .A(Midori_rounds_constant_MUX_n42), 
        .B(Midori_rounds_constant_MUX_n63), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n37) );
  NAND2_X1 Midori_rounds_constant_MUX_U42 ( .A1(Midori_rounds_constant_MUX_n36), .A2(Midori_rounds_constant_MUX_n60), .ZN(Midori_rounds_round_Constant[10])
         );
  NOR2_X1 Midori_rounds_constant_MUX_U41 ( .A1(Midori_rounds_constant_MUX_n35), 
        .A2(Midori_rounds_constant_MUX_n102), .ZN(
        Midori_rounds_constant_MUX_n60) );
  NOR2_X1 Midori_rounds_constant_MUX_U40 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(Midori_rounds_constant_MUX_n34), .ZN(
        Midori_rounds_constant_MUX_n102) );
  MUX2_X1 Midori_rounds_constant_MUX_U39 ( .A(Midori_rounds_constant_MUX_n54), 
        .B(Midori_rounds_constant_MUX_n66), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n34) );
  INV_X1 Midori_rounds_constant_MUX_U38 ( .A(Midori_rounds_constant_MUX_n33), 
        .ZN(Midori_rounds_constant_MUX_n35) );
  INV_X1 Midori_rounds_constant_MUX_U37 ( .A(Midori_rounds_constant_MUX_n82), 
        .ZN(Midori_rounds_constant_MUX_n36) );
  NAND2_X1 Midori_rounds_constant_MUX_U36 ( .A1(Midori_rounds_constant_MUX_n71), .A2(Midori_rounds_constant_MUX_n33), .ZN(Midori_rounds_round_Constant[0]) );
  NOR2_X1 Midori_rounds_constant_MUX_U35 ( .A1(Midori_rounds_constant_MUX_n92), 
        .A2(Midori_rounds_constant_MUX_n81), .ZN(
        Midori_rounds_constant_MUX_n33) );
  NOR2_X1 Midori_rounds_constant_MUX_U34 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(Midori_rounds_constant_MUX_n32), .ZN(
        Midori_rounds_constant_MUX_n81) );
  MUX2_X1 Midori_rounds_constant_MUX_U33 ( .A(Midori_rounds_constant_MUX_n62), 
        .B(Midori_rounds_constant_MUX_n63), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n32) );
  NAND2_X1 Midori_rounds_constant_MUX_U32 ( .A1(Midori_rounds_constant_MUX_n31), .A2(Midori_rounds_constant_MUX_n30), .ZN(Midori_rounds_constant_MUX_n63) );
  NAND2_X1 Midori_rounds_constant_MUX_U31 ( .A1(Midori_rounds_constant_MUX_n29), .A2(round_Signal[1]), .ZN(Midori_rounds_constant_MUX_n62) );
  NOR2_X1 Midori_rounds_constant_MUX_U30 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(Midori_rounds_constant_MUX_n28), .ZN(
        Midori_rounds_constant_MUX_n92) );
  MUX2_X1 Midori_rounds_constant_MUX_U29 ( .A(Midori_rounds_constant_MUX_n55), 
        .B(Midori_rounds_constant_MUX_n65), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n28) );
  NAND2_X1 Midori_rounds_constant_MUX_U28 ( .A1(enc_dec), .A2(
        Midori_rounds_constant_MUX_n41), .ZN(Midori_rounds_constant_MUX_n65)
         );
  NOR2_X1 Midori_rounds_constant_MUX_U27 ( .A1(round_Signal[3]), .A2(
        Midori_rounds_constant_MUX_n30), .ZN(Midori_rounds_constant_MUX_n41)
         );
  NAND2_X1 Midori_rounds_constant_MUX_U26 ( .A1(Midori_rounds_constant_MUX_n27), .A2(Midori_rounds_constant_MUX_n30), .ZN(Midori_rounds_constant_MUX_n55) );
  NOR2_X1 Midori_rounds_constant_MUX_U25 ( .A1(Midori_rounds_constant_MUX_n73), 
        .A2(Midori_rounds_constant_MUX_n26), .ZN(
        Midori_rounds_constant_MUX_n71) );
  NAND2_X1 Midori_rounds_constant_MUX_U24 ( .A1(Midori_rounds_constant_MUX_n98), .A2(Midori_rounds_constant_MUX_n105), .ZN(Midori_rounds_constant_MUX_n26) );
  NAND2_X1 Midori_rounds_constant_MUX_U23 ( .A1(Midori_rounds_constant_MUX_n52), .A2(Midori_rounds_constant_MUX_n25), .ZN(Midori_rounds_constant_MUX_n105) );
  OR2_X1 Midori_rounds_constant_MUX_U22 ( .A1(Midori_rounds_constant_MUX_n29), 
        .A2(Midori_rounds_constant_MUX_n31), .ZN(
        Midori_rounds_constant_MUX_n25) );
  AND2_X1 Midori_rounds_constant_MUX_U21 ( .A1(round_Signal[1]), .A2(
        Midori_rounds_constant_MUX_n68), .ZN(Midori_rounds_constant_MUX_n52)
         );
  NOR2_X1 Midori_rounds_constant_MUX_U20 ( .A1(Midori_rounds_constant_MUX_n18), 
        .A2(round_Signal[2]), .ZN(Midori_rounds_constant_MUX_n68) );
  NOR2_X1 Midori_rounds_constant_MUX_U19 ( .A1(Midori_rounds_constant_MUX_n82), 
        .A2(Midori_rounds_constant_MUX_n50), .ZN(
        Midori_rounds_constant_MUX_n98) );
  NOR2_X1 Midori_rounds_constant_MUX_U18 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(Midori_rounds_constant_MUX_n24), .ZN(
        Midori_rounds_constant_MUX_n50) );
  MUX2_X1 Midori_rounds_constant_MUX_U17 ( .A(Midori_rounds_constant_MUX_n66), 
        .B(Midori_rounds_constant_MUX_n54), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n24) );
  NAND2_X1 Midori_rounds_constant_MUX_U16 ( .A1(enc_dec), .A2(
        Midori_rounds_constant_MUX_n23), .ZN(Midori_rounds_constant_MUX_n54)
         );
  NOR2_X1 Midori_rounds_constant_MUX_U15 ( .A1(round_Signal[3]), .A2(
        round_Signal[1]), .ZN(Midori_rounds_constant_MUX_n23) );
  NAND2_X1 Midori_rounds_constant_MUX_U14 ( .A1(round_Signal[1]), .A2(
        Midori_rounds_constant_MUX_n27), .ZN(Midori_rounds_constant_MUX_n66)
         );
  NOR2_X1 Midori_rounds_constant_MUX_U13 ( .A1(enc_dec), .A2(
        Midori_rounds_constant_MUX_n22), .ZN(Midori_rounds_constant_MUX_n27)
         );
  INV_X1 Midori_rounds_constant_MUX_U12 ( .A(round_Signal[3]), .ZN(
        Midori_rounds_constant_MUX_n22) );
  NOR2_X1 Midori_rounds_constant_MUX_U11 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(Midori_rounds_constant_MUX_n21), .ZN(
        Midori_rounds_constant_MUX_n82) );
  MUX2_X1 Midori_rounds_constant_MUX_U10 ( .A(Midori_rounds_constant_MUX_n42), 
        .B(Midori_rounds_constant_MUX_n20), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n21) );
  NOR2_X1 Midori_rounds_constant_MUX_U9 ( .A1(Midori_rounds_constant_MUX_n17), 
        .A2(Midori_rounds_constant_MUX_n19), .ZN(
        Midori_rounds_constant_MUX_n73) );
  MUX2_X1 Midori_rounds_constant_MUX_U8 ( .A(Midori_rounds_constant_MUX_n20), 
        .B(Midori_rounds_constant_MUX_n42), .S(round_Signal[2]), .Z(
        Midori_rounds_constant_MUX_n19) );
  NAND2_X1 Midori_rounds_constant_MUX_U7 ( .A1(Midori_rounds_constant_MUX_n29), 
        .A2(Midori_rounds_constant_MUX_n30), .ZN(
        Midori_rounds_constant_MUX_n42) );
  INV_X1 Midori_rounds_constant_MUX_U6 ( .A(round_Signal[1]), .ZN(
        Midori_rounds_constant_MUX_n30) );
  NOR2_X1 Midori_rounds_constant_MUX_U5 ( .A1(enc_dec), .A2(round_Signal[3]), 
        .ZN(Midori_rounds_constant_MUX_n29) );
  NAND2_X1 Midori_rounds_constant_MUX_U4 ( .A1(Midori_rounds_constant_MUX_n31), 
        .A2(round_Signal[1]), .ZN(Midori_rounds_constant_MUX_n20) );
  AND2_X1 Midori_rounds_constant_MUX_U3 ( .A1(enc_dec), .A2(round_Signal[3]), 
        .ZN(Midori_rounds_constant_MUX_n31) );
  INV_X1 Midori_rounds_constant_MUX_U2 ( .A(Midori_rounds_constant_MUX_n18), 
        .ZN(Midori_rounds_constant_MUX_n17) );
  INV_X1 Midori_rounds_constant_MUX_U1 ( .A(round_Signal[0]), .ZN(
        Midori_rounds_constant_MUX_n18) );
  INV_X1 Midori_rounds_MUXInst_U4 ( .A(round_Signal[0]), .ZN(
        Midori_rounds_MUXInst_n11) );
  INV_X1 Midori_rounds_MUXInst_U3 ( .A(Midori_rounds_MUXInst_n11), .ZN(
        Midori_rounds_MUXInst_n8) );
  INV_X1 Midori_rounds_MUXInst_U2 ( .A(Midori_rounds_MUXInst_n11), .ZN(
        Midori_rounds_MUXInst_n9) );
  INV_X1 Midori_rounds_MUXInst_U1 ( .A(Midori_rounds_MUXInst_n11), .ZN(
        Midori_rounds_MUXInst_n10) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_0_U1 ( .A(key[64]), .B(key[0]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_0_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_1_U1 ( .A(key[65]), .B(key[1]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_1_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_2_U1 ( .A(key[66]), .B(key[2]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_2_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_3_U1 ( .A(key[67]), .B(key[3]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_3_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_4_U1 ( .A(key[68]), .B(key[4]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_4_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_5_U1 ( .A(key[69]), .B(key[5]), .S(
        Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_5_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_6_U1 ( .A(key[70]), .B(key[6]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_6_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_7_U1 ( .A(key[71]), .B(key[7]), .S(
        Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_7_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_8_U1 ( .A(key[72]), .B(key[8]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_8_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_9_U1 ( .A(key[73]), .B(key[9]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_9_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_10_U1 ( .A(key[74]), .B(key[10]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_10_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_11_U1 ( .A(key[75]), .B(key[11]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_11_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_12_U1 ( .A(key[76]), .B(key[12]), .S(
        Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_12_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_13_U1 ( .A(key[77]), .B(key[13]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_13_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_14_U1 ( .A(key[78]), .B(key[14]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_14_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_15_U1 ( .A(key[79]), .B(key[15]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_15_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_16_U1 ( .A(key[80]), .B(key[16]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_16_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_17_U1 ( .A(key[81]), .B(key[17]), .S(
        Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_17_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_18_U1 ( .A(key[82]), .B(key[18]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_18_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_19_U1 ( .A(key[83]), .B(key[19]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_19_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_20_U1 ( .A(key[84]), .B(key[20]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_20_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_21_U1 ( .A(key[85]), .B(key[21]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_21_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_22_U1 ( .A(key[86]), .B(key[22]), .S(
        Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_22_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_23_U1 ( .A(key[87]), .B(key[23]), .S(
        Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_23_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_24_U1 ( .A(key[88]), .B(key[24]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_24_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_25_U1 ( .A(key[89]), .B(key[25]), .S(
        Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_25_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_26_U1 ( .A(key[90]), .B(key[26]), .S(
        round_Signal[0]), .Z(Midori_rounds_SelectedKey_26_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_27_U1 ( .A(key[91]), .B(key[27]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_27_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_28_U1 ( .A(key[92]), .B(key[28]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_28_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_29_U1 ( .A(key[93]), .B(key[29]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_29_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_30_U1 ( .A(key[94]), .B(key[30]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_30_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_31_U1 ( .A(key[95]), .B(key[31]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_31_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_32_U1 ( .A(key[96]), .B(key[32]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_32_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_33_U1 ( .A(key[97]), .B(key[33]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_33_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_34_U1 ( .A(key[98]), .B(key[34]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_34_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_35_U1 ( .A(key[99]), .B(key[35]), .S(
        Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_35_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_36_U1 ( .A(key[100]), .B(key[36]), 
        .S(Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_36_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_37_U1 ( .A(key[101]), .B(key[37]), 
        .S(Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_37_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_38_U1 ( .A(key[102]), .B(key[38]), 
        .S(Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_38_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_39_U1 ( .A(key[103]), .B(key[39]), 
        .S(Midori_rounds_MUXInst_n10), .Z(Midori_rounds_SelectedKey_39_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_40_U1 ( .A(key[104]), .B(key[40]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_40_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_41_U1 ( .A(key[105]), .B(key[41]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_41_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_42_U1 ( .A(key[106]), .B(key[42]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_42_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_43_U1 ( .A(key[107]), .B(key[43]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_43_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_44_U1 ( .A(key[108]), .B(key[44]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_44_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_45_U1 ( .A(key[109]), .B(key[45]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_45_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_46_U1 ( .A(key[110]), .B(key[46]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_46_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_47_U1 ( .A(key[111]), .B(key[47]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_47_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_48_U1 ( .A(key[112]), .B(key[48]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_48_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_49_U1 ( .A(key[113]), .B(key[49]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_49_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_50_U1 ( .A(key[114]), .B(key[50]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_50_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_51_U1 ( .A(key[115]), .B(key[51]), 
        .S(Midori_rounds_MUXInst_n9), .Z(Midori_rounds_SelectedKey_51_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_52_U1 ( .A(key[116]), .B(key[52]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_52_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_53_U1 ( .A(key[117]), .B(key[53]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_53_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_54_U1 ( .A(key[118]), .B(key[54]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_54_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_55_U1 ( .A(key[119]), .B(key[55]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_55_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_56_U1 ( .A(key[120]), .B(key[56]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_56_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_57_U1 ( .A(key[121]), .B(key[57]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_57_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_58_U1 ( .A(key[122]), .B(key[58]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_58_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_59_U1 ( .A(key[123]), .B(key[59]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_59_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_60_U1 ( .A(key[124]), .B(key[60]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_60_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_61_U1 ( .A(key[125]), .B(key[61]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_61_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_62_U1 ( .A(key[126]), .B(key[62]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_62_) );
  MUX2_X1 Midori_rounds_MUXInst_mux_inst_63_U1 ( .A(key[127]), .B(key[63]), 
        .S(Midori_rounds_MUXInst_n8), .Z(Midori_rounds_SelectedKey_63_) );
  INV_X1 Midori_rounds_roundResult_Reg_U3 ( .A(RegEnable), .ZN(
        Midori_rounds_roundResult_Reg_n9) );
  INV_X2 Midori_rounds_roundResult_Reg_U2 ( .A(
        Midori_rounds_roundResult_Reg_n9), .ZN(
        Midori_rounds_roundResult_Reg_n7) );
  INV_X1 Midori_rounds_roundResult_Reg_U1 ( .A(
        Midori_rounds_roundResult_Reg_n9), .ZN(
        Midori_rounds_roundResult_Reg_n8) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_0_U1 ( .A(
        Midori_rounds_roundReg_out[0]), .B(
        Midori_rounds_roundResult_Reg_SFF_0_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_0_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_0_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[0]), .B(Midori_add_Result_Start[0]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_0_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_0_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[0]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_0_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_0_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_0_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[0]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_1_U1 ( .A(
        Midori_rounds_roundReg_out[1]), .B(
        Midori_rounds_roundResult_Reg_SFF_1_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_1_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_1_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[1]), .B(Midori_add_Result_Start[1]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_1_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_1_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[1]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_1_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_1_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_1_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[1]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_2_U1 ( .A(
        Midori_rounds_roundReg_out[2]), .B(
        Midori_rounds_roundResult_Reg_SFF_2_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_2_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_2_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[2]), .B(Midori_add_Result_Start[2]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_2_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_2_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[2]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_2_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_2_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_2_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[2]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_3_U1 ( .A(
        Midori_rounds_roundReg_out[3]), .B(
        Midori_rounds_roundResult_Reg_SFF_3_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_3_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_3_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[3]), .B(Midori_add_Result_Start[3]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_3_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_3_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[3]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_3_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_3_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_3_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[3]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_4_U1 ( .A(
        Midori_rounds_roundReg_out[4]), .B(
        Midori_rounds_roundResult_Reg_SFF_4_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_4_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_4_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[4]), .B(Midori_add_Result_Start[4]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_4_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_4_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[4]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_4_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_4_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_4_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[4]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_5_U1 ( .A(
        Midori_rounds_roundReg_out[5]), .B(
        Midori_rounds_roundResult_Reg_SFF_5_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_5_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_5_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[5]), .B(Midori_add_Result_Start[5]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_5_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_5_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[5]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_5_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_5_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_5_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[5]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_6_U1 ( .A(
        Midori_rounds_roundReg_out[6]), .B(
        Midori_rounds_roundResult_Reg_SFF_6_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_6_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_6_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[6]), .B(Midori_add_Result_Start[6]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_6_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_6_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[6]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_6_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_6_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_6_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[6]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_7_U1 ( .A(
        Midori_rounds_roundReg_out[7]), .B(
        Midori_rounds_roundResult_Reg_SFF_7_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_7_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_7_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[7]), .B(Midori_add_Result_Start[7]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_7_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_7_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[7]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_7_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_7_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_7_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[7]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_8_U1 ( .A(
        Midori_rounds_roundReg_out[8]), .B(
        Midori_rounds_roundResult_Reg_SFF_8_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_8_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_8_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[8]), .B(Midori_add_Result_Start[8]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_8_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_8_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[8]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_8_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_8_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_8_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[8]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_9_U1 ( .A(
        Midori_rounds_roundReg_out[9]), .B(
        Midori_rounds_roundResult_Reg_SFF_9_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_9_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_9_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[9]), .B(Midori_add_Result_Start[9]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_9_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_9_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[9]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_9_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_9_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_9_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[9]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_10_U1 ( .A(
        Midori_rounds_roundReg_out[10]), .B(
        Midori_rounds_roundResult_Reg_SFF_10_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_10_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_10_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[10]), .B(Midori_add_Result_Start[10]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_10_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_10_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[10]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_10_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_10_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_10_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[10]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_11_U1 ( .A(
        Midori_rounds_roundReg_out[11]), .B(
        Midori_rounds_roundResult_Reg_SFF_11_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_11_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_11_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[11]), .B(Midori_add_Result_Start[11]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_11_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_11_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[11]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_11_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_11_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_11_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[11]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_12_U1 ( .A(
        Midori_rounds_roundReg_out[12]), .B(
        Midori_rounds_roundResult_Reg_SFF_12_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_12_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_12_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[12]), .B(Midori_add_Result_Start[12]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_12_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_12_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[12]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_12_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_12_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_12_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[12]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_13_U1 ( .A(
        Midori_rounds_roundReg_out[13]), .B(
        Midori_rounds_roundResult_Reg_SFF_13_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_13_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_13_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[13]), .B(Midori_add_Result_Start[13]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_13_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_13_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[13]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_13_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_13_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_13_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[13]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_14_U1 ( .A(
        Midori_rounds_roundReg_out[14]), .B(
        Midori_rounds_roundResult_Reg_SFF_14_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_14_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_14_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[14]), .B(Midori_add_Result_Start[14]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_14_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_14_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[14]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_14_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_14_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_14_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[14]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_15_U1 ( .A(
        Midori_rounds_roundReg_out[15]), .B(
        Midori_rounds_roundResult_Reg_SFF_15_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_15_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_15_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[15]), .B(Midori_add_Result_Start[15]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_15_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_15_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[15]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_15_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_15_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_15_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[15]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_16_U1 ( .A(
        Midori_rounds_roundReg_out[16]), .B(
        Midori_rounds_roundResult_Reg_SFF_16_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_16_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_16_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[16]), .B(Midori_add_Result_Start[16]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_16_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_16_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[16]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_16_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_16_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_16_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[16]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_17_U1 ( .A(
        Midori_rounds_roundReg_out[17]), .B(
        Midori_rounds_roundResult_Reg_SFF_17_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_17_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_17_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[17]), .B(Midori_add_Result_Start[17]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_17_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_17_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[17]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_17_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_17_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_17_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[17]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_18_U1 ( .A(
        Midori_rounds_roundReg_out[18]), .B(
        Midori_rounds_roundResult_Reg_SFF_18_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_18_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_18_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[18]), .B(Midori_add_Result_Start[18]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_18_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_18_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[18]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_18_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_18_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_18_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[18]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_19_U1 ( .A(
        Midori_rounds_roundReg_out[19]), .B(
        Midori_rounds_roundResult_Reg_SFF_19_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_19_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_19_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[19]), .B(Midori_add_Result_Start[19]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_19_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_19_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[19]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_19_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_19_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_19_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[19]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_20_U1 ( .A(
        Midori_rounds_roundReg_out[20]), .B(
        Midori_rounds_roundResult_Reg_SFF_20_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_20_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_20_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[20]), .B(Midori_add_Result_Start[20]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_20_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_20_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[20]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_20_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_20_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_20_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[20]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_21_U1 ( .A(
        Midori_rounds_roundReg_out[21]), .B(
        Midori_rounds_roundResult_Reg_SFF_21_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_21_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_21_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[21]), .B(Midori_add_Result_Start[21]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_21_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_21_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[21]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_21_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_21_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_21_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[21]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_22_U1 ( .A(
        Midori_rounds_roundReg_out[22]), .B(
        Midori_rounds_roundResult_Reg_SFF_22_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_22_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_22_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[22]), .B(Midori_add_Result_Start[22]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_22_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_22_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[22]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_22_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_22_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_22_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[22]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_23_U1 ( .A(
        Midori_rounds_roundReg_out[23]), .B(
        Midori_rounds_roundResult_Reg_SFF_23_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_23_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_23_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[23]), .B(Midori_add_Result_Start[23]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_23_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_23_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[23]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_23_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_23_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_23_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[23]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_24_U1 ( .A(
        Midori_rounds_roundReg_out[24]), .B(
        Midori_rounds_roundResult_Reg_SFF_24_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_24_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_24_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[24]), .B(Midori_add_Result_Start[24]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_24_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_24_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[24]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_24_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_24_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_24_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[24]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_25_U1 ( .A(
        Midori_rounds_roundReg_out[25]), .B(
        Midori_rounds_roundResult_Reg_SFF_25_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_25_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_25_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[25]), .B(Midori_add_Result_Start[25]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_25_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_25_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[25]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_25_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_25_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_25_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[25]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_26_U1 ( .A(
        Midori_rounds_roundReg_out[26]), .B(
        Midori_rounds_roundResult_Reg_SFF_26_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_26_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_26_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[26]), .B(Midori_add_Result_Start[26]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_26_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_26_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[26]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_26_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_26_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_26_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[26]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_27_U1 ( .A(
        Midori_rounds_roundReg_out[27]), .B(
        Midori_rounds_roundResult_Reg_SFF_27_DQ), .S(
        Midori_rounds_roundResult_Reg_n8), .Z(
        Midori_rounds_roundResult_Reg_SFF_27_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_27_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[27]), .B(Midori_add_Result_Start[27]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_27_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_27_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[27]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_27_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_27_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_27_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[27]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_28_U1 ( .A(
        Midori_rounds_roundReg_out[28]), .B(
        Midori_rounds_roundResult_Reg_SFF_28_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_28_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_28_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[28]), .B(Midori_add_Result_Start[28]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_28_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_28_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[28]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_28_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_28_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_28_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[28]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_29_U1 ( .A(
        Midori_rounds_roundReg_out[29]), .B(
        Midori_rounds_roundResult_Reg_SFF_29_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_29_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_29_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[29]), .B(Midori_add_Result_Start[29]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_29_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_29_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[29]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_29_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_29_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_29_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[29]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_30_U1 ( .A(
        Midori_rounds_roundReg_out[30]), .B(
        Midori_rounds_roundResult_Reg_SFF_30_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_30_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_30_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[30]), .B(Midori_add_Result_Start[30]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_30_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_30_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[30]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_30_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_30_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_30_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[30]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_31_U1 ( .A(
        Midori_rounds_roundReg_out[31]), .B(
        Midori_rounds_roundResult_Reg_SFF_31_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_31_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_31_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[31]), .B(Midori_add_Result_Start[31]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_31_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_31_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[31]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_31_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_31_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_31_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[31]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_32_U1 ( .A(
        Midori_rounds_roundReg_out[32]), .B(
        Midori_rounds_roundResult_Reg_SFF_32_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_32_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_32_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[32]), .B(Midori_add_Result_Start[32]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_32_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_32_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[32]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_32_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_32_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_32_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[32]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_33_U1 ( .A(
        Midori_rounds_roundReg_out[33]), .B(
        Midori_rounds_roundResult_Reg_SFF_33_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_33_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_33_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[33]), .B(Midori_add_Result_Start[33]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_33_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_33_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[33]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_33_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_33_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_33_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[33]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_34_U1 ( .A(
        Midori_rounds_roundReg_out[34]), .B(
        Midori_rounds_roundResult_Reg_SFF_34_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_34_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_34_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[34]), .B(Midori_add_Result_Start[34]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_34_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_34_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[34]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_34_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_34_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_34_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[34]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_35_U1 ( .A(
        Midori_rounds_roundReg_out[35]), .B(
        Midori_rounds_roundResult_Reg_SFF_35_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_35_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_35_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[35]), .B(Midori_add_Result_Start[35]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_35_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_35_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[35]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_35_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_35_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_35_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[35]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_36_U1 ( .A(
        Midori_rounds_roundReg_out[36]), .B(
        Midori_rounds_roundResult_Reg_SFF_36_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_36_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_36_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[36]), .B(Midori_add_Result_Start[36]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_36_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_36_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[36]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_36_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_36_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_36_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[36]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_37_U1 ( .A(
        Midori_rounds_roundReg_out[37]), .B(
        Midori_rounds_roundResult_Reg_SFF_37_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_37_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_37_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[37]), .B(Midori_add_Result_Start[37]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_37_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_37_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[37]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_37_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_37_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_37_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[37]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_38_U1 ( .A(
        Midori_rounds_roundReg_out[38]), .B(
        Midori_rounds_roundResult_Reg_SFF_38_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_38_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_38_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[38]), .B(Midori_add_Result_Start[38]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_38_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_38_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[38]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_38_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_38_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_38_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[38]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_39_U1 ( .A(
        Midori_rounds_roundReg_out[39]), .B(
        Midori_rounds_roundResult_Reg_SFF_39_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_39_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_39_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[39]), .B(Midori_add_Result_Start[39]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_39_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_39_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[39]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_39_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_39_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_39_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[39]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_40_U1 ( .A(
        Midori_rounds_roundReg_out[40]), .B(
        Midori_rounds_roundResult_Reg_SFF_40_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_40_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_40_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[40]), .B(Midori_add_Result_Start[40]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_40_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_40_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[40]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_40_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_40_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_40_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[40]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_41_U1 ( .A(
        Midori_rounds_roundReg_out[41]), .B(
        Midori_rounds_roundResult_Reg_SFF_41_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_41_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_41_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[41]), .B(Midori_add_Result_Start[41]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_41_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_41_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[41]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_41_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_41_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_41_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[41]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_42_U1 ( .A(
        Midori_rounds_roundReg_out[42]), .B(
        Midori_rounds_roundResult_Reg_SFF_42_DQ), .S(RegEnable), .Z(
        Midori_rounds_roundResult_Reg_SFF_42_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_42_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[42]), .B(Midori_add_Result_Start[42]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_42_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_42_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[42]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_42_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_42_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_42_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[42]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_43_U1 ( .A(
        Midori_rounds_roundReg_out[43]), .B(
        Midori_rounds_roundResult_Reg_SFF_43_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_43_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_43_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[43]), .B(Midori_add_Result_Start[43]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_43_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_43_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[43]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_43_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_43_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_43_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[43]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_44_U1 ( .A(
        Midori_rounds_roundReg_out[44]), .B(
        Midori_rounds_roundResult_Reg_SFF_44_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_44_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_44_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[44]), .B(Midori_add_Result_Start[44]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_44_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_44_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[44]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_44_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_44_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_44_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[44]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_45_U1 ( .A(
        Midori_rounds_roundReg_out[45]), .B(
        Midori_rounds_roundResult_Reg_SFF_45_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_45_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_45_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[45]), .B(Midori_add_Result_Start[45]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_45_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_45_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[45]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_45_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_45_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_45_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[45]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_46_U1 ( .A(
        Midori_rounds_roundReg_out[46]), .B(
        Midori_rounds_roundResult_Reg_SFF_46_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_46_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_46_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[46]), .B(Midori_add_Result_Start[46]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_46_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_46_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[46]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_46_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_46_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_46_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[46]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_47_U1 ( .A(
        Midori_rounds_roundReg_out[47]), .B(
        Midori_rounds_roundResult_Reg_SFF_47_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_47_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_47_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[47]), .B(Midori_add_Result_Start[47]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_47_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_47_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[47]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_47_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_47_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_47_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[47]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_48_U1 ( .A(
        Midori_rounds_roundReg_out[48]), .B(
        Midori_rounds_roundResult_Reg_SFF_48_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_48_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_48_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[48]), .B(Midori_add_Result_Start[48]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_48_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_48_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[48]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_48_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_48_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_48_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[48]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_49_U1 ( .A(
        Midori_rounds_roundReg_out[49]), .B(
        Midori_rounds_roundResult_Reg_SFF_49_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_49_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_49_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[49]), .B(Midori_add_Result_Start[49]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_49_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_49_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[49]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_49_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_49_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_49_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[49]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_50_U1 ( .A(
        Midori_rounds_roundReg_out[50]), .B(
        Midori_rounds_roundResult_Reg_SFF_50_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_50_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_50_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[50]), .B(Midori_add_Result_Start[50]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_50_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_50_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[50]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_50_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_50_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_50_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[50]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_51_U1 ( .A(
        Midori_rounds_roundReg_out[51]), .B(
        Midori_rounds_roundResult_Reg_SFF_51_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_51_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_51_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[51]), .B(Midori_add_Result_Start[51]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_51_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_51_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[51]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_51_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_51_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_51_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[51]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_52_U1 ( .A(
        Midori_rounds_roundReg_out[52]), .B(
        Midori_rounds_roundResult_Reg_SFF_52_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_52_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_52_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[52]), .B(Midori_add_Result_Start[52]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_52_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_52_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[52]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_52_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_52_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_52_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[52]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_53_U1 ( .A(
        Midori_rounds_roundReg_out[53]), .B(
        Midori_rounds_roundResult_Reg_SFF_53_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_53_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_53_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[53]), .B(Midori_add_Result_Start[53]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_53_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_53_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[53]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_53_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_53_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_53_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[53]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_54_U1 ( .A(
        Midori_rounds_roundReg_out[54]), .B(
        Midori_rounds_roundResult_Reg_SFF_54_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_54_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_54_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[54]), .B(Midori_add_Result_Start[54]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_54_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_54_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[54]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_54_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_54_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_54_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[54]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_55_U1 ( .A(
        Midori_rounds_roundReg_out[55]), .B(
        Midori_rounds_roundResult_Reg_SFF_55_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_55_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_55_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[55]), .B(Midori_add_Result_Start[55]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_55_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_55_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[55]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_55_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_55_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_55_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[55]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_56_U1 ( .A(
        Midori_rounds_roundReg_out[56]), .B(
        Midori_rounds_roundResult_Reg_SFF_56_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_56_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_56_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[56]), .B(Midori_add_Result_Start[56]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_56_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_56_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[56]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_56_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_56_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_56_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[56]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_57_U1 ( .A(
        Midori_rounds_roundReg_out[57]), .B(
        Midori_rounds_roundResult_Reg_SFF_57_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_57_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_57_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[57]), .B(Midori_add_Result_Start[57]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_57_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_57_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[57]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_57_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_57_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_57_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[57]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_58_U1 ( .A(
        Midori_rounds_roundReg_out[58]), .B(
        Midori_rounds_roundResult_Reg_SFF_58_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_58_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_58_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[58]), .B(Midori_add_Result_Start[58]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_58_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_58_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[58]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_58_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_58_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_58_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[58]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_59_U1 ( .A(
        Midori_rounds_roundReg_out[59]), .B(
        Midori_rounds_roundResult_Reg_SFF_59_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_59_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_59_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[59]), .B(Midori_add_Result_Start[59]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_59_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_59_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[59]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_59_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_59_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_59_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[59]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_60_U1 ( .A(
        Midori_rounds_roundReg_out[60]), .B(
        Midori_rounds_roundResult_Reg_SFF_60_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_60_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_60_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[60]), .B(Midori_add_Result_Start[60]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_60_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_60_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[60]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_60_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_60_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_60_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[60]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_61_U1 ( .A(
        Midori_rounds_roundReg_out[61]), .B(
        Midori_rounds_roundResult_Reg_SFF_61_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_61_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_61_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[61]), .B(Midori_add_Result_Start[61]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_61_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_61_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[61]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_61_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_61_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_61_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[61]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_62_U1 ( .A(
        Midori_rounds_roundReg_out[62]), .B(
        Midori_rounds_roundResult_Reg_SFF_62_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_62_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_62_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[62]), .B(Midori_add_Result_Start[62]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_62_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_62_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[62]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_62_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_62_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_62_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[62]), .QN() );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_63_U1 ( .A(
        Midori_rounds_roundReg_out[63]), .B(
        Midori_rounds_roundResult_Reg_SFF_63_DQ), .S(
        Midori_rounds_roundResult_Reg_n7), .Z(
        Midori_rounds_roundResult_Reg_SFF_63_n5) );
  MUX2_X1 Midori_rounds_roundResult_Reg_SFF_63_MUXInst_U1 ( .A(
        Midori_rounds_round_Result[63]), .B(Midori_add_Result_Start[63]), .S(
        reset), .Z(Midori_rounds_roundResult_Reg_SFF_63_DQ) );
  INV_X1 Midori_rounds_roundResult_Reg_SFF_63_Q_reg_U1 ( .A(
        Midori_rounds_roundReg_out[63]), .ZN(
        Midori_rounds_roundResult_Reg_SFF_63_Q_reg_QN) );
  DFF_X1 Midori_rounds_roundResult_Reg_SFF_63_Q_reg_FF_FF ( .D(
        Midori_rounds_roundResult_Reg_SFF_63_n5), .CK(clk), .Q(
        Midori_rounds_roundReg_out[63]), .QN() );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_0_n14), .ZN(Midori_rounds_SR_Result[51])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_0_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n13), .A2(
        Midori_rounds_roundReg_out[1]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_0_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_0_n12), .ZN(Midori_rounds_SR_Result[50])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n11), .A2(
        Midori_rounds_roundReg_out[1]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_0_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_0_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_0_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U14 ( .A1(
        Midori_rounds_roundReg_out[0]), .A2(Midori_rounds_roundReg_out[3]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_0_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_0_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_0_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_0_n5), .ZN(Midori_rounds_SR_Result[49])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U11 ( .A1(
        Midori_rounds_roundReg_out[0]), .A2(Midori_rounds_sub_sBox_PRINCE_0_n4), .ZN(Midori_rounds_sub_sBox_PRINCE_0_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U10 ( .A1(
        Midori_rounds_roundReg_out[3]), .A2(Midori_rounds_sub_sBox_PRINCE_0_n9), .ZN(Midori_rounds_sub_sBox_PRINCE_0_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_0_U9 ( .A1(
        Midori_rounds_roundReg_out[2]), .A2(Midori_rounds_sub_sBox_PRINCE_0_n8), .ZN(Midori_rounds_sub_sBox_PRINCE_0_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_0_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_0_n3), .ZN(Midori_rounds_SR_Result[48])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_0_U7 ( .A1(
        Midori_rounds_roundReg_out[1]), .A2(Midori_rounds_sub_sBox_PRINCE_0_n2), .ZN(Midori_rounds_sub_sBox_PRINCE_0_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_0_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_0_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_0_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_0_U5 ( .A1(
        Midori_rounds_roundReg_out[2]), .A2(Midori_rounds_roundReg_out[3]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_0_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_0_U4 ( .A(Midori_rounds_roundReg_out[0]), .ZN(Midori_rounds_sub_sBox_PRINCE_0_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_0_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_0_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_0_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_0_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_0_U2 ( .A(Midori_rounds_roundReg_out[3]), .ZN(Midori_rounds_sub_sBox_PRINCE_0_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_0_U1 ( .A(Midori_rounds_roundReg_out[2]), .ZN(Midori_rounds_sub_sBox_PRINCE_0_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_1_n14), .ZN(Midori_rounds_SR_Result[47])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_1_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n13), .A2(
        Midori_rounds_roundReg_out[5]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_1_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_1_n12), .ZN(Midori_rounds_SR_Result[46])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n11), .A2(
        Midori_rounds_roundReg_out[5]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_1_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_1_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_1_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U14 ( .A1(
        Midori_rounds_roundReg_out[4]), .A2(Midori_rounds_roundReg_out[7]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_1_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_1_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_1_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_1_n5), .ZN(Midori_rounds_SR_Result[45])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U11 ( .A1(
        Midori_rounds_roundReg_out[4]), .A2(Midori_rounds_sub_sBox_PRINCE_1_n4), .ZN(Midori_rounds_sub_sBox_PRINCE_1_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U10 ( .A1(
        Midori_rounds_roundReg_out[7]), .A2(Midori_rounds_sub_sBox_PRINCE_1_n9), .ZN(Midori_rounds_sub_sBox_PRINCE_1_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_1_U9 ( .A1(
        Midori_rounds_roundReg_out[6]), .A2(Midori_rounds_sub_sBox_PRINCE_1_n8), .ZN(Midori_rounds_sub_sBox_PRINCE_1_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_1_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_1_n3), .ZN(Midori_rounds_SR_Result[44])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_1_U7 ( .A1(
        Midori_rounds_roundReg_out[5]), .A2(Midori_rounds_sub_sBox_PRINCE_1_n2), .ZN(Midori_rounds_sub_sBox_PRINCE_1_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_1_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_1_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_1_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_1_U5 ( .A1(
        Midori_rounds_roundReg_out[6]), .A2(Midori_rounds_roundReg_out[7]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_1_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_1_U4 ( .A(Midori_rounds_roundReg_out[4]), .ZN(Midori_rounds_sub_sBox_PRINCE_1_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_1_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_1_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_1_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_1_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_1_U2 ( .A(Midori_rounds_roundReg_out[7]), .ZN(Midori_rounds_sub_sBox_PRINCE_1_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_1_U1 ( .A(Midori_rounds_roundReg_out[6]), .ZN(Midori_rounds_sub_sBox_PRINCE_1_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n14), .ZN(Midori_rounds_SR_Result[11])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_2_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n13), .A2(
        Midori_rounds_roundReg_out[9]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n12), .ZN(Midori_rounds_SR_Result[10])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n11), .A2(
        Midori_rounds_roundReg_out[9]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U14 ( .A1(
        Midori_rounds_roundReg_out[8]), .A2(Midori_rounds_roundReg_out[11]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_2_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n5), .ZN(Midori_rounds_SR_Result[9])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U11 ( .A1(
        Midori_rounds_roundReg_out[8]), .A2(Midori_rounds_sub_sBox_PRINCE_2_n4), .ZN(Midori_rounds_sub_sBox_PRINCE_2_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U10 ( .A1(
        Midori_rounds_roundReg_out[11]), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_2_U9 ( .A1(
        Midori_rounds_roundReg_out[10]), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_2_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n3), .ZN(Midori_rounds_SR_Result[8])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_2_U7 ( .A1(
        Midori_rounds_roundReg_out[9]), .A2(Midori_rounds_sub_sBox_PRINCE_2_n2), .ZN(Midori_rounds_sub_sBox_PRINCE_2_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_2_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_2_U5 ( .A1(
        Midori_rounds_roundReg_out[10]), .A2(Midori_rounds_roundReg_out[11]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_2_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_2_U4 ( .A(Midori_rounds_roundReg_out[8]), .ZN(Midori_rounds_sub_sBox_PRINCE_2_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_2_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_2_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_2_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_2_U2 ( .A(
        Midori_rounds_roundReg_out[11]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_2_U1 ( .A(
        Midori_rounds_roundReg_out[10]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_2_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n14), .ZN(Midori_rounds_SR_Result[23])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_3_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n13), .A2(
        Midori_rounds_roundReg_out[13]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n12), .ZN(Midori_rounds_SR_Result[22])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n11), .A2(
        Midori_rounds_roundReg_out[13]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U14 ( .A1(
        Midori_rounds_roundReg_out[12]), .A2(Midori_rounds_roundReg_out[15]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_3_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n5), .ZN(Midori_rounds_SR_Result[21])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U11 ( .A1(
        Midori_rounds_roundReg_out[12]), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U10 ( .A1(
        Midori_rounds_roundReg_out[15]), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_3_U9 ( .A1(
        Midori_rounds_roundReg_out[14]), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_3_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n3), .ZN(Midori_rounds_SR_Result[20])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_3_U7 ( .A1(
        Midori_rounds_roundReg_out[13]), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_3_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_3_U5 ( .A1(
        Midori_rounds_roundReg_out[14]), .A2(Midori_rounds_roundReg_out[15]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_3_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_3_U4 ( .A(
        Midori_rounds_roundReg_out[12]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_3_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_3_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_3_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_3_U2 ( .A(
        Midori_rounds_roundReg_out[15]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_3_U1 ( .A(
        Midori_rounds_roundReg_out[14]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_3_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n14), .ZN(Midori_rounds_SR_Result[39])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_4_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n13), .A2(
        Midori_rounds_roundReg_out[17]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n12), .ZN(Midori_rounds_SR_Result[38])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n11), .A2(
        Midori_rounds_roundReg_out[17]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U14 ( .A1(
        Midori_rounds_roundReg_out[16]), .A2(Midori_rounds_roundReg_out[19]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_4_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n5), .ZN(Midori_rounds_SR_Result[37])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U11 ( .A1(
        Midori_rounds_roundReg_out[16]), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U10 ( .A1(
        Midori_rounds_roundReg_out[19]), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_4_U9 ( .A1(
        Midori_rounds_roundReg_out[18]), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_4_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n3), .ZN(Midori_rounds_SR_Result[36])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_4_U7 ( .A1(
        Midori_rounds_roundReg_out[17]), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_4_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_4_U5 ( .A1(
        Midori_rounds_roundReg_out[18]), .A2(Midori_rounds_roundReg_out[19]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_4_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_4_U4 ( .A(
        Midori_rounds_roundReg_out[16]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_4_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_4_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_4_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_4_U2 ( .A(
        Midori_rounds_roundReg_out[19]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_4_U1 ( .A(
        Midori_rounds_roundReg_out[18]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_4_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n14), .ZN(Midori_rounds_SR_Result[59])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_5_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n13), .A2(
        Midori_rounds_roundReg_out[21]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n12), .ZN(Midori_rounds_SR_Result[58])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n11), .A2(
        Midori_rounds_roundReg_out[21]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U14 ( .A1(
        Midori_rounds_roundReg_out[20]), .A2(Midori_rounds_roundReg_out[23]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_5_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n5), .ZN(Midori_rounds_SR_Result[57])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U11 ( .A1(
        Midori_rounds_roundReg_out[20]), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U10 ( .A1(
        Midori_rounds_roundReg_out[23]), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_5_U9 ( .A1(
        Midori_rounds_roundReg_out[22]), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_5_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n3), .ZN(Midori_rounds_SR_Result[56])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_5_U7 ( .A1(
        Midori_rounds_roundReg_out[21]), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_5_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_5_U5 ( .A1(
        Midori_rounds_roundReg_out[22]), .A2(Midori_rounds_roundReg_out[23]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_5_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_5_U4 ( .A(
        Midori_rounds_roundReg_out[20]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_5_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_5_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_5_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_5_U2 ( .A(
        Midori_rounds_roundReg_out[23]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_5_U1 ( .A(
        Midori_rounds_roundReg_out[22]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_5_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n14), .ZN(Midori_rounds_SR_Result[31])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_6_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n13), .A2(
        Midori_rounds_roundReg_out[25]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n12), .ZN(Midori_rounds_SR_Result[30])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n11), .A2(
        Midori_rounds_roundReg_out[25]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U14 ( .A1(
        Midori_rounds_roundReg_out[24]), .A2(Midori_rounds_roundReg_out[27]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_6_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n5), .ZN(Midori_rounds_SR_Result[29])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U11 ( .A1(
        Midori_rounds_roundReg_out[24]), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U10 ( .A1(
        Midori_rounds_roundReg_out[27]), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_6_U9 ( .A1(
        Midori_rounds_roundReg_out[26]), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_6_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n3), .ZN(Midori_rounds_SR_Result[28])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_6_U7 ( .A1(
        Midori_rounds_roundReg_out[25]), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_6_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_6_U5 ( .A1(
        Midori_rounds_roundReg_out[26]), .A2(Midori_rounds_roundReg_out[27]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_6_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_6_U4 ( .A(
        Midori_rounds_roundReg_out[24]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_6_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_6_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_6_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_6_U2 ( .A(
        Midori_rounds_roundReg_out[27]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_6_U1 ( .A(
        Midori_rounds_roundReg_out[26]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_6_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n14), .ZN(Midori_rounds_SR_Result[3])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_7_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n13), .A2(
        Midori_rounds_roundReg_out[29]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n12), .ZN(Midori_rounds_SR_Result[2])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n11), .A2(
        Midori_rounds_roundReg_out[29]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U14 ( .A1(
        Midori_rounds_roundReg_out[28]), .A2(Midori_rounds_roundReg_out[31]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_7_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n5), .ZN(Midori_rounds_SR_Result[1])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U11 ( .A1(
        Midori_rounds_roundReg_out[28]), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U10 ( .A1(
        Midori_rounds_roundReg_out[31]), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_7_U9 ( .A1(
        Midori_rounds_roundReg_out[30]), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_7_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n3), .ZN(Midori_rounds_SR_Result[0])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_7_U7 ( .A1(
        Midori_rounds_roundReg_out[29]), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_7_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_7_U5 ( .A1(
        Midori_rounds_roundReg_out[30]), .A2(Midori_rounds_roundReg_out[31]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_7_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_7_U4 ( .A(
        Midori_rounds_roundReg_out[28]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_7_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_7_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_7_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_7_U2 ( .A(
        Midori_rounds_roundReg_out[31]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_7_U1 ( .A(
        Midori_rounds_roundReg_out[30]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_7_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n14), .ZN(Midori_rounds_SR_Result[15])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_8_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n13), .A2(
        Midori_rounds_roundReg_out[33]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n12), .ZN(Midori_rounds_SR_Result[14])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n11), .A2(
        Midori_rounds_roundReg_out[33]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U14 ( .A1(
        Midori_rounds_roundReg_out[32]), .A2(Midori_rounds_roundReg_out[35]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_8_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n5), .ZN(Midori_rounds_SR_Result[13])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U11 ( .A1(
        Midori_rounds_roundReg_out[32]), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U10 ( .A1(
        Midori_rounds_roundReg_out[35]), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_8_U9 ( .A1(
        Midori_rounds_roundReg_out[34]), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_8_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n3), .ZN(Midori_rounds_SR_Result[12])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_8_U7 ( .A1(
        Midori_rounds_roundReg_out[33]), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_8_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_8_U5 ( .A1(
        Midori_rounds_roundReg_out[34]), .A2(Midori_rounds_roundReg_out[35]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_8_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_8_U4 ( .A(
        Midori_rounds_roundReg_out[32]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_8_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_8_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_8_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_8_U2 ( .A(
        Midori_rounds_roundReg_out[35]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_8_U1 ( .A(
        Midori_rounds_roundReg_out[34]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_8_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n14), .ZN(Midori_rounds_SR_Result[19])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_9_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n13), .A2(
        Midori_rounds_roundReg_out[37]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n12), .ZN(Midori_rounds_SR_Result[18])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n11), .A2(
        Midori_rounds_roundReg_out[37]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U14 ( .A1(
        Midori_rounds_roundReg_out[36]), .A2(Midori_rounds_roundReg_out[39]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_9_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n5), .ZN(Midori_rounds_SR_Result[17])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U11 ( .A1(
        Midori_rounds_roundReg_out[36]), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U10 ( .A1(
        Midori_rounds_roundReg_out[39]), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_9_U9 ( .A1(
        Midori_rounds_roundReg_out[38]), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_9_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n3), .ZN(Midori_rounds_SR_Result[16])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_9_U7 ( .A1(
        Midori_rounds_roundReg_out[37]), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_9_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_9_U5 ( .A1(
        Midori_rounds_roundReg_out[38]), .A2(Midori_rounds_roundReg_out[39]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_9_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_9_U4 ( .A(
        Midori_rounds_roundReg_out[36]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_9_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_9_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_9_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_9_U2 ( .A(
        Midori_rounds_roundReg_out[39]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_9_U1 ( .A(
        Midori_rounds_roundReg_out[38]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_9_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n14), .ZN(Midori_rounds_SR_Result[55]) );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_10_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n13), .A2(
        Midori_rounds_roundReg_out[41]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n12), .ZN(Midori_rounds_SR_Result[54]) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n11), .A2(
        Midori_rounds_roundReg_out[41]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U14 ( .A1(
        Midori_rounds_roundReg_out[40]), .A2(Midori_rounds_roundReg_out[43]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_10_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n5), .ZN(Midori_rounds_SR_Result[53])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U11 ( .A1(
        Midori_rounds_roundReg_out[40]), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U10 ( .A1(
        Midori_rounds_roundReg_out[43]), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_10_U9 ( .A1(
        Midori_rounds_roundReg_out[42]), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_10_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n3), .ZN(Midori_rounds_SR_Result[52])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_10_U7 ( .A1(
        Midori_rounds_roundReg_out[41]), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_10_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_10_U5 ( .A1(
        Midori_rounds_roundReg_out[42]), .A2(Midori_rounds_roundReg_out[43]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_10_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_10_U4 ( .A(
        Midori_rounds_roundReg_out[40]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_10_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_10_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_10_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_10_U2 ( .A(
        Midori_rounds_roundReg_out[43]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_10_U1 ( .A(
        Midori_rounds_roundReg_out[42]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_10_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n14), .ZN(Midori_rounds_SR_Result[43]) );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_11_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n13), .A2(
        Midori_rounds_roundReg_out[45]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n12), .ZN(Midori_rounds_SR_Result[42]) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n11), .A2(
        Midori_rounds_roundReg_out[45]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U14 ( .A1(
        Midori_rounds_roundReg_out[44]), .A2(Midori_rounds_roundReg_out[47]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_11_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n5), .ZN(Midori_rounds_SR_Result[41])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U11 ( .A1(
        Midori_rounds_roundReg_out[44]), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U10 ( .A1(
        Midori_rounds_roundReg_out[47]), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_11_U9 ( .A1(
        Midori_rounds_roundReg_out[46]), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_11_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n3), .ZN(Midori_rounds_SR_Result[40])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_11_U7 ( .A1(
        Midori_rounds_roundReg_out[45]), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_11_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_11_U5 ( .A1(
        Midori_rounds_roundReg_out[46]), .A2(Midori_rounds_roundReg_out[47]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_11_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_11_U4 ( .A(
        Midori_rounds_roundReg_out[44]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_11_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_11_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_11_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_11_U2 ( .A(
        Midori_rounds_roundReg_out[47]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_11_U1 ( .A(
        Midori_rounds_roundReg_out[46]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_11_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n14), .ZN(Midori_rounds_SR_Result[27]) );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_12_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n13), .A2(
        Midori_rounds_roundReg_out[49]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n12), .ZN(Midori_rounds_SR_Result[26]) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n11), .A2(
        Midori_rounds_roundReg_out[49]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U14 ( .A1(
        Midori_rounds_roundReg_out[48]), .A2(Midori_rounds_roundReg_out[51]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_12_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n5), .ZN(Midori_rounds_SR_Result[25])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U11 ( .A1(
        Midori_rounds_roundReg_out[48]), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U10 ( .A1(
        Midori_rounds_roundReg_out[51]), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_12_U9 ( .A1(
        Midori_rounds_roundReg_out[50]), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_12_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n3), .ZN(Midori_rounds_SR_Result[24])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_12_U7 ( .A1(
        Midori_rounds_roundReg_out[49]), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_12_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_12_U5 ( .A1(
        Midori_rounds_roundReg_out[50]), .A2(Midori_rounds_roundReg_out[51]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_12_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_12_U4 ( .A(
        Midori_rounds_roundReg_out[48]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_12_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_12_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_12_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_12_U2 ( .A(
        Midori_rounds_roundReg_out[51]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_12_U1 ( .A(
        Midori_rounds_roundReg_out[50]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_12_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n14), .ZN(Midori_rounds_SR_Result[7])
         );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_13_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n13), .A2(
        Midori_rounds_roundReg_out[53]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n12), .ZN(Midori_rounds_SR_Result[6])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n11), .A2(
        Midori_rounds_roundReg_out[53]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U14 ( .A1(
        Midori_rounds_roundReg_out[52]), .A2(Midori_rounds_roundReg_out[55]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_13_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n5), .ZN(Midori_rounds_SR_Result[5])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U11 ( .A1(
        Midori_rounds_roundReg_out[52]), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U10 ( .A1(
        Midori_rounds_roundReg_out[55]), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_13_U9 ( .A1(
        Midori_rounds_roundReg_out[54]), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_13_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n3), .ZN(Midori_rounds_SR_Result[4])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_13_U7 ( .A1(
        Midori_rounds_roundReg_out[53]), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_13_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_13_U5 ( .A1(
        Midori_rounds_roundReg_out[54]), .A2(Midori_rounds_roundReg_out[55]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_13_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_13_U4 ( .A(
        Midori_rounds_roundReg_out[52]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_13_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_13_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_13_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_13_U2 ( .A(
        Midori_rounds_roundReg_out[55]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_13_U1 ( .A(
        Midori_rounds_roundReg_out[54]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_13_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n14), .ZN(Midori_rounds_SR_Result[35]) );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_14_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n13), .A2(
        Midori_rounds_roundReg_out[57]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n12), .ZN(Midori_rounds_SR_Result[34]) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n11), .A2(
        Midori_rounds_roundReg_out[57]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U14 ( .A1(
        Midori_rounds_roundReg_out[56]), .A2(Midori_rounds_roundReg_out[59]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_14_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n5), .ZN(Midori_rounds_SR_Result[33])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U11 ( .A1(
        Midori_rounds_roundReg_out[56]), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U10 ( .A1(
        Midori_rounds_roundReg_out[59]), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_14_U9 ( .A1(
        Midori_rounds_roundReg_out[58]), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_14_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n3), .ZN(Midori_rounds_SR_Result[32])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_14_U7 ( .A1(
        Midori_rounds_roundReg_out[57]), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_14_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_14_U5 ( .A1(
        Midori_rounds_roundReg_out[58]), .A2(Midori_rounds_roundReg_out[59]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_14_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_14_U4 ( .A(
        Midori_rounds_roundReg_out[56]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_14_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_14_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_14_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_14_U2 ( .A(
        Midori_rounds_roundReg_out[59]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_14_U1 ( .A(
        Midori_rounds_roundReg_out[58]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_14_n9) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U19 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n14), .ZN(Midori_rounds_SR_Result[63]) );
  OR2_X1 Midori_rounds_sub_sBox_PRINCE_15_U18 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n13), .A2(
        Midori_rounds_roundReg_out[61]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n14) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U17 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n15), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n12), .ZN(Midori_rounds_SR_Result[62]) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U16 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n11), .A2(
        Midori_rounds_roundReg_out[61]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n12) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U15 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n10), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n11) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U14 ( .A1(
        Midori_rounds_roundReg_out[60]), .A2(Midori_rounds_roundReg_out[63]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_15_n10) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U13 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n8), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n7), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n15) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U12 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n6), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n5), .ZN(Midori_rounds_SR_Result[61])
         );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U11 ( .A1(
        Midori_rounds_roundReg_out[60]), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n4), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n5) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U10 ( .A1(
        Midori_rounds_roundReg_out[63]), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n9), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n4) );
  NAND2_X1 Midori_rounds_sub_sBox_PRINCE_15_U9 ( .A1(
        Midori_rounds_roundReg_out[62]), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n6) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_15_U8 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n13), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n3), .ZN(Midori_rounds_SR_Result[60])
         );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_15_U7 ( .A1(
        Midori_rounds_roundReg_out[61]), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n2), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n3) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_15_U6 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n7), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n1), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n2) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_15_U5 ( .A1(
        Midori_rounds_roundReg_out[62]), .A2(Midori_rounds_roundReg_out[63]), 
        .ZN(Midori_rounds_sub_sBox_PRINCE_15_n1) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_15_U4 ( .A(
        Midori_rounds_roundReg_out[60]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n7) );
  NOR2_X1 Midori_rounds_sub_sBox_PRINCE_15_U3 ( .A1(
        Midori_rounds_sub_sBox_PRINCE_15_n9), .A2(
        Midori_rounds_sub_sBox_PRINCE_15_n8), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n13) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_15_U2 ( .A(
        Midori_rounds_roundReg_out[63]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n8) );
  INV_X1 Midori_rounds_sub_sBox_PRINCE_15_U1 ( .A(
        Midori_rounds_roundReg_out[62]), .ZN(
        Midori_rounds_sub_sBox_PRINCE_15_n9) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_0_U1 ( .A(
        Midori_rounds_SR_Result[0]), .B(Midori_rounds_sub_ResultXORkey[0]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[0]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_1_U1 ( .A(
        Midori_rounds_SR_Result[1]), .B(Midori_rounds_sub_ResultXORkey[1]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[1]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_2_U1 ( .A(
        Midori_rounds_SR_Result[2]), .B(Midori_rounds_sub_ResultXORkey[2]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[2]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_3_U1 ( .A(
        Midori_rounds_SR_Result[3]), .B(Midori_rounds_sub_ResultXORkey[3]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[3]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_4_U1 ( .A(
        Midori_rounds_SR_Result[4]), .B(Midori_rounds_sub_ResultXORkey[4]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[4]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_5_U1 ( .A(
        Midori_rounds_SR_Result[5]), .B(Midori_rounds_sub_ResultXORkey[5]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[5]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_6_U1 ( .A(
        Midori_rounds_SR_Result[6]), .B(Midori_rounds_sub_ResultXORkey[6]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[6]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_7_U1 ( .A(
        Midori_rounds_SR_Result[7]), .B(Midori_rounds_sub_ResultXORkey[7]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[7]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_8_U1 ( .A(
        Midori_rounds_SR_Result[8]), .B(Midori_rounds_sub_ResultXORkey[8]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[8]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_9_U1 ( .A(
        Midori_rounds_SR_Result[9]), .B(Midori_rounds_sub_ResultXORkey[9]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[9]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_10_U1 ( .A(
        Midori_rounds_SR_Result[10]), .B(Midori_rounds_sub_ResultXORkey[10]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[10]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_11_U1 ( .A(
        Midori_rounds_SR_Result[11]), .B(Midori_rounds_sub_ResultXORkey[11]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[11]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_12_U1 ( .A(
        Midori_rounds_SR_Result[12]), .B(Midori_rounds_sub_ResultXORkey[12]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[12]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_13_U1 ( .A(
        Midori_rounds_SR_Result[13]), .B(Midori_rounds_sub_ResultXORkey[13]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[13]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_14_U1 ( .A(
        Midori_rounds_SR_Result[14]), .B(Midori_rounds_sub_ResultXORkey[14]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[14]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_15_U1 ( .A(
        Midori_rounds_SR_Result[15]), .B(Midori_rounds_sub_ResultXORkey[15]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[15]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_16_U1 ( .A(
        Midori_rounds_SR_Result[16]), .B(Midori_rounds_sub_ResultXORkey[16]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[16]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_17_U1 ( .A(
        Midori_rounds_SR_Result[17]), .B(Midori_rounds_sub_ResultXORkey[17]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[17]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_18_U1 ( .A(
        Midori_rounds_SR_Result[18]), .B(Midori_rounds_sub_ResultXORkey[18]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[18]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_19_U1 ( .A(
        Midori_rounds_SR_Result[19]), .B(Midori_rounds_sub_ResultXORkey[19]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[19]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_20_U1 ( .A(
        Midori_rounds_SR_Result[20]), .B(Midori_rounds_sub_ResultXORkey[20]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[20]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_21_U1 ( .A(
        Midori_rounds_SR_Result[21]), .B(Midori_rounds_sub_ResultXORkey[21]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[21]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_22_U1 ( .A(
        Midori_rounds_SR_Result[22]), .B(Midori_rounds_sub_ResultXORkey[22]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[22]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_23_U1 ( .A(
        Midori_rounds_SR_Result[23]), .B(Midori_rounds_sub_ResultXORkey[23]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[23]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_24_U1 ( .A(
        Midori_rounds_SR_Result[24]), .B(Midori_rounds_sub_ResultXORkey[24]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[24]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_25_U1 ( .A(
        Midori_rounds_SR_Result[25]), .B(Midori_rounds_sub_ResultXORkey[25]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[25]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_26_U1 ( .A(
        Midori_rounds_SR_Result[26]), .B(Midori_rounds_sub_ResultXORkey[26]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[26]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_27_U1 ( .A(
        Midori_rounds_SR_Result[27]), .B(Midori_rounds_sub_ResultXORkey[27]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[27]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_28_U1 ( .A(
        Midori_rounds_SR_Result[28]), .B(Midori_rounds_sub_ResultXORkey[28]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[28]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_29_U1 ( .A(
        Midori_rounds_SR_Result[29]), .B(Midori_rounds_sub_ResultXORkey[29]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[29]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_30_U1 ( .A(
        Midori_rounds_SR_Result[30]), .B(Midori_rounds_sub_ResultXORkey[30]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[30]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_31_U1 ( .A(
        Midori_rounds_SR_Result[31]), .B(Midori_rounds_sub_ResultXORkey[31]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[31]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_32_U1 ( .A(
        Midori_rounds_SR_Result[32]), .B(Midori_rounds_sub_ResultXORkey[32]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[32]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_33_U1 ( .A(
        Midori_rounds_SR_Result[33]), .B(Midori_rounds_sub_ResultXORkey[33]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[33]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_34_U1 ( .A(
        Midori_rounds_SR_Result[34]), .B(Midori_rounds_sub_ResultXORkey[34]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[34]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_35_U1 ( .A(
        Midori_rounds_SR_Result[35]), .B(Midori_rounds_sub_ResultXORkey[35]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[35]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_36_U1 ( .A(
        Midori_rounds_SR_Result[36]), .B(Midori_rounds_sub_ResultXORkey[36]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[36]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_37_U1 ( .A(
        Midori_rounds_SR_Result[37]), .B(Midori_rounds_sub_ResultXORkey[37]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[37]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_38_U1 ( .A(
        Midori_rounds_SR_Result[38]), .B(Midori_rounds_sub_ResultXORkey[38]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[38]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_39_U1 ( .A(
        Midori_rounds_SR_Result[39]), .B(Midori_rounds_sub_ResultXORkey[39]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[39]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_40_U1 ( .A(
        Midori_rounds_SR_Result[40]), .B(Midori_rounds_sub_ResultXORkey[40]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[40]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_41_U1 ( .A(
        Midori_rounds_SR_Result[41]), .B(Midori_rounds_sub_ResultXORkey[41]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[41]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_42_U1 ( .A(
        Midori_rounds_SR_Result[42]), .B(Midori_rounds_sub_ResultXORkey[42]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[42]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_43_U1 ( .A(
        Midori_rounds_SR_Result[43]), .B(Midori_rounds_sub_ResultXORkey[43]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[43]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_44_U1 ( .A(
        Midori_rounds_SR_Result[44]), .B(Midori_rounds_sub_ResultXORkey[44]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[44]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_45_U1 ( .A(
        Midori_rounds_SR_Result[45]), .B(Midori_rounds_sub_ResultXORkey[45]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[45]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_46_U1 ( .A(
        Midori_rounds_SR_Result[46]), .B(Midori_rounds_sub_ResultXORkey[46]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[46]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_47_U1 ( .A(
        Midori_rounds_SR_Result[47]), .B(Midori_rounds_sub_ResultXORkey[47]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[47]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_48_U1 ( .A(
        Midori_rounds_SR_Result[48]), .B(Midori_rounds_sub_ResultXORkey[48]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[48]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_49_U1 ( .A(
        Midori_rounds_SR_Result[49]), .B(Midori_rounds_sub_ResultXORkey[49]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[49]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_50_U1 ( .A(
        Midori_rounds_SR_Result[50]), .B(Midori_rounds_sub_ResultXORkey[50]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[50]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_51_U1 ( .A(
        Midori_rounds_SR_Result[51]), .B(Midori_rounds_sub_ResultXORkey[51]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[51]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_52_U1 ( .A(
        Midori_rounds_SR_Result[52]), .B(Midori_rounds_sub_ResultXORkey[52]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[52]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_53_U1 ( .A(
        Midori_rounds_SR_Result[53]), .B(Midori_rounds_sub_ResultXORkey[53]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[53]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_54_U1 ( .A(
        Midori_rounds_SR_Result[54]), .B(Midori_rounds_sub_ResultXORkey[54]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[54]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_55_U1 ( .A(
        Midori_rounds_SR_Result[55]), .B(Midori_rounds_sub_ResultXORkey[55]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[55]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_56_U1 ( .A(
        Midori_rounds_SR_Result[56]), .B(Midori_rounds_sub_ResultXORkey[56]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[56]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_57_U1 ( .A(
        Midori_rounds_SR_Result[57]), .B(Midori_rounds_sub_ResultXORkey[57]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[57]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_58_U1 ( .A(
        Midori_rounds_SR_Result[58]), .B(Midori_rounds_sub_ResultXORkey[58]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[58]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_59_U1 ( .A(
        Midori_rounds_SR_Result[59]), .B(Midori_rounds_sub_ResultXORkey[59]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[59]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_60_U1 ( .A(
        Midori_rounds_SR_Result[60]), .B(Midori_rounds_sub_ResultXORkey[60]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[60]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_61_U1 ( .A(
        Midori_rounds_SR_Result[61]), .B(Midori_rounds_sub_ResultXORkey[61]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[61]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_62_U1 ( .A(
        Midori_rounds_SR_Result[62]), .B(Midori_rounds_sub_ResultXORkey[62]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[62]) );
  MUX2_X1 Midori_rounds_mul_input_Inst_mux_inst_63_U1 ( .A(
        Midori_rounds_SR_Result[63]), .B(Midori_rounds_sub_ResultXORkey[63]), 
        .S(enc_dec), .Z(Midori_rounds_mul_input[63]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U24 ( .A(Midori_rounds_mul_input[61]), .B(
        Midori_rounds_mul_MC1_n8), .ZN(Midori_rounds_SR_Inv_Result[21]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U23 ( .A(Midori_rounds_mul_input[60]), .B(
        Midori_rounds_mul_MC1_n7), .ZN(Midori_rounds_SR_Inv_Result[20]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U22 ( .A(Midori_rounds_mul_input[51]), .B(
        Midori_rounds_mul_MC1_n6), .ZN(Midori_rounds_SR_Inv_Result[43]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U21 ( .A(Midori_rounds_mul_input[50]), .B(
        Midori_rounds_mul_MC1_n5), .ZN(Midori_rounds_SR_Inv_Result[42]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U20 ( .A(Midori_rounds_mul_input[49]), .B(
        Midori_rounds_mul_MC1_n4), .ZN(Midori_rounds_SR_Inv_Result[41]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U19 ( .A(Midori_rounds_mul_input[48]), .B(
        Midori_rounds_mul_MC1_n3), .ZN(Midori_rounds_SR_Inv_Result[40]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U18 ( .A(Midori_rounds_mul_input[55]), .B(
        Midori_rounds_mul_MC1_n6), .ZN(Midori_rounds_SR_Inv_Result[3]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U17 ( .A(Midori_rounds_mul_input[63]), .B(
        Midori_rounds_mul_input[59]), .ZN(Midori_rounds_mul_MC1_n6) );
  XNOR2_X1 Midori_rounds_mul_MC1_U16 ( .A(Midori_rounds_mul_input[54]), .B(
        Midori_rounds_mul_MC1_n5), .ZN(Midori_rounds_SR_Inv_Result[2]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U15 ( .A(Midori_rounds_mul_input[62]), .B(
        Midori_rounds_mul_input[58]), .ZN(Midori_rounds_mul_MC1_n5) );
  XNOR2_X1 Midori_rounds_mul_MC1_U14 ( .A(Midori_rounds_mul_input[53]), .B(
        Midori_rounds_mul_MC1_n4), .ZN(Midori_rounds_SR_Inv_Result[1]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U13 ( .A(Midori_rounds_mul_input[57]), .B(
        Midori_rounds_mul_input[61]), .ZN(Midori_rounds_mul_MC1_n4) );
  XNOR2_X1 Midori_rounds_mul_MC1_U12 ( .A(Midori_rounds_mul_input[59]), .B(
        Midori_rounds_mul_MC1_n2), .ZN(Midori_rounds_SR_Inv_Result[63]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U11 ( .A(Midori_rounds_mul_input[58]), .B(
        Midori_rounds_mul_MC1_n1), .ZN(Midori_rounds_SR_Inv_Result[62]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U10 ( .A(Midori_rounds_mul_input[57]), .B(
        Midori_rounds_mul_MC1_n8), .ZN(Midori_rounds_SR_Inv_Result[61]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U9 ( .A(Midori_rounds_mul_input[49]), .B(
        Midori_rounds_mul_input[53]), .ZN(Midori_rounds_mul_MC1_n8) );
  XNOR2_X1 Midori_rounds_mul_MC1_U8 ( .A(Midori_rounds_mul_input[56]), .B(
        Midori_rounds_mul_MC1_n7), .ZN(Midori_rounds_SR_Inv_Result[60]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U7 ( .A(Midori_rounds_mul_input[52]), .B(
        Midori_rounds_mul_input[48]), .ZN(Midori_rounds_mul_MC1_n7) );
  XNOR2_X1 Midori_rounds_mul_MC1_U6 ( .A(Midori_rounds_mul_input[63]), .B(
        Midori_rounds_mul_MC1_n2), .ZN(Midori_rounds_SR_Inv_Result[23]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U5 ( .A(Midori_rounds_mul_input[51]), .B(
        Midori_rounds_mul_input[55]), .ZN(Midori_rounds_mul_MC1_n2) );
  XNOR2_X1 Midori_rounds_mul_MC1_U4 ( .A(Midori_rounds_mul_input[62]), .B(
        Midori_rounds_mul_MC1_n1), .ZN(Midori_rounds_SR_Inv_Result[22]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U3 ( .A(Midori_rounds_mul_input[50]), .B(
        Midori_rounds_mul_input[54]), .ZN(Midori_rounds_mul_MC1_n1) );
  XNOR2_X1 Midori_rounds_mul_MC1_U2 ( .A(Midori_rounds_mul_input[52]), .B(
        Midori_rounds_mul_MC1_n3), .ZN(Midori_rounds_SR_Inv_Result[0]) );
  XNOR2_X1 Midori_rounds_mul_MC1_U1 ( .A(Midori_rounds_mul_input[60]), .B(
        Midori_rounds_mul_input[56]), .ZN(Midori_rounds_mul_MC1_n3) );
  XNOR2_X1 Midori_rounds_mul_MC2_U24 ( .A(Midori_rounds_mul_input[45]), .B(
        Midori_rounds_mul_MC2_n8), .ZN(Midori_rounds_SR_Inv_Result[45]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U23 ( .A(Midori_rounds_mul_input[44]), .B(
        Midori_rounds_mul_MC2_n7), .ZN(Midori_rounds_SR_Inv_Result[44]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U22 ( .A(Midori_rounds_mul_input[35]), .B(
        Midori_rounds_mul_MC2_n6), .ZN(Midori_rounds_SR_Inv_Result[19]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U21 ( .A(Midori_rounds_mul_input[34]), .B(
        Midori_rounds_mul_MC2_n5), .ZN(Midori_rounds_SR_Inv_Result[18]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U20 ( .A(Midori_rounds_mul_input[33]), .B(
        Midori_rounds_mul_MC2_n4), .ZN(Midori_rounds_SR_Inv_Result[17]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U19 ( .A(Midori_rounds_mul_input[32]), .B(
        Midori_rounds_mul_MC2_n3), .ZN(Midori_rounds_SR_Inv_Result[16]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U18 ( .A(Midori_rounds_mul_input[39]), .B(
        Midori_rounds_mul_MC2_n6), .ZN(Midori_rounds_SR_Inv_Result[59]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U17 ( .A(Midori_rounds_mul_input[47]), .B(
        Midori_rounds_mul_input[43]), .ZN(Midori_rounds_mul_MC2_n6) );
  XNOR2_X1 Midori_rounds_mul_MC2_U16 ( .A(Midori_rounds_mul_input[38]), .B(
        Midori_rounds_mul_MC2_n5), .ZN(Midori_rounds_SR_Inv_Result[58]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U15 ( .A(Midori_rounds_mul_input[46]), .B(
        Midori_rounds_mul_input[42]), .ZN(Midori_rounds_mul_MC2_n5) );
  XNOR2_X1 Midori_rounds_mul_MC2_U14 ( .A(Midori_rounds_mul_input[37]), .B(
        Midori_rounds_mul_MC2_n4), .ZN(Midori_rounds_SR_Inv_Result[57]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U13 ( .A(Midori_rounds_mul_input[41]), .B(
        Midori_rounds_mul_input[45]), .ZN(Midori_rounds_mul_MC2_n4) );
  XNOR2_X1 Midori_rounds_mul_MC2_U12 ( .A(Midori_rounds_mul_input[43]), .B(
        Midori_rounds_mul_MC2_n2), .ZN(Midori_rounds_SR_Inv_Result[7]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U11 ( .A(Midori_rounds_mul_input[42]), .B(
        Midori_rounds_mul_MC2_n1), .ZN(Midori_rounds_SR_Inv_Result[6]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U10 ( .A(Midori_rounds_mul_input[41]), .B(
        Midori_rounds_mul_MC2_n8), .ZN(Midori_rounds_SR_Inv_Result[5]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U9 ( .A(Midori_rounds_mul_input[33]), .B(
        Midori_rounds_mul_input[37]), .ZN(Midori_rounds_mul_MC2_n8) );
  XNOR2_X1 Midori_rounds_mul_MC2_U8 ( .A(Midori_rounds_mul_input[40]), .B(
        Midori_rounds_mul_MC2_n7), .ZN(Midori_rounds_SR_Inv_Result[4]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U7 ( .A(Midori_rounds_mul_input[36]), .B(
        Midori_rounds_mul_input[32]), .ZN(Midori_rounds_mul_MC2_n7) );
  XNOR2_X1 Midori_rounds_mul_MC2_U6 ( .A(Midori_rounds_mul_input[47]), .B(
        Midori_rounds_mul_MC2_n2), .ZN(Midori_rounds_SR_Inv_Result[47]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U5 ( .A(Midori_rounds_mul_input[35]), .B(
        Midori_rounds_mul_input[39]), .ZN(Midori_rounds_mul_MC2_n2) );
  XNOR2_X1 Midori_rounds_mul_MC2_U4 ( .A(Midori_rounds_mul_input[46]), .B(
        Midori_rounds_mul_MC2_n1), .ZN(Midori_rounds_SR_Inv_Result[46]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U3 ( .A(Midori_rounds_mul_input[34]), .B(
        Midori_rounds_mul_input[38]), .ZN(Midori_rounds_mul_MC2_n1) );
  XNOR2_X1 Midori_rounds_mul_MC2_U2 ( .A(Midori_rounds_mul_input[36]), .B(
        Midori_rounds_mul_MC2_n3), .ZN(Midori_rounds_SR_Inv_Result[56]) );
  XNOR2_X1 Midori_rounds_mul_MC2_U1 ( .A(Midori_rounds_mul_input[44]), .B(
        Midori_rounds_mul_input[40]), .ZN(Midori_rounds_mul_MC2_n3) );
  XNOR2_X1 Midori_rounds_mul_MC3_U24 ( .A(Midori_rounds_mul_input[29]), .B(
        Midori_rounds_mul_MC3_n8), .ZN(Midori_rounds_SR_Inv_Result[49]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U23 ( .A(Midori_rounds_mul_input[28]), .B(
        Midori_rounds_mul_MC3_n7), .ZN(Midori_rounds_SR_Inv_Result[48]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U22 ( .A(Midori_rounds_mul_input[19]), .B(
        Midori_rounds_mul_MC3_n6), .ZN(Midori_rounds_SR_Inv_Result[15]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U21 ( .A(Midori_rounds_mul_input[18]), .B(
        Midori_rounds_mul_MC3_n5), .ZN(Midori_rounds_SR_Inv_Result[14]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U20 ( .A(Midori_rounds_mul_input[17]), .B(
        Midori_rounds_mul_MC3_n4), .ZN(Midori_rounds_SR_Inv_Result[13]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U19 ( .A(Midori_rounds_mul_input[16]), .B(
        Midori_rounds_mul_MC3_n3), .ZN(Midori_rounds_SR_Inv_Result[12]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U18 ( .A(Midori_rounds_mul_input[23]), .B(
        Midori_rounds_mul_MC3_n6), .ZN(Midori_rounds_SR_Inv_Result[39]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U17 ( .A(Midori_rounds_mul_input[31]), .B(
        Midori_rounds_mul_input[27]), .ZN(Midori_rounds_mul_MC3_n6) );
  XNOR2_X1 Midori_rounds_mul_MC3_U16 ( .A(Midori_rounds_mul_input[22]), .B(
        Midori_rounds_mul_MC3_n5), .ZN(Midori_rounds_SR_Inv_Result[38]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U15 ( .A(Midori_rounds_mul_input[30]), .B(
        Midori_rounds_mul_input[26]), .ZN(Midori_rounds_mul_MC3_n5) );
  XNOR2_X1 Midori_rounds_mul_MC3_U14 ( .A(Midori_rounds_mul_input[21]), .B(
        Midori_rounds_mul_MC3_n4), .ZN(Midori_rounds_SR_Inv_Result[37]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U13 ( .A(Midori_rounds_mul_input[25]), .B(
        Midori_rounds_mul_input[29]), .ZN(Midori_rounds_mul_MC3_n4) );
  XNOR2_X1 Midori_rounds_mul_MC3_U12 ( .A(Midori_rounds_mul_input[27]), .B(
        Midori_rounds_mul_MC3_n2), .ZN(Midori_rounds_SR_Inv_Result[27]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U11 ( .A(Midori_rounds_mul_input[26]), .B(
        Midori_rounds_mul_MC3_n1), .ZN(Midori_rounds_SR_Inv_Result[26]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U10 ( .A(Midori_rounds_mul_input[25]), .B(
        Midori_rounds_mul_MC3_n8), .ZN(Midori_rounds_SR_Inv_Result[25]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U9 ( .A(Midori_rounds_mul_input[17]), .B(
        Midori_rounds_mul_input[21]), .ZN(Midori_rounds_mul_MC3_n8) );
  XNOR2_X1 Midori_rounds_mul_MC3_U8 ( .A(Midori_rounds_mul_input[24]), .B(
        Midori_rounds_mul_MC3_n7), .ZN(Midori_rounds_SR_Inv_Result[24]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U7 ( .A(Midori_rounds_mul_input[20]), .B(
        Midori_rounds_mul_input[16]), .ZN(Midori_rounds_mul_MC3_n7) );
  XNOR2_X1 Midori_rounds_mul_MC3_U6 ( .A(Midori_rounds_mul_input[31]), .B(
        Midori_rounds_mul_MC3_n2), .ZN(Midori_rounds_SR_Inv_Result[51]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U5 ( .A(Midori_rounds_mul_input[19]), .B(
        Midori_rounds_mul_input[23]), .ZN(Midori_rounds_mul_MC3_n2) );
  XNOR2_X1 Midori_rounds_mul_MC3_U4 ( .A(Midori_rounds_mul_input[30]), .B(
        Midori_rounds_mul_MC3_n1), .ZN(Midori_rounds_SR_Inv_Result[50]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U3 ( .A(Midori_rounds_mul_input[18]), .B(
        Midori_rounds_mul_input[22]), .ZN(Midori_rounds_mul_MC3_n1) );
  XNOR2_X1 Midori_rounds_mul_MC3_U2 ( .A(Midori_rounds_mul_input[20]), .B(
        Midori_rounds_mul_MC3_n3), .ZN(Midori_rounds_SR_Inv_Result[36]) );
  XNOR2_X1 Midori_rounds_mul_MC3_U1 ( .A(Midori_rounds_mul_input[28]), .B(
        Midori_rounds_mul_input[24]), .ZN(Midori_rounds_mul_MC3_n3) );
  XNOR2_X1 Midori_rounds_mul_MC4_U24 ( .A(Midori_rounds_mul_input[13]), .B(
        Midori_rounds_mul_MC4_n8), .ZN(Midori_rounds_SR_Inv_Result[9]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U23 ( .A(Midori_rounds_mul_input[12]), .B(
        Midori_rounds_mul_MC4_n7), .ZN(Midori_rounds_SR_Inv_Result[8]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U22 ( .A(Midori_rounds_mul_input[3]), .B(
        Midori_rounds_mul_MC4_n6), .ZN(Midori_rounds_SR_Inv_Result[55]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U21 ( .A(Midori_rounds_mul_input[2]), .B(
        Midori_rounds_mul_MC4_n5), .ZN(Midori_rounds_SR_Inv_Result[54]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U20 ( .A(Midori_rounds_mul_input[1]), .B(
        Midori_rounds_mul_MC4_n4), .ZN(Midori_rounds_SR_Inv_Result[53]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U19 ( .A(Midori_rounds_mul_input[0]), .B(
        Midori_rounds_mul_MC4_n3), .ZN(Midori_rounds_SR_Inv_Result[52]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U18 ( .A(Midori_rounds_mul_input[7]), .B(
        Midori_rounds_mul_MC4_n6), .ZN(Midori_rounds_SR_Inv_Result[31]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U17 ( .A(Midori_rounds_mul_input[15]), .B(
        Midori_rounds_mul_input[11]), .ZN(Midori_rounds_mul_MC4_n6) );
  XNOR2_X1 Midori_rounds_mul_MC4_U16 ( .A(Midori_rounds_mul_input[6]), .B(
        Midori_rounds_mul_MC4_n5), .ZN(Midori_rounds_SR_Inv_Result[30]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U15 ( .A(Midori_rounds_mul_input[14]), .B(
        Midori_rounds_mul_input[10]), .ZN(Midori_rounds_mul_MC4_n5) );
  XNOR2_X1 Midori_rounds_mul_MC4_U14 ( .A(Midori_rounds_mul_input[5]), .B(
        Midori_rounds_mul_MC4_n4), .ZN(Midori_rounds_SR_Inv_Result[29]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U13 ( .A(Midori_rounds_mul_input[9]), .B(
        Midori_rounds_mul_input[13]), .ZN(Midori_rounds_mul_MC4_n4) );
  XNOR2_X1 Midori_rounds_mul_MC4_U12 ( .A(Midori_rounds_mul_input[11]), .B(
        Midori_rounds_mul_MC4_n2), .ZN(Midori_rounds_SR_Inv_Result[35]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U11 ( .A(Midori_rounds_mul_input[10]), .B(
        Midori_rounds_mul_MC4_n1), .ZN(Midori_rounds_SR_Inv_Result[34]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U10 ( .A(Midori_rounds_mul_input[9]), .B(
        Midori_rounds_mul_MC4_n8), .ZN(Midori_rounds_SR_Inv_Result[33]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U9 ( .A(Midori_rounds_mul_input[1]), .B(
        Midori_rounds_mul_input[5]), .ZN(Midori_rounds_mul_MC4_n8) );
  XNOR2_X1 Midori_rounds_mul_MC4_U8 ( .A(Midori_rounds_mul_input[8]), .B(
        Midori_rounds_mul_MC4_n7), .ZN(Midori_rounds_SR_Inv_Result[32]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U7 ( .A(Midori_rounds_mul_input[4]), .B(
        Midori_rounds_mul_input[0]), .ZN(Midori_rounds_mul_MC4_n7) );
  XNOR2_X1 Midori_rounds_mul_MC4_U6 ( .A(Midori_rounds_mul_input[15]), .B(
        Midori_rounds_mul_MC4_n2), .ZN(Midori_rounds_SR_Inv_Result[11]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U5 ( .A(Midori_rounds_mul_input[3]), .B(
        Midori_rounds_mul_input[7]), .ZN(Midori_rounds_mul_MC4_n2) );
  XNOR2_X1 Midori_rounds_mul_MC4_U4 ( .A(Midori_rounds_mul_input[14]), .B(
        Midori_rounds_mul_MC4_n1), .ZN(Midori_rounds_SR_Inv_Result[10]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U3 ( .A(Midori_rounds_mul_input[2]), .B(
        Midori_rounds_mul_input[6]), .ZN(Midori_rounds_mul_MC4_n1) );
  XNOR2_X1 Midori_rounds_mul_MC4_U2 ( .A(Midori_rounds_mul_input[4]), .B(
        Midori_rounds_mul_MC4_n3), .ZN(Midori_rounds_SR_Inv_Result[28]) );
  XNOR2_X1 Midori_rounds_mul_MC4_U1 ( .A(Midori_rounds_mul_input[12]), .B(
        Midori_rounds_mul_input[8]), .ZN(Midori_rounds_mul_MC4_n3) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_0_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[0]), .B(Midori_rounds_SR_Inv_Result[0]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[0]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_1_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[1]), .B(Midori_rounds_SR_Inv_Result[1]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[1]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_2_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[2]), .B(Midori_rounds_SR_Inv_Result[2]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[2]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_3_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[3]), .B(Midori_rounds_SR_Inv_Result[3]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[3]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_4_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[4]), .B(Midori_rounds_SR_Inv_Result[4]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[4]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_5_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[5]), .B(Midori_rounds_SR_Inv_Result[5]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[5]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_6_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[6]), .B(Midori_rounds_SR_Inv_Result[6]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[6]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_7_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[7]), .B(Midori_rounds_SR_Inv_Result[7]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[7]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_8_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[8]), .B(Midori_rounds_SR_Inv_Result[8]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[8]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_9_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[9]), .B(Midori_rounds_SR_Inv_Result[9]), 
        .S(enc_dec), .Z(Midori_rounds_round_Result[9]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_10_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[10]), .B(
        Midori_rounds_SR_Inv_Result[10]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[10]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_11_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[11]), .B(
        Midori_rounds_SR_Inv_Result[11]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[11]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_12_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[12]), .B(
        Midori_rounds_SR_Inv_Result[12]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[12]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_13_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[13]), .B(
        Midori_rounds_SR_Inv_Result[13]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[13]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_14_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[14]), .B(
        Midori_rounds_SR_Inv_Result[14]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[14]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_15_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[15]), .B(
        Midori_rounds_SR_Inv_Result[15]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[15]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_16_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[16]), .B(
        Midori_rounds_SR_Inv_Result[16]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[16]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_17_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[17]), .B(
        Midori_rounds_SR_Inv_Result[17]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[17]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_18_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[18]), .B(
        Midori_rounds_SR_Inv_Result[18]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[18]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_19_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[19]), .B(
        Midori_rounds_SR_Inv_Result[19]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[19]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_20_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[20]), .B(
        Midori_rounds_SR_Inv_Result[20]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[20]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_21_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[21]), .B(
        Midori_rounds_SR_Inv_Result[21]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[21]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_22_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[22]), .B(
        Midori_rounds_SR_Inv_Result[22]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[22]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_23_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[23]), .B(
        Midori_rounds_SR_Inv_Result[23]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[23]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_24_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[24]), .B(
        Midori_rounds_SR_Inv_Result[24]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[24]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_25_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[25]), .B(
        Midori_rounds_SR_Inv_Result[25]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[25]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_26_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[26]), .B(
        Midori_rounds_SR_Inv_Result[26]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[26]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_27_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[27]), .B(
        Midori_rounds_SR_Inv_Result[27]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[27]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_28_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[28]), .B(
        Midori_rounds_SR_Inv_Result[28]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[28]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_29_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[29]), .B(
        Midori_rounds_SR_Inv_Result[29]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[29]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_30_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[30]), .B(
        Midori_rounds_SR_Inv_Result[30]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[30]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_31_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[31]), .B(
        Midori_rounds_SR_Inv_Result[31]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[31]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_32_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[32]), .B(
        Midori_rounds_SR_Inv_Result[32]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[32]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_33_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[33]), .B(
        Midori_rounds_SR_Inv_Result[33]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[33]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_34_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[34]), .B(
        Midori_rounds_SR_Inv_Result[34]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[34]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_35_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[35]), .B(
        Midori_rounds_SR_Inv_Result[35]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[35]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_36_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[36]), .B(
        Midori_rounds_SR_Inv_Result[36]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[36]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_37_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[37]), .B(
        Midori_rounds_SR_Inv_Result[37]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[37]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_38_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[38]), .B(
        Midori_rounds_SR_Inv_Result[38]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[38]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_39_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[39]), .B(
        Midori_rounds_SR_Inv_Result[39]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[39]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_40_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[40]), .B(
        Midori_rounds_SR_Inv_Result[40]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[40]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_41_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[41]), .B(
        Midori_rounds_SR_Inv_Result[41]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[41]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_42_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[42]), .B(
        Midori_rounds_SR_Inv_Result[42]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[42]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_43_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[43]), .B(
        Midori_rounds_SR_Inv_Result[43]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[43]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_44_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[44]), .B(
        Midori_rounds_SR_Inv_Result[44]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[44]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_45_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[45]), .B(
        Midori_rounds_SR_Inv_Result[45]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[45]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_46_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[46]), .B(
        Midori_rounds_SR_Inv_Result[46]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[46]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_47_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[47]), .B(
        Midori_rounds_SR_Inv_Result[47]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[47]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_48_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[48]), .B(
        Midori_rounds_SR_Inv_Result[48]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[48]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_49_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[49]), .B(
        Midori_rounds_SR_Inv_Result[49]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[49]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_50_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[50]), .B(
        Midori_rounds_SR_Inv_Result[50]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[50]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_51_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[51]), .B(
        Midori_rounds_SR_Inv_Result[51]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[51]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_52_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[52]), .B(
        Midori_rounds_SR_Inv_Result[52]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[52]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_53_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[53]), .B(
        Midori_rounds_SR_Inv_Result[53]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[53]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_54_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[54]), .B(
        Midori_rounds_SR_Inv_Result[54]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[54]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_55_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[55]), .B(
        Midori_rounds_SR_Inv_Result[55]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[55]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_56_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[56]), .B(
        Midori_rounds_SR_Inv_Result[56]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[56]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_57_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[57]), .B(
        Midori_rounds_SR_Inv_Result[57]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[57]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_58_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[58]), .B(
        Midori_rounds_SR_Inv_Result[58]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[58]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_59_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[59]), .B(
        Midori_rounds_SR_Inv_Result[59]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[59]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_60_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[60]), .B(
        Midori_rounds_SR_Inv_Result[60]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[60]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_61_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[61]), .B(
        Midori_rounds_SR_Inv_Result[61]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[61]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_62_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[62]), .B(
        Midori_rounds_SR_Inv_Result[62]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[62]) );
  MUX2_X1 Midori_rounds_Res_Inst_mux_inst_63_U1 ( .A(
        Midori_rounds_mul_ResultXORkey[63]), .B(
        Midori_rounds_SR_Inv_Result[63]), .S(enc_dec), .Z(
        Midori_rounds_round_Result[63]) );
endmodule

