/*-------------------------------------
Project:    coffee_1557
Purpose:    
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

module coffee_1557 (
input   logic               rst_n,
input   logic               clk11m,
//Inputs
input   logic               c50,
input   logic               e01,
input   logic               e02,
input   logic               machine_empty,
input   logic               coffee_ready,
input   logic               cup_out,
//Outputs
output  logic               prepare_coffee,
output  logic               green,
output  logic               flash_light,
output  logic               lock_slit
);

enum logic [2:0] {IDLE, CENT50, PREPARECOFFEE, COFFEEREADY, EMPTY}        state, state_new;

// --- FSM sequential part ------
always_ff @ (negedge rst_n or posedge clk11m) begin
    if(!rst_n) begin
        state <= IDLE;
    end
    else begin
        state <= state_new;
    end
end

// --- FSM combinatorial part ---
always_comb begin
    state_new       = state;
    prepare_coffee  = 1'b0;
    green           = 1'b0;
    lock_slit       = 1'b0;
    flash_light     = 1'b0;
    case (state)
        IDLE: begin
            if (machine_empty) begin
                state_new = EMPTY;
            end
            if (c50 && ~cup_out) begin
                state_new = CENT50;
            end else if ((e01 || e02) && ~cup_out) begin
                state_new = PREPARECOFFEE;
            end
        end
        CENT50: begin
            if (e01 || e02 || c50) begin
                state_new = PREPARECOFFEE;
            end
        end
        PREPARECOFFEE: begin
            lock_slit = 1'b1;
            prepare_coffee = 1'b1;
            if (coffee_ready) begin
                state_new = COFFEEREADY;
            end
        end
        COFFEEREADY: begin
            lock_slit = 1'b1;
            green = 1'b1;
            if (cup_out) begin
                state_new = IDLE;
            end
        end
        EMPTY: begin
            flash_light = clk11m;
            if (~machine_empty) begin
                state_new = IDLE; 
            end
        end
        default: begin
            if (~cup_out) begin
                state_new = IDLE;
            end
        end
    endcase
end

endmodule
