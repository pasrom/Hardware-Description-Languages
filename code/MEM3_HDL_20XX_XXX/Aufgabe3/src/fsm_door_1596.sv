/*-------------------------------------
Project:    fsm_door_1596
Purpose:    
Author:     rpa2306
Version:    00, 01.28.2018
--------------------------------------*/

module fsm_door_1596 (
    input   logic       rst_n,
    input   logic       clk2m,
// Inputs
    input   logic       key_up,
    input   logic       key_down,
    input   logic       sense_up,
    input   logic       sense_down,
// Outputs
    output  logic       ml,
    output  logic       mr,
    output  logic       light_red,
    output  logic       light_green
);

enum logic [2:0] {IDLE, OPENING, CLOSING, OPENED, CLOSED, STOP}        state, state_new, state_old;

// --- FSM sequential part ------
always_ff @ (negedge rst_n or posedge clk2m) begin
    if(!rst_n) begin
        state <= IDLE;
        state_old <= state;
    end
    else begin
        state_old <= state;
        state <= state_new;
    end
end

// --- FSM combinatorial part ---
always_comb begin
    //default values
    state_new = state;
    ml  = 1'b0;
    mr  = 1'b0;
    light_red   = 1'b1;
    light_green = 1'b0;
    case (state)
        IDLE: begin
            if (sense_down) begin
                state_new = CLOSED;
            end else if (sense_up) begin
                state_new = OPENED;
            end 
        end

        OPENED: begin
            light_red   = 1'b0;
            light_green   = 1'b1;
            if (key_down) begin
                state_new = CLOSING;
            end
        end

        CLOSED: begin
            if (key_up) begin
                state_new = OPENING;
            end
        end

        OPENING: begin
            mr = 1'b1;
            if (sense_up) begin
                state_new = OPENED;
            end else if (key_down) begin
                state_new = STOP;
            end
        end

        CLOSING: begin
            ml = 1'b1;
            if (sense_down) begin
                state_new = CLOSED;
            end else if (key_up) begin
                state_new = STOP;
            end
        end

        STOP: begin
            case (state_old)
                OPENING: begin
                    state_new = CLOSING;
                end
                CLOSING: begin
                    state_new = OPENING;
                end
            endcase
        end
        default: begin
            state_new = IDLE;
        end
    endcase
end

endmodule
