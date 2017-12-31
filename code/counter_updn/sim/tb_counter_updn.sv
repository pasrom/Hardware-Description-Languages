/*-------------------------------------
Project:	Up Down Cunter
Purpose:	Flexible up down counter
Author:		rpa2306
Version:	00, 31.12.2017
--------------------------------------*/
`timescale 10ns/10ns

module tb_counter_updn();

`define counterSize  6

// (1) Prepare DUT wiring

logic				rst_n;
logic				clk50m;
logic				en;
logic				down;
logic	[`counterSize-1:0]		cnt;

// (2) Instantiate the DUT

counter_updn #(.WIDTH (`counterSize))	dut (.*);

// (3) Create test stimuli
logic run_sim = 1'b1;

// all initial are running in parallel
initial begin
	clk50m = 1'b0;
	while (run_sim) begin
		#10ns;
		clk50m = !clk50m;
	end
end

initial begin
	automatic int cntSoftware = 0;
	automatic int cntHardware = 0;
	automatic int overflowCnt = 0;
	automatic int maxValue = 2 << (`counterSize-1);
	automatic int startValue = 0;
	automatic int countUp = 100;
	automatic int countDown = 200;
	
	rst_n = 1'b0;
	en =1'b0;
	down = 1'b0;

	$display("-------------------------");
	$display(" TB_COUNTER_UPDN started ");
	$display("-------------------------");
	$display("");
	
	#100ns;
	
	$display(" Check: en == 1'b1 and down == 1'b0\n");
	down = 1'b0;
	rst_n = 1'b1;
	@ (negedge clk50m); // wait for negedge
	en =1'b1;
	@ (negedge clk50m); // wait for negedge
	en =1'b0;
	rst_n = 1'b0;
	@ (negedge clk50m);
	
	#100ns;
	
	$display(" Check: en == 1'b1 and down == 1'b1\n");
	down = 1'b1;
	@ (negedge clk50m); // wait for negedge
	en =1'b1;
	rst_n = 1'b1;
	@ (negedge clk50m); // wait for negedge
	en =1'b0;
	rst_n = 1'b0;
	@ (negedge clk50m);
	
	#100ns;
	
	rst_n = 1'b1;
	down = 1'b0;
	en =1'b1;
	$display("--- Stimulate the up count for 100 ---\n");
	
	startValue = cnt;
	repeat (countUp) begin
		@ (negedge clk50m); // wait for negedge
		cntSoftware++;
		if (cnt == maxValue-1) begin
			overflowCnt++;
		end
	end

	en =1'b0;
	down = 1'b1;
	cntHardware = overflowCnt * maxValue + cnt + 1 - startValue;
	if (cntHardware == cntSoftware) begin									%(*\label{code: countUp testA}*)
		$display("---- Test passed with counting up: %d ----\n", countUp);
		end
	else begin
		$display("--- Test failed with counting up: %d ----", countUp);
		$display("---- cntHardware %d, cntSoftware %d -----\n", cntHardware, cntSoftware);
	end																		%(*\label{code: countUp testB}*)
	
	#100ns;
	cntSoftware = 0;
	overflowCnt = 0;
	startValue = cnt;
	@ (negedge clk50m);
	en =1'b1;
	$display("--- Stimulate the down count for 200 ---\n");
	repeat (countDown) begin
		@ (negedge clk50m); // wait for negedge
		cntSoftware++;
		if (cnt == 0) begin
			overflowCnt++;
		end
	end
	cntHardware = (overflowCnt- 1) * maxValue + maxValue - cnt + startValue;
	if (cntHardware == cntSoftware) begin										%(*\label{code: countDown testA}*)
		$display("---- Test passed with counting up: %d ----\n", countUp);
		end
	else begin
		$display("--- Test failed with counting up: %d ---", countDown);
		$display("---- cntHardware %d, cntSoftware %d ----\n", cntHardware, cntSoftware);
		$display("");
	end																			%(*\label{code: countDown testB}*)
	en =1'b0;
	rst_n = 1'b0;	
	run_sim = 1'b0; // stop clock generator
	
	$display("--------------------------");
	$display(" TB_COUNTER_UPDN finished ");
	$display("--------------------------");
end

endmodule