/*-------------------------------------
Project:    door_1315
Purpose:    
Author:     Passler
Version:    00, 01.02.2018
--------------------------------------*/

`timescale 10ns/10ns

module tb_door_1315();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

    logic       rst_n;
    logic       clk;
    logic       buttonup;
    logic       buttondown;
    logic       sensortop;
    logic       sensorbottom;
    logic       lightbarrier;
    logic       motorleft;
    logic       motorright;
    logic       lightsteady;
    logic       lightflash;

/*
*   (2) Create an instance of the DUT
*/

door_1315                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

logic   run_sim = 1'b1;

initial begin
    clk = 1'b0;
    while (run_sim) begin
        #100ns;
        clk = !clk;
    end
end

`define pressedUp \
        @(negedge clk);\
        buttonup = 1'b1;\
        @(negedge clk);\
        buttonup = 1'b0;\
        sensorbottom = 1'b0;

`define pressedDown \
        @(negedge clk);\
        buttondown = 1'b1;\
        @(negedge clk);\
        buttondown = 1'b0;\
        sensortop = 1'b0;\

`define reset \
        @(negedge clk);\
        rst_n = 1'b0;\
        @(negedge clk);\
        rst_n = 1'b1;\

`define lightb \
        @(negedge clk);\
        lightbarrier = 1'b0;\
        @(negedge clk);\
        lightbarrier = 1'b1;\

initial begin

    $display("---------------------------");
    $display("    door_1315 started    ");
    $display("---------------------------");

    rst_n = 1'b0;
    buttonup = 1'b0;
    buttondown = 1'b0;
    sensorbottom = 1'b0;
    sensortop = 1'b0;
    lightbarrier = 1'b0;

    @(negedge clk);
    `reset
    #400ns;
    // opened
    @(negedge clk);
    sensortop = 1'b1;

    `pressedDown
    #400ns;
    // closed
    @(negedge clk);
    sensorbottom = 1'b1;

    `pressedUp
    #400ns;
    // opened
    @(negedge clk);
    sensortop = 1'b1;

    `pressedDown
    #400ns;
    // check lightbarrier
    @(negedge clk);
    lightbarrier = 1'b1;
    #400ns;
    @(negedge clk);
    lightbarrier = 1'b0;

    // press again down
    `pressedDown
    #400ns;
    `pressedUp

    #400ns
    // press again up
    @(negedge clk);
    sensortop = 1'b1;
    #400ns

    $display("---------------------------");
    $display("   door_1315 finished    ");
    $display("---------------------------");

    run_sim = 1'b0;

end
endmodule


