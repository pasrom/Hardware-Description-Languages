/*-------------------------------------
Project:    fsm_door_1596
Purpose:    
Author:     rpa2306
Version:    00; 01.28.2018
--------------------------------------*/

`timescale 10ns/10ns

module tb_fsm_door_1596();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic       rst_n;
logic       clk2m;
logic       key_up;
logic       key_down;
logic       sense_up;
logic       sense_down;
logic       ml;
logic       mr;
logic       light_red;
logic       light_green;

/*
*   (2) Create an instance of the DUT
*/

fsm_door_1596                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

logic   run_sim = 1'b1;

initial begin
    clk2m = 1'b0;
    while (run_sim) begin
        #250ns;
        clk2m = !clk2m;
    end
end

`define pressedUp \
        @(negedge clk2m);\
        key_up = 1'b1;\
        @(negedge clk2m);\
        key_up = 1'b0;\
        sense_down = 1'b0;

`define pressedDown \
        @(negedge clk2m);\
        key_down = 1'b1;\
        @(negedge clk2m);\
        key_down = 1'b0;\
        sense_up = 1'b0;

`define reset \
        @(negedge clk2m);\
        rst_n = 1'b0;\
        @(negedge clk2m);\
        rst_n = 1'b1;\

initial begin

    $display("---------------------------");
    $display("    fsm_door_1596 started    ");
    $display("---------------------------");

    rst_n = 1'b0;
    clk2m = 1'b0;
    key_up = 1'b0;
    key_down = 1'b0;
    sense_up = 1'b0;
    sense_down = 1'b0;
    @(negedge clk2m);
    `reset

    // define state closed as start
    @(negedge clk2m);
    sense_down = 1'b1;
    #50ns;
    // opening
    `pressedUp
    #1000ns;
    @(negedge clk2m);
    sense_up = 1'b1;

    // closing
    `pressedDown
    #1000ns;
    @(negedge clk2m);
    sense_down = 1'b1;
    #500ns;
    // opening
    `pressedUp
    #1000ns;
    // and closing again
    `pressedDown
    #500ns;
    @(negedge clk2m);
    sense_down = 1'b1;

    @(negedge clk2m);
    run_sim = 1'b0;
    $display("---------------------------");
    $display("   fsm_door_1596 finished    ");
    $display("---------------------------");

end
endmodule


