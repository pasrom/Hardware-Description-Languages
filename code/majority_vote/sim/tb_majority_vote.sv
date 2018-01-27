/*-------------------------------------
Project: Intro diital desing
Purpose: Implement a 3:1 majority voter
Author:  rpa2306
Version: 00, 07.12.2017
--------------------------------------*/

module tb_majority_vote(
// -> A B has no IO!
);

/* 
*	(1)	Create wires to connect the DUT
*	Like footprints for an IC on a PCB
*/
logic	x0;
logic	x1;
logic	x2;
logic	y_assign;
logic	y_case;
logic	y_if;

/*
*	(2) Create an instance of the DUT
*/

majority_vote			u1_majiority_vote
// name of the moule	name of this instance of the module
(
//	IO connection syntax:
//	.pin name		(track name),
	.x0				(x0),
	.x1				(x1),
	.x2				(x2),
	.y_assign		(y_assign),
	.y_case			(y_case),
	.y_if			(y_if)
);

/*
* -> short cut: use '.*' to connect
* all pins and tracks with the same name.
*/

/*
*	(3) Create stimuli for all inputs
*/

initial begin
// All initial blocks are started at simulation time = 0. Only used in the test bench
// Execution is line by line -> it's software!!!
$display("---------------------------");
$display(" tb_majority_vote started ");
$display("---------------------------");
$display("Set all inputs to zero.");
$display("x2\tx1\tx0\t|y_assign\t|y_case|\ty_if");
	for (int i=0; i<8;i++)begin
		/* we make a bus again */
		{x2,x1,x0} = i;
		#10ns;
		$display("%d\t%d\t%d\t|%d\t  |%d\t  |%d\t",x2,x1,x0,y_assign,y_case,y_if);
		#100ns; 	// wait for 100 ns
	end
end

endmodule