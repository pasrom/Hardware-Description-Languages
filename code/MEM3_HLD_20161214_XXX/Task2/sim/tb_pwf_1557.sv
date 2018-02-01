/*-------------------------------------
Project:    pwf_1557
Purpose:    
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

`timescale 10ns/10ns

module tb_pwf_1557();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic           rst_n;
logic           clk11m;
logic           g;
logic           i;

/*
*   (2) Create an instance of the DUT
*/

pwf_1557                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

logic run_sim = 1'b1;

initial begin: clk_gen
    clk11m = 1'b0;
    
    while(run_sim) begin
        #125ns;
        clk11m = !clk11m;
    end
end

initial begin

    $display("---------------------------");
    $display("    pwf_1557 started    ");
    $display("---------------------------");

    @(negedge clk11m);
    rst_n = 1'b0;
    g = 1'b0;
    #50ns;
    @(negedge clk11m);
    rst_n = 1'b1;
    #50ns;

    @(negedge clk11m);
    g = 1'b1;
    repeat (13) begin
        @(negedge clk11m);
    end
    @(negedge clk11m);
    g = 1'b0;

    #50ns;

    @(negedge clk11m);
    g = 1'b1;
    repeat (9) begin
        @(negedge clk11m);
    end
    @(negedge clk11m);
    g = 1'b0;

    run_sim = 1'b0;
    

    $display("---------------------------");
    $display("   pwf_1557 finished    ");
    $display("---------------------------");

end
endmodule


