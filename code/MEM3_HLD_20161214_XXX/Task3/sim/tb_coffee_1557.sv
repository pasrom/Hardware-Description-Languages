/*-------------------------------------
Project:    coffee_1557
Purpose:    
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

`timescale 1ns/1ns

module tb_coffee_1557();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic               rst_n;
logic               clk11m;
logic               c50;
logic               e01;
logic               e02;
logic               machine_empty;
logic               coffee_ready;
logic               cup_out;
logic               prepare_coffee;
logic               green;
logic               flash_light;
logic               lock_slit;

/*
*   (2) Create an instance of the DUT
*/

coffee_1557                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

logic   run_sim = 1'b1;
`define time 1/11/2*1000

initial begin
    clk11m = 1'b0;
    while (run_sim) begin
        #45ns;
        clk11m = !clk11m;
    end
end

`define in50Cents \
        @(negedge clk11m);\
        c50 = 1'b1;\
        @(negedge clk11m);\
        c50 = 1'b0;

`define in1Euro \
        @(negedge clk11m);\
        e01 = 1'b1;\
        @(negedge clk11m);\
        e01 = 1'b0;

`define in2Euro \
        @(negedge clk11m);\
        e02 = 1'b1;\
        @(negedge clk11m);\
        e02 = 1'b0;

`define ending \
        #50ns;\
        @(negedge clk11m);\
        coffee_ready = 1'b1;\
        #50ns;\
        @(negedge clk11m);\
        coffee_ready = 1'b0;\
        cup_out = 1'b1;\
        #50ns;\
        @(negedge clk11m);\
        cup_out = 1'b0;\

initial begin

    $display("---------------------------");
    $display("    coffee_1557 started    ");
    $display("---------------------------");

    rst_n           = 1'b0;
    c50             = 1'b0;
    e01             = 1'b0;
    e02             = 1'b0;
    machine_empty   = 1'b0;
    coffee_ready    = 1'b0;
    cup_out         = 1'b0;

    @(negedge clk11m);
    rst_n  = 1'b1;

    // only with 20 cents
    cup_out         = 1'b0;
    repeat (2) begin    
        `in50Cents
    end
    
    `ending
    #50ns;

    // with 20 cents and 50 cents
    cup_out         = 1'b0;
    `in50Cents
    `in50Cents
    `ending

    // with 20 cents and 20 cents and break
    cup_out         = 1'b0;
    `in50Cents
    `in1Euro
    `ending
    @(negedge clk11m);
    machine_empty = 1'b1;
    repeat (10) begin 
        @(negedge clk11m);
    end
    machine_empty = 1'b0;

    @(negedge clk11m);
    run_sim = 1'b0;


    $display("---------------------------");
    $display("   coffee_1557 finished    ");
    $display("---------------------------");

end
endmodule


