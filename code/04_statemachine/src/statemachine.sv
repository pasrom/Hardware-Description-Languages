/*---------------------------------------
Module:		state machine
Purpose: 	state machine
Author:		HHA
Date:		14.03.2016
---------------------------------------*/

module statemachine(
	input logic			rst_n,
	input logic			clk50m,
	input logic			door,
	input logic [3:0]	coin,
	input logic 		new_coin,
	
	output logic		bottle,
	output logic		unlock
	);
	
	enum logic [3:0] {E0, E1, E2, E3, E4, E5, E6, ENOUGH, CUSTOMER} state, state_new;

	always_ff @ (negedge rst_n or posedge clk50m) begin
		if (!rst_n) begin
			state <= E0;
		end
		else begin
			state <= state_new;
		end
	end
	
	always_comb begin
		//state_new = state;
		case (state)
			E0 : begin
				bottle = 0;
				unlock = 0;
			
				if (new_coin) begin
					if (coin == 4'b0001)
						state_new = E1;
					else if (coin == 4'b0010)
						state_new = E2;	
					else if (coin == 4'b0101)
						state_new = E5;
					else if (coin == 4'b1010)
						state_new = ENOUGH;
					else
						state_new = state;
				end
				else
					state_new = state;
			end	
			E1 : begin
				bottle = 0;
				unlock = 0;
			
				if (new_coin) begin
					if (coin == 4'b0001)
						state_new = E2;
					else if (coin == 4'b0010)
						state_new = E3;	
					else if (coin == 4'b0101)
						state_new = E6;
					else if (coin == 4'b1010)
						state_new = ENOUGH;
					else
						state_new = state;
				end	
				else
					state_new = state;
			end	
			E2 : begin
				bottle = 0;
				unlock = 0;
			
				if (new_coin) begin
					if (coin == 4'b0001)
						state_new = E3;
					else if (coin == 4'b0010)
						state_new = E4;	
					else if (coin == 4'b0101)
						state_new = ENOUGH;
					else if (coin == 4'b1010)
						state_new = ENOUGH;
					else
						state_new = state;
				end
				else
					state_new = state;
			end	
			E3 : begin
				bottle = 0;
				unlock = 0;
			
				if (new_coin) begin
					if (coin == 4'b0001)
						state_new = E4;
					else if (coin == 4'b0010)
						state_new = E5;	
					else if (coin == 4'b0101)
						state_new = ENOUGH;
					else if (coin == 4'b1010)
						state_new = ENOUGH;
					else
						state_new = state;
				end	
				else
					state_new = state;
			end	
			E4 : begin
				bottle = 0;
				unlock = 0;
			
				if (new_coin) begin
					if (coin == 4'b0001)
						state_new = E5;
					else if (coin == 4'b0010)
						state_new = E6;	
					else if (coin == 4'b0101)
						state_new = ENOUGH;
					else if (coin == 4'b1010)
						state_new = ENOUGH;
					else
						state_new = state;
				end
				else
					state_new = state;
			end	
			E5 : begin
				bottle = 0;
				unlock = 0;
			
				if (new_coin) begin
					if (coin == 4'b0001)
						state_new = E6;
					else if (coin == 4'b0010)
						state_new = ENOUGH;	
					else if (coin == 4'b0101)
						state_new = ENOUGH;
					else if (coin == 4'b1010)
						state_new = ENOUGH;
					else
						state_new = state;
				end	
				else
					state_new = state;
			end
			E6 : begin
				bottle = 0;
				unlock = 0;
			
				if (new_coin) begin
					if (coin == 4'b0001)
						state_new = ENOUGH;
					else if (coin == 4'b0010)
						state_new = ENOUGH;	
					else if (coin == 4'b0101)
						state_new = ENOUGH;
					else if (coin == 4'b1010)
						state_new = ENOUGH;
					else
						state_new = state;
				end
				else
					state_new = state;
			end	
			ENOUGH : begin
				bottle = 1;
				unlock = 1;
			
				if (door == 1)
					state_new = CUSTOMER;
				else
					state_new = state;
			end	
			CUSTOMER : begin
				bottle = 1;
				unlock = 1;
				
				if (door == 0)
					state_new = E0;
				else
					state_new = state;
			end
			default : begin
				bottle = 0;
				unlock = 0;
				
				state_new = E0;
			end		
		endcase
	end
endmodule	
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					