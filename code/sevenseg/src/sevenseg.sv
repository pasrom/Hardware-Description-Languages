/*-------------------------------------
Project: Seven Segment
Purpose: Implement a Seven segment BCD
Author:  rpa2306
Version: 00, 11.12.2017
				A
			#--------#
			|        |
		F	|        |	B
			|        |
			|   G    |
			#--------#
			|        |
			|        |	C
		E	|        |
			|        |
			#--------#
				D
--------------------------------------*/

module sevenseg(
// Descibe the IO of the module
	input	logic	[3:0] bin,
	output	logic	[6:0] hex,
	output	logic	[6:0] hex_n
	// no comma after the last entry!
);



always_comb begin
	case (bin)
			4'h0 : hex = 7'b011_1111;	// 0
			4'h1 : hex = 7'b000_0110;	// 1
			4'h2 : hex = 7'b101_1011;	// 2
			4'h3 : hex = 7'b100_1111;	// 3
			4'h4 : hex = 7'b110_0110;	// 4
			4'h5 : hex = 7'b110_1101;	// 5
			4'h6 : hex = 7'b111_1101;	// 6
			4'h7 : hex = 7'b000_0111;	// 7
			4'h8 : hex = 7'b111_1111;	// 8
			4'h9 : hex = 7'b110_1111;	// 9
			4'ha : hex = 7'b111_0111;	// A
			4'hb : hex = 7'b111_1100;	// B
			4'hc : hex = 7'b011_1001;	// C
			4'hd : hex = 7'b101_1110;	// D
			4'he : hex = 7'b111_1001;	// E
			4'hf : hex = 7'b111_0001;	// F
			default: hex = 7'b000_000;
	endcase
	assign hex_n = ~hex;
end

endmodule