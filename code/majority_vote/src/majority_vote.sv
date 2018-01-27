/*-------------------------------------
Project: Intro diital desing
Purpose: Implement a 3:1 majority voter
Author:  rpa2306
Version: 00, 07.12.2017
--------------------------------------*/

module majority_vote(
// Descibe the IO of the module
	input	logic	x0,
	input	logic	x1,
	input	logic	x2,
	output	logic	y_assign,
	output	logic	y_case,
	output	logic	y_if
	// no comma after the last entry!
);

/* now implement the logic */
/* Possibility #1 -> define the output by the boolean equation */
assign y_assign = (!x2&&x1&&x0) || (x2&&!x1&&x0) ||(x2&&x1&&!x0) || (x2&&x1&&x0);

/* Possibility #2 -> use a more abstract description */
logic [2:0]		xbus;
assign xbus = {x2,x1,x0};	// connect the three inputs to the bus
							// {MSB,LSB}
always_comb begin
/* Combinatorial logic -> output depends only on the inputs */
	y_case = 1'b0;
	case (xbus)
	/* Inside of the always_comb block high levee programming style is used */
	/* this goes into the synthesis tool and makes the description as Possibility #1 */
			3'b000 : y_case = 1'b0;
			3'b001 : y_case = 1'b0;
			3'b010 : y_case = 1'b0;
			3'b011 : y_case = 1'b1;
			3'b100 : y_case = 1'b0;
			3'b101 : y_case = 1'b1;
			3'b110 : y_case = 1'b1;
			3'b111 : y_case = 1'b1;
			default: y_case = 1'b0;
	endcase
end

always_comb begin
	y_if = 1'b0;	// default value
	if (xbus == 3'b011) begin
		y_if = 1'b1;
	end
	else if (xbus == 3'b101) begin
		y_if = 1'b1;
	end
	else if (xbus == 3'b110) begin
		y_if = 1'b1;
	end
	else if (xbus == 3'b111) begin
		y_if = 1'b1;
	end
end

endmodule