/*-------------------------------------
Project:	Flip Flop (FF)
Purpose:	Demonstrate FFs
Author:		rpa2306
Version:	00, 14.12.2017
--------------------------------------*/

module flipflops(
input	logic			rst_n,
input	logic			clk50m, // 50 Mhz Clock
input	logic			d,
output	logic			q,
input	logic			sin,
output	logic	[3:0]	sr,
output	logic	[3:0]	cnt,
output	logic			cnt_zero
);

// --- Here's how you can describe a D-FF ---
// --> Use this as a TEMPLATE !!!

always_ff @ (negedge rst_n or posedge clk50m) begin
// --> Clock active edge = posedge
// --> Active low reset

// (1) Async inputs
	if(!rst_n) begin
		q <= 1'b0;
	end
// (2) Sync behavior (i.e. what should happen at an active edge)
	else begin
		q <= d;
	end
end

// --- Shift register ---

always_ff @ (negedge rst_n or posedge clk50m) begin
	if(!rst_n) begin
		sr <= 1'b0000;
		// sr <= 4'd0;
		// sr <= 4'h0;
		// sr <= '0; //(all zero)
	end
	else begin
		sr <= {sr[2:0], sin};
	end
end

// --- 4bit count down from 9 ---

always_ff @ (negedge rst_n or posedge clk50m) begin
	if(!rst_n) begin
		cnt <= 4'd9;
		cnt_zero <= 1'b0;
	end
	else if (cnt > 0) begin
		cnt <= cnt - 4'd1;
		cnt_zero <= 1'b0;
	end
	else begin
		cnt <= 4'd9;
		cnt_zero <= 1'b1;
	end
end

endmodule