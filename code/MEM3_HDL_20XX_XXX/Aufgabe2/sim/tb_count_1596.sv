/*-------------------------------------
Project:    count_1596
Purpose:    
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

`timescale 10ns/10ns

module tb_count_1596();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic           clk5m;
logic           rst_n;
logic           en;
logic   [9:0]   data_in;
logic           load;
logic           updn;
logic   [9:0]   cnt;

/*
*   (2) Create an instance of the DUT
*/

count_1596                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

logic run_sim = 1'b1;

initial begin: clk_gen
    clk5m = 1'b0;
    
    while(run_sim) begin
        #100ns;
        clk5m = !clk5m;
    end
end

initial begin

    $display("---------------------------");
    $display("    count_1596 started    ");
    $display("---------------------------");

    @(negedge clk5m);
    rst_n = 1'b0;
    @(negedge clk5m);
    rst_n = 1'b1;
    updn = 1'b0;
    load = 1'b0;
    en = 1'b1;

    // count up
    repeat(10) begin
        @(negedge clk5m);
    end
    // count down
    updn = 1'b1;
    repeat(5) begin
        @(negedge clk5m);
    end

    // enable function
    en = 1'b0;
    repeat(5) begin
        @(negedge clk5m);
    end

    @(negedge clk5m);
    data_in = 1023;
    load = 1'b1;
    @(negedge clk5m);
    load = 1'b0;
    @(negedge clk5m);
    en = 1'b1;

    repeat(5) begin
        @(negedge clk5m);
    end

    run_sim = 1'b0;

    $display("---------------------------");
    $display("   count_1596 finished    ");
    $display("---------------------------");

end
endmodule


