/*-------------------------------------
Project:    door_1315
Purpose:    
Author:     Passler
Version:    00, 01.02.2018
--------------------------------------*/

module door_1315 (
    input   logic       rst_n,
    input   logic       clk,
// Inputs
    input   logic       buttonup,
    input   logic       buttondown,
    input   logic       sensortop,
    input   logic       sensorbottom,
    input   logic       lightbarrier,
// Outputs
    output  logic       motorleft,
    output  logic       motorright,
    output  logic       lightsteady,
    output  logic       lightflash
);

enum logic [2:0] {START, UP, DOWN, OPEN, CLOSED, STOP}        state, state_new;

// --- FSM sequential part ------
always_ff @ (negedge rst_n or posedge clk) begin
    if(!rst_n) begin
        state <= START;
    end
    else begin
        state <= state_new;
    end
end

// --- FSM combinatorial part ---
always_comb begin
    //default values
    state_new = state;
    motorleft  = 1'b0;
    motorright  = 1'b0;
    lightsteady   = 1'b0;
    lightflash = 1'b0;
    case (state)
        START: begin
            state_new = UP;
            lightflash = 1'b1; 
            lightsteady = 1'b1;
        end

        OPEN: begin
            lightsteady   = 1'b1;
            if (buttondown) begin
                state_new = DOWN;
            end
        end

        CLOSED: begin
            if (buttonup) begin
                state_new = UP;
            end
        end

        UP: begin
            lightflash = 1'b1; 
            motorleft = 1'b1;
            if (sensortop) begin
                state_new = OPEN;
            // up driving wins!
            end else if (buttondown && !lightbarrier && !buttonup) begin
                state_new = DOWN;
            end
        end

        DOWN: begin
            lightflash = 1'b1; 
            motorright = 1'b1;
            if (sensorbottom) begin
                state_new = CLOSED;
            end else if (buttonup || lightbarrier) begin
                state_new = UP;
            end
        end

        default: begin
            state_new = START;
        end
    endcase
end

endmodule
