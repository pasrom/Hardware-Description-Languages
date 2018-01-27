/*-------------------------------------------
Project		MEM3 HDL
Purpose		Implement a finite state machine
Autohr		rpa2306, 21.12.2017
Verion		v00
---------------------------------------------*/
module washing_machine(
	input	logic				rst_n,
	input	logic				clk50m,
//Inputs from sensors
	input	logic				start,	//start a new washing cycle
	input	logic				full,	//indicates the water level
	input	logic				hot,	//water is warm
	input	logic				clean,	//clothes are cleaned
	input	logic				dry,	//clothes are dry
// Output to actuators
	output	logic				door_lock,	//locks the door
	output	logic				valve,		//water valve
	output	logic				heater,		//heat up the water
	output	logic				motor_wash,	//motor in wash mode
	output	logic				motor_spin,	//motor in spin mode
	output	logic				pump		//pump water out of the machine
);

enum logic [2:0] {IDLE, H2O, WARM, WASH, SPIN, PUMP}		state, state_new;

// --- FSM sequential part ------
always_ff @ (negedge rst_n or posedge clk50m) begin
	if(!rst_n) begin
		state <= IDLE;
	end
	else begin
		state <= state_new;
	end
end

// --- FSM combinatorial part ---
always_comb begin
	//default values
	state_new = state;
	door_lock	= 1'b0;
	valve		= 1'b0;
	heater		= 1'b0;
	motor_wash	= 1'b0;
	motor_spin	= 1'b0;
	pump		= 1'b0;
	case (state)
		IDLE: begin
			// (1) define outputs
			// all outputs are at there default value
			// (2) define transitions
			if (start) begin
				state_new = H2O;
			end
		end
		//-----------------------
		H2O: begin
			valve = 1'b1;
			door_lock = 1'b1;
			if (full) begin
				state_new = WARM;
			end
		end
		//-----------------------
		WARM: begin
			heater = 1'b1;
			door_lock = 1'b1;
			if (hot) begin
				state_new = WASH;
			end
		end
		//-----------------------
		WASH: begin
			motor_wash = 1'b1;
			door_lock = 1'b1;
			if (clean) begin
				state_new = SPIN;
			end
		end
		//-----------------------
		SPIN: begin
			motor_spin = 1'b1;
			door_lock = 1'b1;
			if (dry) begin
				state_new = PUMP;
			end
		end
		//-----------------------
		PUMP: begin
			pump = 1'b1;
			door_lock = 1'b1;
			if (!full) begin
				state_new = IDLE;
			end
		end
		//-----------------------
		default : begin
			state_new = PUMP;
		end
	endcase
	
end

endmodule