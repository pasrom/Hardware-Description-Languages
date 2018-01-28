/*-------------------------------------
Project:    coffee_1058
Purpose:    
Author:     rpa2306
Version:    00, 01.27.2018
--------------------------------------*/

`timescale 1ns/1ns

module tb_coffee_1058();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic               rst_n;
logic               clk4m;
logic               cent20;
logic               cent50;
logic               euro01;
logic               stop_buy;
logic               coffee_ready;
logic               cup_out;
logic               prepare_coffee;
logic               green;
logic               return_cash;
logic               lock_slit;

/*
*   (2) Create an instance of the DUT
*/

coffee_1058                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

logic   run_sim = 1'b1;

initial begin
    clk4m = 1'b0;
    while (run_sim) begin
        #125ns;
        clk4m = !clk4m;
    end
end

`define in20Cents \
        @(negedge clk4m);\
        cent20 = 1'b1;\
        @(negedge clk4m);\
        cent20 = 1'b0;

`define in50Cents \
        @(negedge clk4m);\
        cent50 = 1'b1;\
        @(negedge clk4m);\
        cent50 = 1'b0;

`define in1Euro \
        @(negedge clk4m);\
        euro01 = 1'b1;\
        @(negedge clk4m);\
        euro01 = 1'b0;

`define ending \
        #50ns;\
        @(negedge clk4m);\
        coffee_ready = 1'b1;\
        #50ns;\
        @(negedge clk4m);\
        coffee_ready = 1'b0;\
        cup_out = 1'b1;\
        #50ns;\
        @(negedge clk4m);\
        cup_out = 1'b0;\

initial begin


    $display("---------------------------");
    $display("    coffee_1058 started    ");
    $display("---------------------------");
    rst_n           = 1'b0;
    cent20          = 1'b0;
    cent50          = 1'b0;
    euro01          = 1'b0;
    stop_buy        = 1'b0;
    coffee_ready    = 1'b0;
    cup_out         = 1'b0;

    @(negedge clk4m);
    rst_n  = 1'b1;

    // only with 20 cents
    cup_out         = 1'b0;
    repeat (3) begin    
        `in20Cents
    end
    
    `ending
    #50ns;

    // with 20 cents and 50 cents
    cup_out         = 1'b0;
    `in20Cents
    `in50Cents
    `ending

    // with 20 cents and 20 cents and break
    cup_out         = 1'b0;
    `in20Cents
    `in20Cents
    @(negedge clk4m);
    stop_buy = 1'b1;
    @(negedge clk4m);
    stop_buy = 1'b0;

    @(negedge clk4m);
    run_sim = 1'b0;

    $display("---------------------------");
    $display("   coffee_1058 finished    ");
    $display("---------------------------");

end
endmodule


