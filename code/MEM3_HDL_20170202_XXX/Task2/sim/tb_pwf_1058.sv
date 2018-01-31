/*-------------------------------------
Project:    pwf_1058
Purpose:    
Author:     rpa2306
Version:    00, 01.26.2018
--------------------------------------*/

`timescale 1ns/1ns

module tb_pwf_1058();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic           rst_n;
logic           clk4m;
logic           a;
logic           c;

/*
*   (2) Create an instance of the DUT
*/

pwf_1058                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/
logic run_sim = 1'b1;

initial begin: clk_gen
    clk4m = 1'b0;
    
    while(run_sim) begin
        #125ns;
        clk4m = !clk4m;
    end
end

initial begin

    $display("---------------------------");
    $display("    pwf_1058 started    ");
    $display("---------------------------");

    @(negedge clk4m);
    rst_n = 1'b0;
    a = 1'b0;
    #50ns;
    @(negedge clk4m);
    rst_n = 1'b1;
    #50ns;

    @(negedge clk4m);
    a = 1'b1;
    repeat (12) begin
        @(negedge clk4m);
    end
    //#1000ns;
    @(negedge clk4m);
    a = 1'b0;

    @(negedge clk4m);
    a = 1'b1;
    repeat (9) begin
        @(negedge clk4m);
    end
    @(negedge clk4m);
    a = 1'b0;

    run_sim = 1'b0;
    $display("---------------------------");
    $display("   pwf_1058 finished    ");
    $display("---------------------------");

end
endmodule


