/*-------------------------------------
Project:    coffee_1058
Purpose:    
Author:     rpa2306
Version:    00, 01.27.2018
--------------------------------------*/

module coffee_1058 (
    input   logic               rst_n,
    input   logic               clk4m,
    //Inputs
    input   logic               cent20,
    input   logic               cent50,
    input   logic               euro01,
    input   logic               stop_buy,
    input   logic               coffee_ready,
    input   logic               cup_out,
    //Outputs
    output  logic               prepare_coffee,
    output  logic               green,
    output  logic               return_cash,
    output  logic               lock_slit
);

enum logic [2:0] {IDLE, CENT20, CENT40, PREPARECOFFEE, COFFEEREADY, RETURN}        state, state_new;

// --- FSM sequential part ------
always_ff @ (negedge rst_n or posedge clk4m) begin
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
    return_cash     = 1'b0;
    lock_slit       = 1'b0;
    case (state)
        IDLE: begin
            if (cent20 && ~cup_out) begin
                state_new = CENT20;
            end else if ((cent50 || euro01)&&~cup_out) begin
                state_new = PREPARECOFFEE;
            end
        end
        CENT20: begin
            if (cent20) begin
                state_new = CENT40;
            end else if (cent50 || euro01) begin
                state_new = PREPARECOFFEE;
            end else if (stop_buy) begin
                state_new = RETURN;
            end
        end
        CENT40: begin
            if (cent20 || cent50 || euro01) begin
                state_new = PREPARECOFFEE;
            end else if (stop_buy) begin
                state_new = RETURN;
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
        RETURN: begin
            return_cash = 1'b1;
            state_new = IDLE;
        end
        default: begin
            if (~cup_out) begin
                state_new = IDLE;
            end
        end
    endcase
end

endmodule
