/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Sun Nov 21 12:14:45 2021
/////////////////////////////////////////////////////////////


module IIRfilter ( DIN, H1, H2, H3, VIN, RST_n, CLK, DOUT, VOUT );
  input [6:0] DIN;
  input [6:0] H1;
  input [6:0] H2;
  input [6:0] H3;
  output [6:0] DOUT;
  input VIN, RST_n, CLK;
  output VOUT;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n40, ff_sh_6_, ff_sh_5_, ff_sh_4_, ff_sh_3_, ff_sh_2_, ff_sh_1_,
         ff_sh_0_, b0_w_9_, b0_w_8_, b0_w_7_, b0_w_6_, b0_w_12_, b0_w_11_,
         b0_w_10_, n42, n43, n44, n45, n46, n47, n48, n49, n50, sub_28_n8,
         sub_28_n7, sub_28_n6, sub_28_n5, sub_28_n4, sub_28_n3, sub_28_n2,
         sub_28_n1, mult_33_n208, mult_33_n207, mult_33_n206, mult_33_n205,
         mult_33_n204, mult_33_n203, mult_33_n202, mult_33_n201, mult_33_n200,
         mult_33_n199, mult_33_n198, mult_33_n197, mult_33_n196, mult_33_n195,
         mult_33_n194, mult_33_n193, mult_33_n192, mult_33_n191, mult_33_n190,
         mult_33_n189, mult_33_n188, mult_33_n187, mult_33_n186, mult_33_n185,
         mult_33_n184, mult_33_n183, mult_33_n182, mult_33_n181, mult_33_n180,
         mult_33_n179, mult_33_n136, mult_33_n135, mult_33_n134, mult_33_n133,
         mult_33_n131, mult_33_n129, mult_33_n128, mult_33_n127, mult_33_n126,
         mult_33_n125, mult_33_n124, mult_33_n123, mult_33_n121, mult_33_n120,
         mult_33_n119, mult_33_n118, mult_33_n117, mult_33_n116, mult_33_n115,
         mult_33_n114, mult_33_n113, mult_33_n112, mult_33_n111, mult_33_n110,
         mult_33_n109, mult_33_n108, mult_33_n107, mult_33_n106, mult_33_n105,
         mult_33_n103, mult_33_n102, mult_33_n101, mult_33_n100, mult_33_n99,
         mult_33_n98, mult_33_n97, mult_33_n96, mult_33_n95, mult_33_n94,
         mult_33_n93, mult_33_n91, mult_33_n90, mult_33_n89, mult_33_n88,
         mult_33_n87, mult_33_n86, mult_33_n84, mult_33_n83, mult_33_n82,
         mult_33_n81, mult_33_n80, mult_33_n79, mult_33_n78, mult_33_n77,
         mult_33_n76, mult_33_n75, mult_33_n74, mult_33_n73, mult_33_n72,
         mult_33_n71, mult_33_n70, mult_33_n69, mult_33_n68, mult_33_n67,
         mult_33_n66, mult_33_n65, mult_33_n64, mult_33_n63, mult_33_n62,
         mult_33_n61, mult_33_n60, mult_33_n59, mult_33_n58, mult_33_n57,
         mult_33_n56, mult_33_n55, mult_33_n54, mult_33_n52, mult_33_n51,
         mult_33_n50, mult_33_n49, mult_33_n48, mult_33_n47, mult_33_n46,
         mult_33_n45, mult_33_n44, mult_33_n43, mult_33_n42, mult_33_n41,
         mult_33_n40, mult_33_n39, mult_33_n38, mult_33_n37, mult_33_n36,
         mult_33_n35, mult_33_n34, mult_33_n33, mult_33_n32, mult_33_n31,
         mult_33_n30, mult_33_n29, mult_33_n28, mult_33_n27, mult_33_n26,
         mult_33_n25, mult_33_n24, mult_33_n23, mult_33_n22, mult_33_n21,
         mult_33_n20, mult_33_n19, mult_33_n18, mult_33_n17, mult_33_n16,
         mult_33_n15, mult_33_n8, mult_33_n7, mult_33_n6, mult_33_n5,
         mult_33_n4, mult_33_n3, mult_33_n2, mult_34_n208, mult_34_n207,
         mult_34_n206, mult_34_n205, mult_34_n204, mult_34_n203, mult_34_n202,
         mult_34_n201, mult_34_n200, mult_34_n199, mult_34_n198, mult_34_n197,
         mult_34_n196, mult_34_n195, mult_34_n194, mult_34_n193, mult_34_n192,
         mult_34_n191, mult_34_n190, mult_34_n189, mult_34_n188, mult_34_n187,
         mult_34_n186, mult_34_n185, mult_34_n184, mult_34_n183, mult_34_n182,
         mult_34_n181, mult_34_n180, mult_34_n179, mult_34_n136, mult_34_n135,
         mult_34_n134, mult_34_n133, mult_34_n131, mult_34_n129, mult_34_n128,
         mult_34_n127, mult_34_n126, mult_34_n125, mult_34_n124, mult_34_n123,
         mult_34_n121, mult_34_n120, mult_34_n119, mult_34_n118, mult_34_n117,
         mult_34_n116, mult_34_n115, mult_34_n114, mult_34_n113, mult_34_n112,
         mult_34_n111, mult_34_n110, mult_34_n109, mult_34_n108, mult_34_n107,
         mult_34_n106, mult_34_n105, mult_34_n103, mult_34_n102, mult_34_n101,
         mult_34_n100, mult_34_n99, mult_34_n98, mult_34_n97, mult_34_n96,
         mult_34_n95, mult_34_n94, mult_34_n93, mult_34_n91, mult_34_n90,
         mult_34_n89, mult_34_n88, mult_34_n87, mult_34_n86, mult_34_n84,
         mult_34_n83, mult_34_n82, mult_34_n81, mult_34_n80, mult_34_n79,
         mult_34_n78, mult_34_n77, mult_34_n76, mult_34_n75, mult_34_n74,
         mult_34_n73, mult_34_n72, mult_34_n71, mult_34_n70, mult_34_n69,
         mult_34_n68, mult_34_n67, mult_34_n66, mult_34_n65, mult_34_n64,
         mult_34_n63, mult_34_n62, mult_34_n61, mult_34_n60, mult_34_n59,
         mult_34_n58, mult_34_n57, mult_34_n56, mult_34_n55, mult_34_n54,
         mult_34_n52, mult_34_n51, mult_34_n50, mult_34_n49, mult_34_n48,
         mult_34_n47, mult_34_n46, mult_34_n45, mult_34_n44, mult_34_n43,
         mult_34_n42, mult_34_n41, mult_34_n40, mult_34_n39, mult_34_n38,
         mult_34_n37, mult_34_n36, mult_34_n35, mult_34_n34, mult_34_n33,
         mult_34_n32, mult_34_n31, mult_34_n30, mult_34_n29, mult_34_n28,
         mult_34_n27, mult_34_n26, mult_34_n25, mult_34_n24, mult_34_n23,
         mult_34_n22, mult_34_n21, mult_34_n20, mult_34_n19, mult_34_n18,
         mult_34_n17, mult_34_n16, mult_34_n15, mult_34_n8, mult_34_n7,
         mult_34_n6, mult_34_n5, mult_34_n4, mult_34_n3, mult_34_n2,
         mult_31_n208, mult_31_n207, mult_31_n206, mult_31_n205, mult_31_n204,
         mult_31_n203, mult_31_n202, mult_31_n201, mult_31_n200, mult_31_n199,
         mult_31_n198, mult_31_n197, mult_31_n196, mult_31_n195, mult_31_n194,
         mult_31_n193, mult_31_n192, mult_31_n191, mult_31_n190, mult_31_n189,
         mult_31_n188, mult_31_n187, mult_31_n186, mult_31_n185, mult_31_n184,
         mult_31_n183, mult_31_n182, mult_31_n181, mult_31_n180, mult_31_n179,
         mult_31_n136, mult_31_n135, mult_31_n134, mult_31_n133, mult_31_n131,
         mult_31_n129, mult_31_n128, mult_31_n127, mult_31_n126, mult_31_n125,
         mult_31_n124, mult_31_n123, mult_31_n121, mult_31_n120, mult_31_n119,
         mult_31_n118, mult_31_n117, mult_31_n116, mult_31_n115, mult_31_n114,
         mult_31_n113, mult_31_n112, mult_31_n111, mult_31_n110, mult_31_n109,
         mult_31_n108, mult_31_n107, mult_31_n106, mult_31_n105, mult_31_n103,
         mult_31_n102, mult_31_n101, mult_31_n100, mult_31_n99, mult_31_n98,
         mult_31_n97, mult_31_n96, mult_31_n95, mult_31_n94, mult_31_n93,
         mult_31_n91, mult_31_n90, mult_31_n89, mult_31_n88, mult_31_n87,
         mult_31_n86, mult_31_n84, mult_31_n83, mult_31_n82, mult_31_n81,
         mult_31_n80, mult_31_n79, mult_31_n78, mult_31_n77, mult_31_n76,
         mult_31_n75, mult_31_n74, mult_31_n73, mult_31_n72, mult_31_n71,
         mult_31_n70, mult_31_n69, mult_31_n68, mult_31_n67, mult_31_n66,
         mult_31_n65, mult_31_n64, mult_31_n63, mult_31_n62, mult_31_n61,
         mult_31_n60, mult_31_n59, mult_31_n58, mult_31_n57, mult_31_n56,
         mult_31_n55, mult_31_n54, mult_31_n52, mult_31_n51, mult_31_n50,
         mult_31_n49, mult_31_n48, mult_31_n47, mult_31_n46, mult_31_n45,
         mult_31_n44, mult_31_n43, mult_31_n42, mult_31_n41, mult_31_n40,
         mult_31_n39, mult_31_n38, mult_31_n37, mult_31_n36, mult_31_n35,
         mult_31_n34, mult_31_n33, mult_31_n32, mult_31_n31, mult_31_n30,
         mult_31_n29, mult_31_n28, mult_31_n27, mult_31_n26, mult_31_n25,
         mult_31_n24, mult_31_n23, mult_31_n22, mult_31_n21, mult_31_n20,
         mult_31_n19, mult_31_n18, mult_31_n17, mult_31_n16, mult_31_n15,
         mult_31_n8, mult_31_n7, mult_31_n6, mult_31_n5, mult_31_n4,
         mult_31_n3, mult_31_n2, add_32_n2;
  wire   [6:0] fb_sh;
  wire   [7:0] w;
  wire   [6:0] DOUT_reg_in;
  wire   [7:0] w_reg_out;
  wire   [7:1] sub_28_carry;
  wire   [6:2] add_32_carry;

  DFFR_X1 VOUT_reg ( .D(n40), .CK(CLK), .RN(RST_n), .Q(VOUT), .QN(n17) );
  DFFR_X1 w_reg_out_reg_7_ ( .D(n42), .CK(CLK), .RN(RST_n), .Q(w_reg_out[7])
         );
  DFFR_X1 w_reg_out_reg_6_ ( .D(n43), .CK(CLK), .RN(RST_n), .Q(w_reg_out[6])
         );
  DFFR_X1 w_reg_out_reg_5_ ( .D(n44), .CK(CLK), .RN(RST_n), .Q(w_reg_out[5])
         );
  DFFR_X1 w_reg_out_reg_4_ ( .D(n45), .CK(CLK), .RN(RST_n), .Q(w_reg_out[4])
         );
  DFFR_X1 w_reg_out_reg_3_ ( .D(n46), .CK(CLK), .RN(RST_n), .Q(w_reg_out[3])
         );
  DFFR_X1 w_reg_out_reg_2_ ( .D(n47), .CK(CLK), .RN(RST_n), .Q(w_reg_out[2])
         );
  DFFR_X1 w_reg_out_reg_1_ ( .D(n48), .CK(CLK), .RN(RST_n), .Q(w_reg_out[1])
         );
  DFFR_X1 w_reg_out_reg_0_ ( .D(n49), .CK(CLK), .RN(RST_n), .Q(w_reg_out[0])
         );
  DFFR_X1 DOUT_reg_6_ ( .D(n31), .CK(CLK), .RN(RST_n), .Q(DOUT[6]), .QN(n24)
         );
  DFFR_X1 DOUT_reg_5_ ( .D(n30), .CK(CLK), .RN(RST_n), .Q(DOUT[5]), .QN(n23)
         );
  DFFR_X1 DOUT_reg_4_ ( .D(n29), .CK(CLK), .RN(RST_n), .Q(DOUT[4]), .QN(n22)
         );
  DFFR_X1 DOUT_reg_3_ ( .D(n28), .CK(CLK), .RN(RST_n), .Q(DOUT[3]), .QN(n21)
         );
  DFFR_X1 DOUT_reg_2_ ( .D(n27), .CK(CLK), .RN(RST_n), .Q(DOUT[2]), .QN(n20)
         );
  DFFR_X1 DOUT_reg_1_ ( .D(n26), .CK(CLK), .RN(RST_n), .Q(DOUT[1]), .QN(n19)
         );
  DFFR_X1 DOUT_reg_0_ ( .D(n25), .CK(CLK), .RN(RST_n), .Q(DOUT[0]), .QN(n18)
         );
  OAI21_X1 U35 ( .B1(n22), .B2(VIN), .A(n8), .ZN(n29) );
  NAND2_X1 U36 ( .A1(DOUT_reg_in[4]), .A2(VIN), .ZN(n8) );
  OAI21_X1 U37 ( .B1(n24), .B2(VIN), .A(n10), .ZN(n31) );
  NAND2_X1 U38 ( .A1(DOUT_reg_in[6]), .A2(VIN), .ZN(n10) );
  OAI21_X1 U39 ( .B1(n21), .B2(VIN), .A(n7), .ZN(n28) );
  NAND2_X1 U40 ( .A1(DOUT_reg_in[3]), .A2(VIN), .ZN(n7) );
  OAI21_X1 U41 ( .B1(n23), .B2(VIN), .A(n9), .ZN(n30) );
  NAND2_X1 U42 ( .A1(DOUT_reg_in[5]), .A2(VIN), .ZN(n9) );
  OAI21_X1 U43 ( .B1(n18), .B2(VIN), .A(n4), .ZN(n25) );
  NAND2_X1 U44 ( .A1(DOUT_reg_in[0]), .A2(VIN), .ZN(n4) );
  OAI21_X1 U45 ( .B1(n19), .B2(VIN), .A(n5), .ZN(n26) );
  NAND2_X1 U46 ( .A1(DOUT_reg_in[1]), .A2(VIN), .ZN(n5) );
  OAI21_X1 U47 ( .B1(n20), .B2(VIN), .A(n6), .ZN(n27) );
  NAND2_X1 U48 ( .A1(DOUT_reg_in[2]), .A2(VIN), .ZN(n6) );
  INV_X1 U49 ( .A(n3), .ZN(n42) );
  AOI22_X1 U50 ( .A1(w_reg_out[7]), .A2(n50), .B1(w[7]), .B2(VIN), .ZN(n3) );
  INV_X1 U51 ( .A(n1), .ZN(n43) );
  AOI22_X1 U52 ( .A1(w_reg_out[6]), .A2(n50), .B1(w[6]), .B2(VIN), .ZN(n1) );
  INV_X1 U53 ( .A(n13), .ZN(n47) );
  AOI22_X1 U54 ( .A1(w_reg_out[2]), .A2(n50), .B1(w[2]), .B2(VIN), .ZN(n13) );
  INV_X1 U55 ( .A(n11), .ZN(n49) );
  AOI22_X1 U56 ( .A1(w_reg_out[0]), .A2(n50), .B1(w[0]), .B2(VIN), .ZN(n11) );
  INV_X1 U57 ( .A(n12), .ZN(n48) );
  AOI22_X1 U58 ( .A1(w_reg_out[1]), .A2(n50), .B1(w[1]), .B2(VIN), .ZN(n12) );
  INV_X1 U59 ( .A(n14), .ZN(n46) );
  AOI22_X1 U60 ( .A1(w_reg_out[3]), .A2(n50), .B1(w[3]), .B2(VIN), .ZN(n14) );
  INV_X1 U61 ( .A(n15), .ZN(n45) );
  AOI22_X1 U62 ( .A1(w_reg_out[4]), .A2(n50), .B1(w[4]), .B2(VIN), .ZN(n15) );
  INV_X1 U63 ( .A(n16), .ZN(n44) );
  AOI22_X1 U64 ( .A1(w_reg_out[5]), .A2(n50), .B1(w[5]), .B2(VIN), .ZN(n16) );
  INV_X1 U65 ( .A(VIN), .ZN(n50) );
  NAND2_X1 U66 ( .A1(n17), .A2(n50), .ZN(n40) );
  XNOR2_X1 sub_28_U10 ( .A(sub_28_n8), .B(DIN[0]), .ZN(w[0]) );
  INV_X1 sub_28_U9 ( .A(fb_sh[5]), .ZN(sub_28_n3) );
  INV_X1 sub_28_U8 ( .A(fb_sh[4]), .ZN(sub_28_n4) );
  INV_X1 sub_28_U7 ( .A(fb_sh[3]), .ZN(sub_28_n5) );
  INV_X1 sub_28_U6 ( .A(fb_sh[2]), .ZN(sub_28_n6) );
  INV_X1 sub_28_U5 ( .A(DIN[0]), .ZN(sub_28_n1) );
  INV_X1 sub_28_U4 ( .A(fb_sh[1]), .ZN(sub_28_n7) );
  NAND2_X1 sub_28_U3 ( .A1(fb_sh[0]), .A2(sub_28_n1), .ZN(sub_28_carry[1]) );
  INV_X1 sub_28_U2 ( .A(fb_sh[6]), .ZN(sub_28_n2) );
  INV_X1 sub_28_U1 ( .A(fb_sh[0]), .ZN(sub_28_n8) );
  FA_X1 sub_28_U2_1 ( .A(DIN[1]), .B(sub_28_n7), .CI(sub_28_carry[1]), .CO(
        sub_28_carry[2]), .S(w[1]) );
  FA_X1 sub_28_U2_2 ( .A(DIN[2]), .B(sub_28_n6), .CI(sub_28_carry[2]), .CO(
        sub_28_carry[3]), .S(w[2]) );
  FA_X1 sub_28_U2_3 ( .A(DIN[3]), .B(sub_28_n5), .CI(sub_28_carry[3]), .CO(
        sub_28_carry[4]), .S(w[3]) );
  FA_X1 sub_28_U2_4 ( .A(DIN[4]), .B(sub_28_n4), .CI(sub_28_carry[4]), .CO(
        sub_28_carry[5]), .S(w[4]) );
  FA_X1 sub_28_U2_5 ( .A(DIN[5]), .B(sub_28_n3), .CI(sub_28_carry[5]), .CO(
        sub_28_carry[6]), .S(w[5]) );
  FA_X1 sub_28_U2_6 ( .A(DIN[6]), .B(sub_28_n2), .CI(sub_28_carry[6]), .CO(
        sub_28_carry[7]), .S(w[6]) );
  FA_X1 sub_28_U2_7 ( .A(DIN[6]), .B(sub_28_n2), .CI(sub_28_carry[7]), .S(w[7]) );
  NOR2_X1 mult_33_U203 ( .A1(mult_33_n190), .A2(mult_33_n183), .ZN(
        mult_33_n100) );
  NOR2_X1 mult_33_U202 ( .A1(mult_33_n183), .A2(mult_33_n191), .ZN(
        mult_33_n101) );
  NOR2_X1 mult_33_U201 ( .A1(mult_33_n183), .A2(mult_33_n192), .ZN(
        mult_33_n102) );
  NOR2_X1 mult_33_U200 ( .A1(mult_33_n183), .A2(mult_33_n193), .ZN(
        mult_33_n103) );
  NOR2_X1 mult_33_U199 ( .A1(mult_33_n183), .A2(mult_33_n195), .ZN(
        mult_33_n105) );
  NOR2_X1 mult_33_U198 ( .A1(mult_33_n183), .A2(mult_33_n196), .ZN(
        mult_33_n106) );
  NAND2_X1 mult_33_U197 ( .A1(H1[3]), .A2(w_reg_out[7]), .ZN(mult_33_n107) );
  NOR2_X1 mult_33_U196 ( .A1(mult_33_n190), .A2(mult_33_n185), .ZN(
        mult_33_n108) );
  NOR2_X1 mult_33_U195 ( .A1(mult_33_n191), .A2(mult_33_n185), .ZN(
        mult_33_n109) );
  NOR2_X1 mult_33_U194 ( .A1(mult_33_n192), .A2(mult_33_n185), .ZN(
        mult_33_n110) );
  NOR2_X1 mult_33_U193 ( .A1(mult_33_n193), .A2(mult_33_n185), .ZN(
        mult_33_n111) );
  NOR2_X1 mult_33_U192 ( .A1(mult_33_n194), .A2(mult_33_n185), .ZN(
        mult_33_n112) );
  NOR2_X1 mult_33_U191 ( .A1(mult_33_n195), .A2(mult_33_n185), .ZN(
        mult_33_n113) );
  NOR2_X1 mult_33_U190 ( .A1(mult_33_n196), .A2(mult_33_n185), .ZN(
        mult_33_n114) );
  NAND2_X1 mult_33_U189 ( .A1(H1[2]), .A2(w_reg_out[7]), .ZN(mult_33_n115) );
  NOR2_X1 mult_33_U188 ( .A1(mult_33_n190), .A2(mult_33_n186), .ZN(
        mult_33_n116) );
  NOR2_X1 mult_33_U187 ( .A1(mult_33_n191), .A2(mult_33_n186), .ZN(
        mult_33_n117) );
  NOR2_X1 mult_33_U186 ( .A1(mult_33_n192), .A2(mult_33_n186), .ZN(
        mult_33_n118) );
  NOR2_X1 mult_33_U185 ( .A1(mult_33_n193), .A2(mult_33_n186), .ZN(
        mult_33_n119) );
  NOR2_X1 mult_33_U184 ( .A1(mult_33_n194), .A2(mult_33_n186), .ZN(
        mult_33_n120) );
  NOR2_X1 mult_33_U183 ( .A1(mult_33_n195), .A2(mult_33_n186), .ZN(
        mult_33_n121) );
  NAND2_X1 mult_33_U182 ( .A1(H1[1]), .A2(w_reg_out[7]), .ZN(mult_33_n123) );
  NOR2_X1 mult_33_U181 ( .A1(mult_33_n190), .A2(mult_33_n188), .ZN(
        mult_33_n124) );
  NOR2_X1 mult_33_U180 ( .A1(mult_33_n191), .A2(mult_33_n188), .ZN(
        mult_33_n125) );
  NOR2_X1 mult_33_U179 ( .A1(mult_33_n192), .A2(mult_33_n188), .ZN(
        mult_33_n126) );
  NOR2_X1 mult_33_U178 ( .A1(mult_33_n193), .A2(mult_33_n188), .ZN(
        mult_33_n127) );
  NOR2_X1 mult_33_U177 ( .A1(mult_33_n194), .A2(mult_33_n188), .ZN(
        mult_33_n128) );
  NOR2_X1 mult_33_U176 ( .A1(mult_33_n195), .A2(mult_33_n188), .ZN(
        mult_33_n129) );
  NAND2_X1 mult_33_U175 ( .A1(H1[0]), .A2(w_reg_out[7]), .ZN(mult_33_n131) );
  NOR2_X1 mult_33_U174 ( .A1(mult_33_n191), .A2(mult_33_n189), .ZN(
        mult_33_n133) );
  NOR2_X1 mult_33_U173 ( .A1(mult_33_n192), .A2(mult_33_n189), .ZN(
        mult_33_n134) );
  NOR2_X1 mult_33_U172 ( .A1(mult_33_n193), .A2(mult_33_n189), .ZN(
        mult_33_n135) );
  NOR2_X1 mult_33_U171 ( .A1(mult_33_n194), .A2(mult_33_n189), .ZN(
        mult_33_n136) );
  NAND2_X1 mult_33_U170 ( .A1(w_reg_out[2]), .A2(H1[5]), .ZN(mult_33_n54) );
  NAND2_X1 mult_33_U169 ( .A1(H1[0]), .A2(w_reg_out[6]), .ZN(mult_33_n208) );
  NAND2_X1 mult_33_U168 ( .A1(w_reg_out[2]), .A2(H1[4]), .ZN(mult_33_n207) );
  NAND2_X1 mult_33_U167 ( .A1(mult_33_n208), .A2(mult_33_n207), .ZN(
        mult_33_n63) );
  XNOR2_X1 mult_33_U166 ( .A(mult_33_n207), .B(mult_33_n208), .ZN(mult_33_n64)
         );
  NOR4_X1 mult_33_U165 ( .A1(mult_33_n188), .A2(mult_33_n189), .A3(
        mult_33_n195), .A4(mult_33_n196), .ZN(mult_33_n205) );
  NOR2_X1 mult_33_U164 ( .A1(mult_33_n186), .A2(mult_33_n196), .ZN(
        mult_33_n206) );
  AOI222_X1 mult_33_U163 ( .A1(mult_33_n84), .A2(mult_33_n205), .B1(
        mult_33_n206), .B2(mult_33_n84), .C1(mult_33_n206), .C2(mult_33_n205), 
        .ZN(mult_33_n204) );
  OAI222_X1 mult_33_U162 ( .A1(mult_33_n204), .A2(mult_33_n187), .B1(
        mult_33_n187), .B2(mult_33_n184), .C1(mult_33_n204), .C2(mult_33_n184), 
        .ZN(mult_33_n203) );
  AOI222_X1 mult_33_U161 ( .A1(mult_33_n203), .A2(mult_33_n74), .B1(
        mult_33_n203), .B2(mult_33_n76), .C1(mult_33_n76), .C2(mult_33_n74), 
        .ZN(mult_33_n202) );
  OAI222_X1 mult_33_U160 ( .A1(mult_33_n202), .A2(mult_33_n179), .B1(
        mult_33_n202), .B2(mult_33_n182), .C1(mult_33_n182), .C2(mult_33_n179), 
        .ZN(mult_33_n8) );
  NAND2_X1 mult_33_U159 ( .A1(w_reg_out[5]), .A2(H1[6]), .ZN(mult_33_n86) );
  NAND2_X1 mult_33_U158 ( .A1(w_reg_out[4]), .A2(H1[6]), .ZN(mult_33_n87) );
  NAND2_X1 mult_33_U157 ( .A1(w_reg_out[3]), .A2(H1[6]), .ZN(mult_33_n88) );
  NAND2_X1 mult_33_U156 ( .A1(w_reg_out[2]), .A2(H1[6]), .ZN(mult_33_n89) );
  NAND2_X1 mult_33_U155 ( .A1(w_reg_out[1]), .A2(H1[6]), .ZN(mult_33_n90) );
  NAND2_X1 mult_33_U154 ( .A1(w_reg_out[0]), .A2(H1[6]), .ZN(mult_33_n91) );
  NOR2_X1 mult_33_U153 ( .A1(mult_33_n180), .A2(mult_33_n190), .ZN(mult_33_n93) );
  NOR2_X1 mult_33_U152 ( .A1(mult_33_n180), .A2(mult_33_n191), .ZN(mult_33_n94) );
  NOR2_X1 mult_33_U151 ( .A1(mult_33_n180), .A2(mult_33_n192), .ZN(mult_33_n95) );
  NOR2_X1 mult_33_U150 ( .A1(mult_33_n180), .A2(mult_33_n193), .ZN(mult_33_n96) );
  NOR2_X1 mult_33_U149 ( .A1(mult_33_n180), .A2(mult_33_n195), .ZN(mult_33_n97) );
  NOR2_X1 mult_33_U148 ( .A1(mult_33_n180), .A2(mult_33_n196), .ZN(mult_33_n98) );
  NAND2_X1 mult_33_U147 ( .A1(H1[4]), .A2(w_reg_out[7]), .ZN(mult_33_n99) );
  XNOR2_X1 mult_33_U146 ( .A(mult_33_n2), .B(mult_33_n17), .ZN(mult_33_n201)
         );
  XOR2_X1 mult_33_U145 ( .A(mult_33_n201), .B(mult_33_n15), .Z(mult_33_n197)
         );
  NAND2_X1 mult_33_U144 ( .A1(H1[5]), .A2(w_reg_out[7]), .ZN(mult_33_n199) );
  AND2_X1 mult_33_U143 ( .A1(w_reg_out[6]), .A2(H1[6]), .ZN(mult_33_n200) );
  XOR2_X1 mult_33_U142 ( .A(mult_33_n199), .B(mult_33_n200), .Z(mult_33_n198)
         );
  XOR2_X1 mult_33_U141 ( .A(mult_33_n197), .B(mult_33_n198), .Z(fb_sh[6]) );
  INV_X1 mult_33_U140 ( .A(w_reg_out[0]), .ZN(mult_33_n196) );
  INV_X1 mult_33_U139 ( .A(w_reg_out[6]), .ZN(mult_33_n190) );
  INV_X1 mult_33_U138 ( .A(w_reg_out[5]), .ZN(mult_33_n191) );
  INV_X1 mult_33_U137 ( .A(w_reg_out[4]), .ZN(mult_33_n192) );
  INV_X1 mult_33_U136 ( .A(w_reg_out[3]), .ZN(mult_33_n193) );
  INV_X1 mult_33_U135 ( .A(H1[0]), .ZN(mult_33_n189) );
  INV_X1 mult_33_U134 ( .A(w_reg_out[2]), .ZN(mult_33_n194) );
  INV_X1 mult_33_U133 ( .A(H1[4]), .ZN(mult_33_n183) );
  INV_X1 mult_33_U132 ( .A(H1[5]), .ZN(mult_33_n180) );
  INV_X1 mult_33_U131 ( .A(w_reg_out[1]), .ZN(mult_33_n195) );
  INV_X1 mult_33_U130 ( .A(H1[3]), .ZN(mult_33_n185) );
  INV_X1 mult_33_U129 ( .A(H1[2]), .ZN(mult_33_n186) );
  INV_X1 mult_33_U128 ( .A(H1[1]), .ZN(mult_33_n188) );
  INV_X1 mult_33_U127 ( .A(mult_33_n54), .ZN(mult_33_n181) );
  INV_X1 mult_33_U126 ( .A(mult_33_n80), .ZN(mult_33_n187) );
  INV_X1 mult_33_U125 ( .A(mult_33_n66), .ZN(mult_33_n179) );
  INV_X1 mult_33_U124 ( .A(mult_33_n73), .ZN(mult_33_n182) );
  INV_X1 mult_33_U123 ( .A(mult_33_n82), .ZN(mult_33_n184) );
  HA_X1 mult_33_U51 ( .A(mult_33_n129), .B(mult_33_n136), .CO(mult_33_n83), 
        .S(mult_33_n84) );
  HA_X1 mult_33_U50 ( .A(mult_33_n114), .B(mult_33_n121), .CO(mult_33_n81), 
        .S(mult_33_n82) );
  FA_X1 mult_33_U49 ( .A(mult_33_n128), .B(mult_33_n135), .CI(mult_33_n83), 
        .CO(mult_33_n79), .S(mult_33_n80) );
  HA_X1 mult_33_U48 ( .A(mult_33_n106), .B(mult_33_n113), .CO(mult_33_n77), 
        .S(mult_33_n78) );
  FA_X1 mult_33_U47 ( .A(mult_33_n120), .B(mult_33_n134), .CI(mult_33_n127), 
        .CO(mult_33_n75), .S(mult_33_n76) );
  FA_X1 mult_33_U46 ( .A(mult_33_n78), .B(mult_33_n81), .CI(mult_33_n79), .CO(
        mult_33_n73), .S(mult_33_n74) );
  HA_X1 mult_33_U45 ( .A(mult_33_n98), .B(mult_33_n105), .CO(mult_33_n71), .S(
        mult_33_n72) );
  FA_X1 mult_33_U44 ( .A(mult_33_n112), .B(mult_33_n133), .CI(mult_33_n119), 
        .CO(mult_33_n69), .S(mult_33_n70) );
  FA_X1 mult_33_U43 ( .A(mult_33_n77), .B(mult_33_n126), .CI(mult_33_n72), 
        .CO(mult_33_n67), .S(mult_33_n68) );
  FA_X1 mult_33_U42 ( .A(mult_33_n70), .B(mult_33_n75), .CI(mult_33_n68), .CO(
        mult_33_n65), .S(mult_33_n66) );
  FA_X1 mult_33_U39 ( .A(mult_33_n97), .B(mult_33_n125), .CI(mult_33_n111), 
        .CO(mult_33_n61), .S(mult_33_n62) );
  FA_X1 mult_33_U38 ( .A(mult_33_n91), .B(mult_33_n118), .CI(mult_33_n71), 
        .CO(mult_33_n59), .S(mult_33_n60) );
  FA_X1 mult_33_U37 ( .A(mult_33_n69), .B(mult_33_n64), .CI(mult_33_n62), .CO(
        mult_33_n57), .S(mult_33_n58) );
  FA_X1 mult_33_U36 ( .A(mult_33_n60), .B(mult_33_n67), .CI(mult_33_n58), .CO(
        mult_33_n55), .S(mult_33_n56) );
  FA_X1 mult_33_U34 ( .A(mult_33_n103), .B(mult_33_n110), .CI(mult_33_n124), 
        .CO(mult_33_n51), .S(mult_33_n52) );
  FA_X1 mult_33_U33 ( .A(mult_33_n131), .B(mult_33_n117), .CI(mult_33_n90), 
        .CO(mult_33_n49), .S(mult_33_n50) );
  FA_X1 mult_33_U32 ( .A(mult_33_n63), .B(mult_33_n54), .CI(mult_33_n61), .CO(
        mult_33_n47), .S(mult_33_n48) );
  FA_X1 mult_33_U31 ( .A(mult_33_n52), .B(mult_33_n59), .CI(mult_33_n50), .CO(
        mult_33_n45), .S(mult_33_n46) );
  FA_X1 mult_33_U30 ( .A(mult_33_n48), .B(mult_33_n57), .CI(mult_33_n46), .CO(
        mult_33_n43), .S(mult_33_n44) );
  FA_X1 mult_33_U29 ( .A(mult_33_n102), .B(mult_33_n181), .CI(mult_33_n96), 
        .CO(mult_33_n41), .S(mult_33_n42) );
  FA_X1 mult_33_U28 ( .A(mult_33_n116), .B(mult_33_n109), .CI(mult_33_n123), 
        .CO(mult_33_n39), .S(mult_33_n40) );
  FA_X1 mult_33_U27 ( .A(mult_33_n51), .B(mult_33_n89), .CI(mult_33_n49), .CO(
        mult_33_n37), .S(mult_33_n38) );
  FA_X1 mult_33_U26 ( .A(mult_33_n40), .B(mult_33_n42), .CI(mult_33_n47), .CO(
        mult_33_n35), .S(mult_33_n36) );
  FA_X1 mult_33_U25 ( .A(mult_33_n38), .B(mult_33_n45), .CI(mult_33_n36), .CO(
        mult_33_n33), .S(mult_33_n34) );
  FA_X1 mult_33_U24 ( .A(mult_33_n95), .B(mult_33_n101), .CI(mult_33_n108), 
        .CO(mult_33_n31), .S(mult_33_n32) );
  FA_X1 mult_33_U23 ( .A(mult_33_n88), .B(mult_33_n115), .CI(mult_33_n41), 
        .CO(mult_33_n29), .S(mult_33_n30) );
  FA_X1 mult_33_U22 ( .A(mult_33_n32), .B(mult_33_n39), .CI(mult_33_n37), .CO(
        mult_33_n27), .S(mult_33_n28) );
  FA_X1 mult_33_U21 ( .A(mult_33_n35), .B(mult_33_n30), .CI(mult_33_n28), .CO(
        mult_33_n25), .S(mult_33_n26) );
  FA_X1 mult_33_U20 ( .A(mult_33_n94), .B(mult_33_n100), .CI(mult_33_n107), 
        .CO(mult_33_n23), .S(mult_33_n24) );
  FA_X1 mult_33_U19 ( .A(mult_33_n31), .B(mult_33_n87), .CI(mult_33_n24), .CO(
        mult_33_n21), .S(mult_33_n22) );
  FA_X1 mult_33_U18 ( .A(mult_33_n27), .B(mult_33_n29), .CI(mult_33_n22), .CO(
        mult_33_n19), .S(mult_33_n20) );
  FA_X1 mult_33_U17 ( .A(mult_33_n99), .B(mult_33_n93), .CI(mult_33_n86), .CO(
        mult_33_n17), .S(mult_33_n18) );
  FA_X1 mult_33_U16 ( .A(mult_33_n18), .B(mult_33_n23), .CI(mult_33_n21), .CO(
        mult_33_n15), .S(mult_33_n16) );
  FA_X1 mult_33_U8 ( .A(mult_33_n56), .B(mult_33_n65), .CI(mult_33_n8), .CO(
        mult_33_n7), .S(fb_sh[0]) );
  FA_X1 mult_33_U7 ( .A(mult_33_n44), .B(mult_33_n55), .CI(mult_33_n7), .CO(
        mult_33_n6), .S(fb_sh[1]) );
  FA_X1 mult_33_U6 ( .A(mult_33_n34), .B(mult_33_n43), .CI(mult_33_n6), .CO(
        mult_33_n5), .S(fb_sh[2]) );
  FA_X1 mult_33_U5 ( .A(mult_33_n26), .B(mult_33_n33), .CI(mult_33_n5), .CO(
        mult_33_n4), .S(fb_sh[3]) );
  FA_X1 mult_33_U4 ( .A(mult_33_n20), .B(mult_33_n25), .CI(mult_33_n4), .CO(
        mult_33_n3), .S(fb_sh[4]) );
  FA_X1 mult_33_U3 ( .A(mult_33_n19), .B(mult_33_n16), .CI(mult_33_n3), .CO(
        mult_33_n2), .S(fb_sh[5]) );
  NOR2_X1 mult_34_U203 ( .A1(mult_34_n190), .A2(mult_34_n183), .ZN(
        mult_34_n100) );
  NOR2_X1 mult_34_U202 ( .A1(mult_34_n183), .A2(mult_34_n191), .ZN(
        mult_34_n101) );
  NOR2_X1 mult_34_U201 ( .A1(mult_34_n183), .A2(mult_34_n192), .ZN(
        mult_34_n102) );
  NOR2_X1 mult_34_U200 ( .A1(mult_34_n183), .A2(mult_34_n193), .ZN(
        mult_34_n103) );
  NOR2_X1 mult_34_U199 ( .A1(mult_34_n183), .A2(mult_34_n195), .ZN(
        mult_34_n105) );
  NOR2_X1 mult_34_U198 ( .A1(mult_34_n183), .A2(mult_34_n196), .ZN(
        mult_34_n106) );
  NAND2_X1 mult_34_U197 ( .A1(H3[3]), .A2(w_reg_out[7]), .ZN(mult_34_n107) );
  NOR2_X1 mult_34_U196 ( .A1(mult_34_n190), .A2(mult_34_n185), .ZN(
        mult_34_n108) );
  NOR2_X1 mult_34_U195 ( .A1(mult_34_n191), .A2(mult_34_n185), .ZN(
        mult_34_n109) );
  NOR2_X1 mult_34_U194 ( .A1(mult_34_n192), .A2(mult_34_n185), .ZN(
        mult_34_n110) );
  NOR2_X1 mult_34_U193 ( .A1(mult_34_n193), .A2(mult_34_n185), .ZN(
        mult_34_n111) );
  NOR2_X1 mult_34_U192 ( .A1(mult_34_n194), .A2(mult_34_n185), .ZN(
        mult_34_n112) );
  NOR2_X1 mult_34_U191 ( .A1(mult_34_n195), .A2(mult_34_n185), .ZN(
        mult_34_n113) );
  NOR2_X1 mult_34_U190 ( .A1(mult_34_n196), .A2(mult_34_n185), .ZN(
        mult_34_n114) );
  NAND2_X1 mult_34_U189 ( .A1(H3[2]), .A2(w_reg_out[7]), .ZN(mult_34_n115) );
  NOR2_X1 mult_34_U188 ( .A1(mult_34_n190), .A2(mult_34_n186), .ZN(
        mult_34_n116) );
  NOR2_X1 mult_34_U187 ( .A1(mult_34_n191), .A2(mult_34_n186), .ZN(
        mult_34_n117) );
  NOR2_X1 mult_34_U186 ( .A1(mult_34_n192), .A2(mult_34_n186), .ZN(
        mult_34_n118) );
  NOR2_X1 mult_34_U185 ( .A1(mult_34_n193), .A2(mult_34_n186), .ZN(
        mult_34_n119) );
  NOR2_X1 mult_34_U184 ( .A1(mult_34_n194), .A2(mult_34_n186), .ZN(
        mult_34_n120) );
  NOR2_X1 mult_34_U183 ( .A1(mult_34_n195), .A2(mult_34_n186), .ZN(
        mult_34_n121) );
  NAND2_X1 mult_34_U182 ( .A1(H3[1]), .A2(w_reg_out[7]), .ZN(mult_34_n123) );
  NOR2_X1 mult_34_U181 ( .A1(mult_34_n190), .A2(mult_34_n188), .ZN(
        mult_34_n124) );
  NOR2_X1 mult_34_U180 ( .A1(mult_34_n191), .A2(mult_34_n188), .ZN(
        mult_34_n125) );
  NOR2_X1 mult_34_U179 ( .A1(mult_34_n192), .A2(mult_34_n188), .ZN(
        mult_34_n126) );
  NOR2_X1 mult_34_U178 ( .A1(mult_34_n193), .A2(mult_34_n188), .ZN(
        mult_34_n127) );
  NOR2_X1 mult_34_U177 ( .A1(mult_34_n194), .A2(mult_34_n188), .ZN(
        mult_34_n128) );
  NOR2_X1 mult_34_U176 ( .A1(mult_34_n195), .A2(mult_34_n188), .ZN(
        mult_34_n129) );
  NAND2_X1 mult_34_U175 ( .A1(H3[0]), .A2(w_reg_out[7]), .ZN(mult_34_n131) );
  NOR2_X1 mult_34_U174 ( .A1(mult_34_n191), .A2(mult_34_n189), .ZN(
        mult_34_n133) );
  NOR2_X1 mult_34_U173 ( .A1(mult_34_n192), .A2(mult_34_n189), .ZN(
        mult_34_n134) );
  NOR2_X1 mult_34_U172 ( .A1(mult_34_n193), .A2(mult_34_n189), .ZN(
        mult_34_n135) );
  NOR2_X1 mult_34_U171 ( .A1(mult_34_n194), .A2(mult_34_n189), .ZN(
        mult_34_n136) );
  NAND2_X1 mult_34_U170 ( .A1(w_reg_out[2]), .A2(H3[5]), .ZN(mult_34_n54) );
  NAND2_X1 mult_34_U169 ( .A1(H3[0]), .A2(w_reg_out[6]), .ZN(mult_34_n208) );
  NAND2_X1 mult_34_U168 ( .A1(w_reg_out[2]), .A2(H3[4]), .ZN(mult_34_n207) );
  NAND2_X1 mult_34_U167 ( .A1(mult_34_n208), .A2(mult_34_n207), .ZN(
        mult_34_n63) );
  XNOR2_X1 mult_34_U166 ( .A(mult_34_n207), .B(mult_34_n208), .ZN(mult_34_n64)
         );
  NOR4_X1 mult_34_U165 ( .A1(mult_34_n188), .A2(mult_34_n189), .A3(
        mult_34_n195), .A4(mult_34_n196), .ZN(mult_34_n205) );
  NOR2_X1 mult_34_U164 ( .A1(mult_34_n186), .A2(mult_34_n196), .ZN(
        mult_34_n206) );
  AOI222_X1 mult_34_U163 ( .A1(mult_34_n84), .A2(mult_34_n205), .B1(
        mult_34_n206), .B2(mult_34_n84), .C1(mult_34_n206), .C2(mult_34_n205), 
        .ZN(mult_34_n204) );
  OAI222_X1 mult_34_U162 ( .A1(mult_34_n204), .A2(mult_34_n187), .B1(
        mult_34_n187), .B2(mult_34_n184), .C1(mult_34_n204), .C2(mult_34_n184), 
        .ZN(mult_34_n203) );
  AOI222_X1 mult_34_U161 ( .A1(mult_34_n203), .A2(mult_34_n74), .B1(
        mult_34_n203), .B2(mult_34_n76), .C1(mult_34_n76), .C2(mult_34_n74), 
        .ZN(mult_34_n202) );
  OAI222_X1 mult_34_U160 ( .A1(mult_34_n202), .A2(mult_34_n179), .B1(
        mult_34_n202), .B2(mult_34_n182), .C1(mult_34_n182), .C2(mult_34_n179), 
        .ZN(mult_34_n8) );
  NAND2_X1 mult_34_U159 ( .A1(w_reg_out[5]), .A2(H3[6]), .ZN(mult_34_n86) );
  NAND2_X1 mult_34_U158 ( .A1(w_reg_out[4]), .A2(H3[6]), .ZN(mult_34_n87) );
  NAND2_X1 mult_34_U157 ( .A1(w_reg_out[3]), .A2(H3[6]), .ZN(mult_34_n88) );
  NAND2_X1 mult_34_U156 ( .A1(w_reg_out[2]), .A2(H3[6]), .ZN(mult_34_n89) );
  NAND2_X1 mult_34_U155 ( .A1(w_reg_out[1]), .A2(H3[6]), .ZN(mult_34_n90) );
  NAND2_X1 mult_34_U154 ( .A1(w_reg_out[0]), .A2(H3[6]), .ZN(mult_34_n91) );
  NOR2_X1 mult_34_U153 ( .A1(mult_34_n180), .A2(mult_34_n190), .ZN(mult_34_n93) );
  NOR2_X1 mult_34_U152 ( .A1(mult_34_n180), .A2(mult_34_n191), .ZN(mult_34_n94) );
  NOR2_X1 mult_34_U151 ( .A1(mult_34_n180), .A2(mult_34_n192), .ZN(mult_34_n95) );
  NOR2_X1 mult_34_U150 ( .A1(mult_34_n180), .A2(mult_34_n193), .ZN(mult_34_n96) );
  NOR2_X1 mult_34_U149 ( .A1(mult_34_n180), .A2(mult_34_n195), .ZN(mult_34_n97) );
  NOR2_X1 mult_34_U148 ( .A1(mult_34_n180), .A2(mult_34_n196), .ZN(mult_34_n98) );
  NAND2_X1 mult_34_U147 ( .A1(H3[4]), .A2(w_reg_out[7]), .ZN(mult_34_n99) );
  XNOR2_X1 mult_34_U146 ( .A(mult_34_n2), .B(mult_34_n17), .ZN(mult_34_n201)
         );
  XOR2_X1 mult_34_U145 ( .A(mult_34_n201), .B(mult_34_n15), .Z(mult_34_n197)
         );
  NAND2_X1 mult_34_U144 ( .A1(H3[5]), .A2(w_reg_out[7]), .ZN(mult_34_n199) );
  AND2_X1 mult_34_U143 ( .A1(w_reg_out[6]), .A2(H3[6]), .ZN(mult_34_n200) );
  XOR2_X1 mult_34_U142 ( .A(mult_34_n199), .B(mult_34_n200), .Z(mult_34_n198)
         );
  XOR2_X1 mult_34_U141 ( .A(mult_34_n197), .B(mult_34_n198), .Z(ff_sh_6_) );
  INV_X1 mult_34_U140 ( .A(H3[0]), .ZN(mult_34_n189) );
  INV_X1 mult_34_U139 ( .A(w_reg_out[0]), .ZN(mult_34_n196) );
  INV_X1 mult_34_U138 ( .A(w_reg_out[2]), .ZN(mult_34_n194) );
  INV_X1 mult_34_U137 ( .A(w_reg_out[6]), .ZN(mult_34_n190) );
  INV_X1 mult_34_U136 ( .A(H3[4]), .ZN(mult_34_n183) );
  INV_X1 mult_34_U135 ( .A(H3[5]), .ZN(mult_34_n180) );
  INV_X1 mult_34_U134 ( .A(w_reg_out[1]), .ZN(mult_34_n195) );
  INV_X1 mult_34_U133 ( .A(w_reg_out[3]), .ZN(mult_34_n193) );
  INV_X1 mult_34_U132 ( .A(w_reg_out[4]), .ZN(mult_34_n192) );
  INV_X1 mult_34_U131 ( .A(w_reg_out[5]), .ZN(mult_34_n191) );
  INV_X1 mult_34_U130 ( .A(H3[3]), .ZN(mult_34_n185) );
  INV_X1 mult_34_U129 ( .A(H3[2]), .ZN(mult_34_n186) );
  INV_X1 mult_34_U128 ( .A(H3[1]), .ZN(mult_34_n188) );
  INV_X1 mult_34_U127 ( .A(mult_34_n54), .ZN(mult_34_n181) );
  INV_X1 mult_34_U126 ( .A(mult_34_n80), .ZN(mult_34_n187) );
  INV_X1 mult_34_U125 ( .A(mult_34_n66), .ZN(mult_34_n179) );
  INV_X1 mult_34_U124 ( .A(mult_34_n73), .ZN(mult_34_n182) );
  INV_X1 mult_34_U123 ( .A(mult_34_n82), .ZN(mult_34_n184) );
  HA_X1 mult_34_U51 ( .A(mult_34_n129), .B(mult_34_n136), .CO(mult_34_n83), 
        .S(mult_34_n84) );
  HA_X1 mult_34_U50 ( .A(mult_34_n114), .B(mult_34_n121), .CO(mult_34_n81), 
        .S(mult_34_n82) );
  FA_X1 mult_34_U49 ( .A(mult_34_n128), .B(mult_34_n135), .CI(mult_34_n83), 
        .CO(mult_34_n79), .S(mult_34_n80) );
  HA_X1 mult_34_U48 ( .A(mult_34_n106), .B(mult_34_n113), .CO(mult_34_n77), 
        .S(mult_34_n78) );
  FA_X1 mult_34_U47 ( .A(mult_34_n120), .B(mult_34_n134), .CI(mult_34_n127), 
        .CO(mult_34_n75), .S(mult_34_n76) );
  FA_X1 mult_34_U46 ( .A(mult_34_n78), .B(mult_34_n81), .CI(mult_34_n79), .CO(
        mult_34_n73), .S(mult_34_n74) );
  HA_X1 mult_34_U45 ( .A(mult_34_n98), .B(mult_34_n105), .CO(mult_34_n71), .S(
        mult_34_n72) );
  FA_X1 mult_34_U44 ( .A(mult_34_n112), .B(mult_34_n133), .CI(mult_34_n119), 
        .CO(mult_34_n69), .S(mult_34_n70) );
  FA_X1 mult_34_U43 ( .A(mult_34_n77), .B(mult_34_n126), .CI(mult_34_n72), 
        .CO(mult_34_n67), .S(mult_34_n68) );
  FA_X1 mult_34_U42 ( .A(mult_34_n70), .B(mult_34_n75), .CI(mult_34_n68), .CO(
        mult_34_n65), .S(mult_34_n66) );
  FA_X1 mult_34_U39 ( .A(mult_34_n97), .B(mult_34_n125), .CI(mult_34_n111), 
        .CO(mult_34_n61), .S(mult_34_n62) );
  FA_X1 mult_34_U38 ( .A(mult_34_n91), .B(mult_34_n118), .CI(mult_34_n71), 
        .CO(mult_34_n59), .S(mult_34_n60) );
  FA_X1 mult_34_U37 ( .A(mult_34_n69), .B(mult_34_n64), .CI(mult_34_n62), .CO(
        mult_34_n57), .S(mult_34_n58) );
  FA_X1 mult_34_U36 ( .A(mult_34_n60), .B(mult_34_n67), .CI(mult_34_n58), .CO(
        mult_34_n55), .S(mult_34_n56) );
  FA_X1 mult_34_U34 ( .A(mult_34_n103), .B(mult_34_n110), .CI(mult_34_n124), 
        .CO(mult_34_n51), .S(mult_34_n52) );
  FA_X1 mult_34_U33 ( .A(mult_34_n131), .B(mult_34_n117), .CI(mult_34_n90), 
        .CO(mult_34_n49), .S(mult_34_n50) );
  FA_X1 mult_34_U32 ( .A(mult_34_n63), .B(mult_34_n54), .CI(mult_34_n61), .CO(
        mult_34_n47), .S(mult_34_n48) );
  FA_X1 mult_34_U31 ( .A(mult_34_n52), .B(mult_34_n59), .CI(mult_34_n50), .CO(
        mult_34_n45), .S(mult_34_n46) );
  FA_X1 mult_34_U30 ( .A(mult_34_n48), .B(mult_34_n57), .CI(mult_34_n46), .CO(
        mult_34_n43), .S(mult_34_n44) );
  FA_X1 mult_34_U29 ( .A(mult_34_n102), .B(mult_34_n181), .CI(mult_34_n96), 
        .CO(mult_34_n41), .S(mult_34_n42) );
  FA_X1 mult_34_U28 ( .A(mult_34_n116), .B(mult_34_n109), .CI(mult_34_n123), 
        .CO(mult_34_n39), .S(mult_34_n40) );
  FA_X1 mult_34_U27 ( .A(mult_34_n51), .B(mult_34_n89), .CI(mult_34_n49), .CO(
        mult_34_n37), .S(mult_34_n38) );
  FA_X1 mult_34_U26 ( .A(mult_34_n40), .B(mult_34_n42), .CI(mult_34_n47), .CO(
        mult_34_n35), .S(mult_34_n36) );
  FA_X1 mult_34_U25 ( .A(mult_34_n38), .B(mult_34_n45), .CI(mult_34_n36), .CO(
        mult_34_n33), .S(mult_34_n34) );
  FA_X1 mult_34_U24 ( .A(mult_34_n95), .B(mult_34_n101), .CI(mult_34_n108), 
        .CO(mult_34_n31), .S(mult_34_n32) );
  FA_X1 mult_34_U23 ( .A(mult_34_n88), .B(mult_34_n115), .CI(mult_34_n41), 
        .CO(mult_34_n29), .S(mult_34_n30) );
  FA_X1 mult_34_U22 ( .A(mult_34_n32), .B(mult_34_n39), .CI(mult_34_n37), .CO(
        mult_34_n27), .S(mult_34_n28) );
  FA_X1 mult_34_U21 ( .A(mult_34_n35), .B(mult_34_n30), .CI(mult_34_n28), .CO(
        mult_34_n25), .S(mult_34_n26) );
  FA_X1 mult_34_U20 ( .A(mult_34_n94), .B(mult_34_n100), .CI(mult_34_n107), 
        .CO(mult_34_n23), .S(mult_34_n24) );
  FA_X1 mult_34_U19 ( .A(mult_34_n31), .B(mult_34_n87), .CI(mult_34_n24), .CO(
        mult_34_n21), .S(mult_34_n22) );
  FA_X1 mult_34_U18 ( .A(mult_34_n27), .B(mult_34_n29), .CI(mult_34_n22), .CO(
        mult_34_n19), .S(mult_34_n20) );
  FA_X1 mult_34_U17 ( .A(mult_34_n99), .B(mult_34_n93), .CI(mult_34_n86), .CO(
        mult_34_n17), .S(mult_34_n18) );
  FA_X1 mult_34_U16 ( .A(mult_34_n18), .B(mult_34_n23), .CI(mult_34_n21), .CO(
        mult_34_n15), .S(mult_34_n16) );
  FA_X1 mult_34_U8 ( .A(mult_34_n56), .B(mult_34_n65), .CI(mult_34_n8), .CO(
        mult_34_n7), .S(ff_sh_0_) );
  FA_X1 mult_34_U7 ( .A(mult_34_n44), .B(mult_34_n55), .CI(mult_34_n7), .CO(
        mult_34_n6), .S(ff_sh_1_) );
  FA_X1 mult_34_U6 ( .A(mult_34_n34), .B(mult_34_n43), .CI(mult_34_n6), .CO(
        mult_34_n5), .S(ff_sh_2_) );
  FA_X1 mult_34_U5 ( .A(mult_34_n26), .B(mult_34_n33), .CI(mult_34_n5), .CO(
        mult_34_n4), .S(ff_sh_3_) );
  FA_X1 mult_34_U4 ( .A(mult_34_n20), .B(mult_34_n25), .CI(mult_34_n4), .CO(
        mult_34_n3), .S(ff_sh_4_) );
  FA_X1 mult_34_U3 ( .A(mult_34_n19), .B(mult_34_n16), .CI(mult_34_n3), .CO(
        mult_34_n2), .S(ff_sh_5_) );
  NOR2_X1 mult_31_U203 ( .A1(mult_31_n179), .A2(mult_31_n192), .ZN(
        mult_31_n100) );
  NOR2_X1 mult_31_U202 ( .A1(mult_31_n192), .A2(mult_31_n181), .ZN(
        mult_31_n101) );
  NOR2_X1 mult_31_U201 ( .A1(mult_31_n192), .A2(mult_31_n182), .ZN(
        mult_31_n102) );
  NOR2_X1 mult_31_U200 ( .A1(mult_31_n192), .A2(mult_31_n185), .ZN(
        mult_31_n103) );
  NOR2_X1 mult_31_U199 ( .A1(mult_31_n192), .A2(mult_31_n189), .ZN(
        mult_31_n105) );
  NOR2_X1 mult_31_U198 ( .A1(mult_31_n192), .A2(mult_31_n190), .ZN(
        mult_31_n106) );
  NAND2_X1 mult_31_U197 ( .A1(H2[3]), .A2(w[7]), .ZN(mult_31_n107) );
  NOR2_X1 mult_31_U196 ( .A1(mult_31_n179), .A2(mult_31_n193), .ZN(
        mult_31_n108) );
  NOR2_X1 mult_31_U195 ( .A1(mult_31_n181), .A2(mult_31_n193), .ZN(
        mult_31_n109) );
  NOR2_X1 mult_31_U194 ( .A1(mult_31_n182), .A2(mult_31_n193), .ZN(
        mult_31_n110) );
  NOR2_X1 mult_31_U193 ( .A1(mult_31_n185), .A2(mult_31_n193), .ZN(
        mult_31_n111) );
  NOR2_X1 mult_31_U192 ( .A1(mult_31_n187), .A2(mult_31_n193), .ZN(
        mult_31_n112) );
  NOR2_X1 mult_31_U191 ( .A1(mult_31_n189), .A2(mult_31_n193), .ZN(
        mult_31_n113) );
  NOR2_X1 mult_31_U190 ( .A1(mult_31_n190), .A2(mult_31_n193), .ZN(
        mult_31_n114) );
  NAND2_X1 mult_31_U189 ( .A1(H2[2]), .A2(w[7]), .ZN(mult_31_n115) );
  NOR2_X1 mult_31_U188 ( .A1(mult_31_n179), .A2(mult_31_n194), .ZN(
        mult_31_n116) );
  NOR2_X1 mult_31_U187 ( .A1(mult_31_n181), .A2(mult_31_n194), .ZN(
        mult_31_n117) );
  NOR2_X1 mult_31_U186 ( .A1(mult_31_n182), .A2(mult_31_n194), .ZN(
        mult_31_n118) );
  NOR2_X1 mult_31_U185 ( .A1(mult_31_n185), .A2(mult_31_n194), .ZN(
        mult_31_n119) );
  NOR2_X1 mult_31_U184 ( .A1(mult_31_n187), .A2(mult_31_n194), .ZN(
        mult_31_n120) );
  NOR2_X1 mult_31_U183 ( .A1(mult_31_n189), .A2(mult_31_n194), .ZN(
        mult_31_n121) );
  NAND2_X1 mult_31_U182 ( .A1(H2[1]), .A2(w[7]), .ZN(mult_31_n123) );
  NOR2_X1 mult_31_U181 ( .A1(mult_31_n179), .A2(mult_31_n195), .ZN(
        mult_31_n124) );
  NOR2_X1 mult_31_U180 ( .A1(mult_31_n181), .A2(mult_31_n195), .ZN(
        mult_31_n125) );
  NOR2_X1 mult_31_U179 ( .A1(mult_31_n182), .A2(mult_31_n195), .ZN(
        mult_31_n126) );
  NOR2_X1 mult_31_U178 ( .A1(mult_31_n185), .A2(mult_31_n195), .ZN(
        mult_31_n127) );
  NOR2_X1 mult_31_U177 ( .A1(mult_31_n187), .A2(mult_31_n195), .ZN(
        mult_31_n128) );
  NOR2_X1 mult_31_U176 ( .A1(mult_31_n189), .A2(mult_31_n195), .ZN(
        mult_31_n129) );
  NAND2_X1 mult_31_U175 ( .A1(H2[0]), .A2(w[7]), .ZN(mult_31_n131) );
  NOR2_X1 mult_31_U174 ( .A1(mult_31_n181), .A2(mult_31_n196), .ZN(
        mult_31_n133) );
  NOR2_X1 mult_31_U173 ( .A1(mult_31_n182), .A2(mult_31_n196), .ZN(
        mult_31_n134) );
  NOR2_X1 mult_31_U172 ( .A1(mult_31_n185), .A2(mult_31_n196), .ZN(
        mult_31_n135) );
  NOR2_X1 mult_31_U171 ( .A1(mult_31_n187), .A2(mult_31_n196), .ZN(
        mult_31_n136) );
  NAND2_X1 mult_31_U170 ( .A1(w[2]), .A2(H2[5]), .ZN(mult_31_n54) );
  NAND2_X1 mult_31_U169 ( .A1(H2[0]), .A2(w[6]), .ZN(mult_31_n208) );
  NAND2_X1 mult_31_U168 ( .A1(w[2]), .A2(H2[4]), .ZN(mult_31_n207) );
  NAND2_X1 mult_31_U167 ( .A1(mult_31_n208), .A2(mult_31_n207), .ZN(
        mult_31_n63) );
  XNOR2_X1 mult_31_U166 ( .A(mult_31_n207), .B(mult_31_n208), .ZN(mult_31_n64)
         );
  NOR4_X1 mult_31_U165 ( .A1(mult_31_n195), .A2(mult_31_n196), .A3(
        mult_31_n189), .A4(mult_31_n190), .ZN(mult_31_n205) );
  NOR2_X1 mult_31_U164 ( .A1(mult_31_n194), .A2(mult_31_n190), .ZN(
        mult_31_n206) );
  AOI222_X1 mult_31_U163 ( .A1(mult_31_n84), .A2(mult_31_n205), .B1(
        mult_31_n206), .B2(mult_31_n84), .C1(mult_31_n206), .C2(mult_31_n205), 
        .ZN(mult_31_n204) );
  OAI222_X1 mult_31_U162 ( .A1(mult_31_n204), .A2(mult_31_n184), .B1(
        mult_31_n184), .B2(mult_31_n188), .C1(mult_31_n204), .C2(mult_31_n188), 
        .ZN(mult_31_n203) );
  AOI222_X1 mult_31_U161 ( .A1(mult_31_n203), .A2(mult_31_n74), .B1(
        mult_31_n203), .B2(mult_31_n76), .C1(mult_31_n76), .C2(mult_31_n74), 
        .ZN(mult_31_n202) );
  OAI222_X1 mult_31_U160 ( .A1(mult_31_n202), .A2(mult_31_n180), .B1(
        mult_31_n202), .B2(mult_31_n183), .C1(mult_31_n183), .C2(mult_31_n180), 
        .ZN(mult_31_n8) );
  NAND2_X1 mult_31_U159 ( .A1(w[5]), .A2(H2[6]), .ZN(mult_31_n86) );
  NAND2_X1 mult_31_U158 ( .A1(w[4]), .A2(H2[6]), .ZN(mult_31_n87) );
  NAND2_X1 mult_31_U157 ( .A1(w[3]), .A2(H2[6]), .ZN(mult_31_n88) );
  NAND2_X1 mult_31_U156 ( .A1(w[2]), .A2(H2[6]), .ZN(mult_31_n89) );
  NAND2_X1 mult_31_U155 ( .A1(w[1]), .A2(H2[6]), .ZN(mult_31_n90) );
  NAND2_X1 mult_31_U154 ( .A1(w[0]), .A2(H2[6]), .ZN(mult_31_n91) );
  NOR2_X1 mult_31_U153 ( .A1(mult_31_n191), .A2(mult_31_n179), .ZN(mult_31_n93) );
  NOR2_X1 mult_31_U152 ( .A1(mult_31_n191), .A2(mult_31_n181), .ZN(mult_31_n94) );
  NOR2_X1 mult_31_U151 ( .A1(mult_31_n191), .A2(mult_31_n182), .ZN(mult_31_n95) );
  NOR2_X1 mult_31_U150 ( .A1(mult_31_n191), .A2(mult_31_n185), .ZN(mult_31_n96) );
  NOR2_X1 mult_31_U149 ( .A1(mult_31_n191), .A2(mult_31_n189), .ZN(mult_31_n97) );
  NOR2_X1 mult_31_U148 ( .A1(mult_31_n191), .A2(mult_31_n190), .ZN(mult_31_n98) );
  NAND2_X1 mult_31_U147 ( .A1(H2[4]), .A2(w[7]), .ZN(mult_31_n99) );
  XNOR2_X1 mult_31_U146 ( .A(mult_31_n2), .B(mult_31_n17), .ZN(mult_31_n201)
         );
  XOR2_X1 mult_31_U145 ( .A(mult_31_n201), .B(mult_31_n15), .Z(mult_31_n197)
         );
  NAND2_X1 mult_31_U144 ( .A1(H2[5]), .A2(w[7]), .ZN(mult_31_n199) );
  AND2_X1 mult_31_U143 ( .A1(w[6]), .A2(H2[6]), .ZN(mult_31_n200) );
  XOR2_X1 mult_31_U142 ( .A(mult_31_n199), .B(mult_31_n200), .Z(mult_31_n198)
         );
  XOR2_X1 mult_31_U141 ( .A(mult_31_n197), .B(mult_31_n198), .Z(b0_w_12_) );
  INV_X1 mult_31_U140 ( .A(H2[0]), .ZN(mult_31_n196) );
  INV_X1 mult_31_U139 ( .A(H2[4]), .ZN(mult_31_n192) );
  INV_X1 mult_31_U138 ( .A(H2[5]), .ZN(mult_31_n191) );
  INV_X1 mult_31_U137 ( .A(H2[3]), .ZN(mult_31_n193) );
  INV_X1 mult_31_U136 ( .A(H2[2]), .ZN(mult_31_n194) );
  INV_X1 mult_31_U135 ( .A(H2[1]), .ZN(mult_31_n195) );
  INV_X1 mult_31_U134 ( .A(w[0]), .ZN(mult_31_n190) );
  INV_X1 mult_31_U133 ( .A(mult_31_n54), .ZN(mult_31_n186) );
  INV_X1 mult_31_U132 ( .A(w[1]), .ZN(mult_31_n189) );
  INV_X1 mult_31_U131 ( .A(w[2]), .ZN(mult_31_n187) );
  INV_X1 mult_31_U130 ( .A(w[6]), .ZN(mult_31_n179) );
  INV_X1 mult_31_U129 ( .A(w[3]), .ZN(mult_31_n185) );
  INV_X1 mult_31_U128 ( .A(w[4]), .ZN(mult_31_n182) );
  INV_X1 mult_31_U127 ( .A(w[5]), .ZN(mult_31_n181) );
  INV_X1 mult_31_U126 ( .A(mult_31_n80), .ZN(mult_31_n184) );
  INV_X1 mult_31_U125 ( .A(mult_31_n82), .ZN(mult_31_n188) );
  INV_X1 mult_31_U124 ( .A(mult_31_n73), .ZN(mult_31_n183) );
  INV_X1 mult_31_U123 ( .A(mult_31_n66), .ZN(mult_31_n180) );
  HA_X1 mult_31_U51 ( .A(mult_31_n129), .B(mult_31_n136), .CO(mult_31_n83), 
        .S(mult_31_n84) );
  HA_X1 mult_31_U50 ( .A(mult_31_n114), .B(mult_31_n121), .CO(mult_31_n81), 
        .S(mult_31_n82) );
  FA_X1 mult_31_U49 ( .A(mult_31_n128), .B(mult_31_n135), .CI(mult_31_n83), 
        .CO(mult_31_n79), .S(mult_31_n80) );
  HA_X1 mult_31_U48 ( .A(mult_31_n106), .B(mult_31_n113), .CO(mult_31_n77), 
        .S(mult_31_n78) );
  FA_X1 mult_31_U47 ( .A(mult_31_n120), .B(mult_31_n134), .CI(mult_31_n127), 
        .CO(mult_31_n75), .S(mult_31_n76) );
  FA_X1 mult_31_U46 ( .A(mult_31_n78), .B(mult_31_n81), .CI(mult_31_n79), .CO(
        mult_31_n73), .S(mult_31_n74) );
  HA_X1 mult_31_U45 ( .A(mult_31_n98), .B(mult_31_n105), .CO(mult_31_n71), .S(
        mult_31_n72) );
  FA_X1 mult_31_U44 ( .A(mult_31_n112), .B(mult_31_n133), .CI(mult_31_n119), 
        .CO(mult_31_n69), .S(mult_31_n70) );
  FA_X1 mult_31_U43 ( .A(mult_31_n77), .B(mult_31_n126), .CI(mult_31_n72), 
        .CO(mult_31_n67), .S(mult_31_n68) );
  FA_X1 mult_31_U42 ( .A(mult_31_n70), .B(mult_31_n75), .CI(mult_31_n68), .CO(
        mult_31_n65), .S(mult_31_n66) );
  FA_X1 mult_31_U39 ( .A(mult_31_n97), .B(mult_31_n125), .CI(mult_31_n111), 
        .CO(mult_31_n61), .S(mult_31_n62) );
  FA_X1 mult_31_U38 ( .A(mult_31_n91), .B(mult_31_n118), .CI(mult_31_n71), 
        .CO(mult_31_n59), .S(mult_31_n60) );
  FA_X1 mult_31_U37 ( .A(mult_31_n69), .B(mult_31_n64), .CI(mult_31_n62), .CO(
        mult_31_n57), .S(mult_31_n58) );
  FA_X1 mult_31_U36 ( .A(mult_31_n60), .B(mult_31_n67), .CI(mult_31_n58), .CO(
        mult_31_n55), .S(mult_31_n56) );
  FA_X1 mult_31_U34 ( .A(mult_31_n103), .B(mult_31_n110), .CI(mult_31_n124), 
        .CO(mult_31_n51), .S(mult_31_n52) );
  FA_X1 mult_31_U33 ( .A(mult_31_n131), .B(mult_31_n117), .CI(mult_31_n90), 
        .CO(mult_31_n49), .S(mult_31_n50) );
  FA_X1 mult_31_U32 ( .A(mult_31_n63), .B(mult_31_n54), .CI(mult_31_n61), .CO(
        mult_31_n47), .S(mult_31_n48) );
  FA_X1 mult_31_U31 ( .A(mult_31_n52), .B(mult_31_n59), .CI(mult_31_n50), .CO(
        mult_31_n45), .S(mult_31_n46) );
  FA_X1 mult_31_U30 ( .A(mult_31_n48), .B(mult_31_n57), .CI(mult_31_n46), .CO(
        mult_31_n43), .S(mult_31_n44) );
  FA_X1 mult_31_U29 ( .A(mult_31_n102), .B(mult_31_n186), .CI(mult_31_n96), 
        .CO(mult_31_n41), .S(mult_31_n42) );
  FA_X1 mult_31_U28 ( .A(mult_31_n116), .B(mult_31_n109), .CI(mult_31_n123), 
        .CO(mult_31_n39), .S(mult_31_n40) );
  FA_X1 mult_31_U27 ( .A(mult_31_n51), .B(mult_31_n89), .CI(mult_31_n49), .CO(
        mult_31_n37), .S(mult_31_n38) );
  FA_X1 mult_31_U26 ( .A(mult_31_n40), .B(mult_31_n42), .CI(mult_31_n47), .CO(
        mult_31_n35), .S(mult_31_n36) );
  FA_X1 mult_31_U25 ( .A(mult_31_n38), .B(mult_31_n45), .CI(mult_31_n36), .CO(
        mult_31_n33), .S(mult_31_n34) );
  FA_X1 mult_31_U24 ( .A(mult_31_n95), .B(mult_31_n101), .CI(mult_31_n108), 
        .CO(mult_31_n31), .S(mult_31_n32) );
  FA_X1 mult_31_U23 ( .A(mult_31_n88), .B(mult_31_n115), .CI(mult_31_n41), 
        .CO(mult_31_n29), .S(mult_31_n30) );
  FA_X1 mult_31_U22 ( .A(mult_31_n32), .B(mult_31_n39), .CI(mult_31_n37), .CO(
        mult_31_n27), .S(mult_31_n28) );
  FA_X1 mult_31_U21 ( .A(mult_31_n35), .B(mult_31_n30), .CI(mult_31_n28), .CO(
        mult_31_n25), .S(mult_31_n26) );
  FA_X1 mult_31_U20 ( .A(mult_31_n94), .B(mult_31_n100), .CI(mult_31_n107), 
        .CO(mult_31_n23), .S(mult_31_n24) );
  FA_X1 mult_31_U19 ( .A(mult_31_n31), .B(mult_31_n87), .CI(mult_31_n24), .CO(
        mult_31_n21), .S(mult_31_n22) );
  FA_X1 mult_31_U18 ( .A(mult_31_n27), .B(mult_31_n29), .CI(mult_31_n22), .CO(
        mult_31_n19), .S(mult_31_n20) );
  FA_X1 mult_31_U17 ( .A(mult_31_n99), .B(mult_31_n93), .CI(mult_31_n86), .CO(
        mult_31_n17), .S(mult_31_n18) );
  FA_X1 mult_31_U16 ( .A(mult_31_n18), .B(mult_31_n23), .CI(mult_31_n21), .CO(
        mult_31_n15), .S(mult_31_n16) );
  FA_X1 mult_31_U8 ( .A(mult_31_n56), .B(mult_31_n65), .CI(mult_31_n8), .CO(
        mult_31_n7), .S(b0_w_6_) );
  FA_X1 mult_31_U7 ( .A(mult_31_n44), .B(mult_31_n55), .CI(mult_31_n7), .CO(
        mult_31_n6), .S(b0_w_7_) );
  FA_X1 mult_31_U6 ( .A(mult_31_n34), .B(mult_31_n43), .CI(mult_31_n6), .CO(
        mult_31_n5), .S(b0_w_8_) );
  FA_X1 mult_31_U5 ( .A(mult_31_n26), .B(mult_31_n33), .CI(mult_31_n5), .CO(
        mult_31_n4), .S(b0_w_9_) );
  FA_X1 mult_31_U4 ( .A(mult_31_n20), .B(mult_31_n25), .CI(mult_31_n4), .CO(
        mult_31_n3), .S(b0_w_10_) );
  FA_X1 mult_31_U3 ( .A(mult_31_n19), .B(mult_31_n16), .CI(mult_31_n3), .CO(
        mult_31_n2), .S(b0_w_11_) );
  AND2_X1 add_32_U2 ( .A1(ff_sh_0_), .A2(b0_w_6_), .ZN(add_32_n2) );
  XOR2_X1 add_32_U1 ( .A(ff_sh_0_), .B(b0_w_6_), .Z(DOUT_reg_in[0]) );
  FA_X1 add_32_U1_1 ( .A(b0_w_7_), .B(ff_sh_1_), .CI(add_32_n2), .CO(
        add_32_carry[2]), .S(DOUT_reg_in[1]) );
  FA_X1 add_32_U1_2 ( .A(b0_w_8_), .B(ff_sh_2_), .CI(add_32_carry[2]), .CO(
        add_32_carry[3]), .S(DOUT_reg_in[2]) );
  FA_X1 add_32_U1_3 ( .A(b0_w_9_), .B(ff_sh_3_), .CI(add_32_carry[3]), .CO(
        add_32_carry[4]), .S(DOUT_reg_in[3]) );
  FA_X1 add_32_U1_4 ( .A(b0_w_10_), .B(ff_sh_4_), .CI(add_32_carry[4]), .CO(
        add_32_carry[5]), .S(DOUT_reg_in[4]) );
  FA_X1 add_32_U1_5 ( .A(b0_w_11_), .B(ff_sh_5_), .CI(add_32_carry[5]), .CO(
        add_32_carry[6]), .S(DOUT_reg_in[5]) );
  FA_X1 add_32_U1_6 ( .A(b0_w_12_), .B(ff_sh_6_), .CI(add_32_carry[6]), .S(
        DOUT_reg_in[6]) );
endmodule

