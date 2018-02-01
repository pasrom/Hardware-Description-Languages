/*---------------------------------------
Module:		state machine
Purpose: 	state machine
Author:		HHA
Date:		14.03.2016
---------------------------------------*/

module tb_statemachine ();
	logic		rst_n;
	logic       clk50m;
	
	logic       door;
	logic [3:0] coin;
	logic       new_coin;
	            
    logic       bottle;
    logic       unlock;
	
	enum logic [3:0] {E0, E1, E2, E3, E4, E5, E6, ENOUGH, CUSTOMER} state, state_new;
	
	statemachine	u1_statemachine (.*);
	
	logic run_sim = 1'b1;
	
	initial begin
		clk50m = 1'b0;
		while (run_sim) begin
			# 10ns;
			clk50m = !clk50m;
		end
	end
	
	initial begin
		rst_n = 1'b0;
		door = 1'b0;
		coin = 4'b0000;
		new_coin = 1'b0;
		
		# 100ns;
		rst_n = 1'b1;
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b0001;
		new_coin = 1'b1;
		@ (negedge clk50m);
		new_coin = 1'b0;
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b0001;
		new_coin = 1'b1;
		@ (negedge clk50m);
		new_coin = 1'b0;
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b0001;
		new_coin = 1'b1;
		@ (negedge clk50m);
		new_coin = 1'b0;
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b0010;
		new_coin = 1'b1;
		@ (negedge clk50m);
		new_coin = 1'b0;
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b0010;
		new_coin = 1'b1;
		@ (negedge clk50m);
		new_coin = 1'b0;
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b0000;
		new_coin = 1'b0;
		door = 1'b1;
		
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b0000;
		new_coin = 1'b0;
		door = 1'b0;
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b0011;
		new_coin = 1'b1;
		# 100ns;
		
		@ (negedge clk50m);
		coin = 4'b1010;
		new_coin = 1'b1;
		# 100ns;
		
		# 2000ns;
		run_sim = 1'b0;
	end
endmodule
		
		
		
		