/*-------------------------------------
Project:	Up Down Cunter
Purpose:	Flexible up down counter
Author:		rpa2306
Version:	00, 31.12.2017
--------------------------------------*/

module counter_updn #(parameter WIDTH=8)(
input	logic				rst_n,
input	logic				clk50m, // 50 Mhz Clock
input	logic				en,
input	logic				down,
output	logic	[WIDTH-1:0]	cnt // %(*\label{code: parameter width}*)
);

// --- n-bit counter up and down ---

always_ff @ (negedge rst_n or posedge clk50m) begin
	if(!rst_n) begin
		cnt <= 1'b0;
	end
	else if (en && !down) begin
		cnt <= cnt + 1'b1;
	end
	else if (en && down) begin
		cnt <= cnt - 1'b1;
	end
end

endmodule