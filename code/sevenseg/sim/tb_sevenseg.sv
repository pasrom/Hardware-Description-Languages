/*-------------------------------------
Project: Seven Segment
Purpose: Implement a Seven segment BCD
Author:  rpa2306
Version: 00, 12.12.2017
--------------------------------------*/

`define HORIZONTALA "\t#--------#"

module tb_sevenseg();

/* 
*	(1)	Create wires to connect the DUT
*	Like footprints for an IC on a PCB
*/
logic	[3:0]		bin;
logic	[6:0]		hex;
logic	[6:0]		hex_n;
/*
*	(2) Create an instance of the DUT
*/

sevenseg			DUT
// name of the moule	name of this instance of the module
(
//	IO connection syntax:
//	.pin name		(track name),
//	.bin				(bin),
//	.hex				(hex),
//	.hex_n				(hex_n)
	.*
);

/*
*	(3) Create stimuli for all inputs
*/

initial begin
// All initial blocks are started at simulation time = 0. Only used in the test bench
// Execution is line by line -> it's software!!!
	$display("---------------------------");
	$display("    tb_sevenseg started    ");
	$display("---------------------------");
	for (int i =0; i<$bits(bin)<<2;i++)begin // %(*\label{code:bitsLength}*)
		bin = i;
		#100ns; 	// wait for 100 ns
		$display("");
		$display("bin\thex\thex_n");
		$display("%b\t%b\t%b\n",bin, hex, hex_n);
		/* the next lines are only for nice displaying*/
		if (hex[0] ) begin	// %(*\label{code:startPlot}*)
			$display("%s",`HORIZONTALA);
		end else begin
			if(hex[5])begin
				$write("\t#        ");
			end else begin
				$write("\t         ");
			end
			if(hex[1])begin
				$write("#");
			end
			$display("");
		end
		for (int j = 0; j<2;j++) begin
			for (int n = 0; n < 4; n++)begin
				if (hex[4] && j==1 || hex[5] && j==0) begin
					$write("\t|");
				end else begin
					$write("\t ");
				end
				$write("        ");
				if (hex[1] && j==0 || hex[2] && j==1) begin
					$display("|");
				end else begin
					$display("");
				end
			end
			if (hex[6] && j==0 || hex[3] && j==1) begin
				$display("%s",`HORIZONTALA);
			end else begin
				if(hex[4] && j==1 || hex[5] && j==0)begin
					$write("\t#        ");
				end else begin
					$write("\t         ");
				end
				if(hex[1] && j==0 || hex[2] && j==1)begin
					$write("#");
				end
				$display("");
			end
		end	// %(*\label{code:endPlot}*)
	end
	$display("---------------------------");
	$display("   sb_sevenseg finished    ");
	$display("---------------------------");
end

endmodule