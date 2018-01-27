/*-------------------------------------
Project:	Flip Flop (FF)
Purpose:	Demonstrate FFs
Author:		rpa2306
Version:	00, 14.12.2017
--------------------------------------*/
`timescale 10ns/10ns

module tb_flipflops();

// (1) Prepare DUT wiring

logic			rst_n;
logic			clk50m; 
logic			d;
logic			q;
logic			sin;
logic	[3:0]	sr;
logic	[3:0]	cnt;
logic			cnt_zero;

// (2) Instantiate the DUT

flipflops	dut (.*);

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
	rst_n = 1'b0;
	d = 1'b0;
	sin = 1'b0;
	$display("-----------------------");
	$display(" TB_FLIPFLOPS started  ");
	$display("-----------------------");
	
	#90ns;
	rst_n = 1'b1;
	$display("Power on Reset (POR)");
	
	#1us;
	$display("Stimulate the D-FF.");
	for(int i = 0; i < 2; i++) begin
		@ (negedge clk50m); // wait for negedge
		d= 1'b1;
		@ (negedge clk50m); // wait for negedge
		d= 1'b0;
	end
		
	#1us;
	$display("Stimulate the D-FF.");
	for(int i = 0; i < 4; i++) begin
		@ (negedge clk50m); // wait for negedge
		sin= 1'b1;
		@ (negedge clk50m); // wait for negedge
		sin= 1'b0;
	end
	
	#1us;
	run_sim = 1'b0; // stop clock generator
	
	$display("-----------------------");
	$display(" TB_FLIPFLOPS finished ");
	$display("-----------------------");
end

endmodule