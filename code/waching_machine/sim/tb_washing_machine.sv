/*-------------------------------------------
Project		MEM3 HDL
Purpose		Implement a finite state machine
Autohr		rpa2306; 21.12.2017
Verion		v00
---------------------------------------------*/

module tb_washing_machine();

// (1) DUT wiring
logic				rst_n;
logic				clk50m;
//Inputs from sensors
logic				start;	//start a new washing cycle
logic				full;	//indicates the water level
logic				hot;	//water is warm
logic				clean;	//clothes are cleaned
logic				dry;	//clothes are dry
// Output to actuators
logic				door_lock;	//locks the door
logic				valve;		//water valve
logic				heater;		//heat up the water
logic				motor_wash;	//motor in wash mode
logic				motor_spin;	//motor in spin mode
logic				pump;		//pump water out of the machine

// (2) DUT instance
washing_machine dut(.*);

// (3) Stimulate DUT
logic	run_sim = 1'b1;
int		error_cnt = 0;

initial begin
	clk50m = 1'b0;
	while (run_sim) begin
		#10ns;
		clk50m = !clk50m;
	end
end

initial begin
	$display("--------------------------");
	$display("tb_waching_machine started");
	$display("--------------------------");
	rst_n	= 1'b0;
	start	= 1'b0;
	full	= 1'b0;
	hot		= 1'b0;
	clean	= 1'b0;
	dry		= 1'b0;
	#100ns;
	rst_n = 1'b1;
	#10ns;
	@(negedge clk50m);
	if(door_lock == 1'b1) begin
		error_cnt++;
		$display("FAIL: door_lock = 1'b1 after POR!");
	end
	
	//--- Set START -----
	@(negedge clk50m);
	start = 1'b1;
	@(negedge clk50m);
	start = 1'b0;
	if(door_lock == 1'b0) begin
		error_cnt++;
		$display("FAIL: door_lock = 1'b0 after START!");
	end
	//--- Set Start ----
	@(negedge clk50m);
	start = 1'b1;
	@(negedge clk50m);
	start = 1'b0;
	
	#10us;
	//--- Set FULL -----
	@(negedge clk50m);
	full = 1'b1;
	#10us;
	//--- Set HOT -----
	@(negedge clk50m);
	hot = 1'b1;
	@(negedge clk50m);
	hot = 1'b0;
	#10us;
	//--- Set CLEAN -----
	@(negedge clk50m);
	clean = 1'b1;
	@(negedge clk50m);
	clean = 1'b0;
	#10us;
	//--- Set DRY -----
	@(negedge clk50m);
	dry = 1'b1;
	@(negedge clk50m);
	dry = 1'b0;
	#10us;
	//--- Set FULL -----
	@(negedge clk50m);
	full = 1'b0;
	#1us;
	run_sim = 1'b0;
end

endmodule