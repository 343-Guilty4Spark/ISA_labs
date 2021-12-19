//`timescale 1ns

module tb_fpmul ();
   
   parameter Nbit=32;
   wire CLK_i;
   wire [Nbit-1:0] DIN_i;
   wire [Nbit-1:0] DOUT_i;

   wire END_SIM_i;
   

	clk_gen CG(.CLK(CLK_i));

	data_maker SM(.CLK(CLK_i),
			.DATA(DIN_i));

	data_sink DS(.CLK(CLK_i),
		.DIN(DOUT_i));

	FPmul pipeline(
		.FP_A(DIN_i),
		.FP_B(DIN_i),
		.clk(CLK_i),
		.FP_Z(DOUT_i)
	);



endmodule
