// -------------------------------------------------------------
// 
// File Name: hdlsrc/deltasigma_code_gen/ds_dac_sl.v
// Created: 2018-01-12 13:19:31
// 
// Generated by MATLAB 9.3 and HDL Coder 3.11
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 2e-08
// Target subsystem base rate: 2e-08
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        2e-08
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// dout                          ce_out        2e-08
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: ds_dac_sl
// Source Path: deltasigma_code_gen/ds_dac_sl
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module ds_dac_sl
          (clk50m,
           rst_n,
           clk_enable,
           din,
           ce_out,
           dout);


  input   clk50m;
  input   rst_n;
  input   clk_enable;
  input   [15:0] din;  // uint16
  output  ce_out;
  output  dout;

  wire enb;
  wire signed [17:0] mid_range_out1;  // sfix18
  wire alpha1bit_DAC_relop1;
  wire dout_1;
  wire [15:0] fdbk;  // uint16
  wire signed [31:0] Sum2_sub_temp;  // sfix32
  wire signed [31:0] Sum2_1;  // sfix32
  wire signed [31:0] Sum2_2;  // sfix32
  wire signed [16:0] delta;  // sfix17
  reg signed [17:0] integ;  // sfix18
  wire signed [31:0] Sum1_add_temp;  // sfix32
  wire signed [31:0] Sum1_1;  // sfix32
  wire signed [31:0] Sum1_2;  // sfix32
  wire signed [17:0] integ_add;  // sfix18


  assign enb = clk_enable;

  assign mid_range_out1 = 18'sb001000000000000000;



  assign dout_1 = alpha1bit_DAC_relop1;

  assign fdbk = (dout_1 == 1'b1 ? 16'b1111111111111111 :
              16'b0000000000000000);



  assign Sum2_1 = {16'b0, din};
  assign Sum2_2 = {16'b0, fdbk};
  assign Sum2_sub_temp = Sum2_1 - Sum2_2;
  assign delta = Sum2_sub_temp[16:0];



  assign Sum1_1 = {{15{delta[16]}}, delta};
  assign Sum1_2 = {{14{integ[17]}}, integ};
  assign Sum1_add_temp = Sum1_1 + Sum1_2;
  assign integ_add = Sum1_add_temp[17:0];



  always @(posedge clk50m or negedge rst_n)
    begin : Integrator_process
      if (rst_n == 1'b0) begin
        integ <= 18'sb000000000000000000;
      end
      else begin
        if (enb) begin
          integ <= integ_add;
        end
      end
    end



  assign alpha1bit_DAC_relop1 = integ >= mid_range_out1;



  assign dout = alpha1bit_DAC_relop1;

  assign ce_out = clk_enable;

endmodule  // ds_dac_sl

