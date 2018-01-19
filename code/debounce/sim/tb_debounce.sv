/*-------------------------------------
Project:    debounce
Purpose:    
Author:     rpa2306
Version:    00, 01.06.2018
--------------------------------------*/

module tb_debounce();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic       rst_n;
logic       clk50m;
logic       sw;

logic       sw_hi;
logic       sw_lo;
logic       sw_dbnc;

/*
*   (2) Create an instance of the DUT
*/

tb_debounce                 DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

logic run_sim = 1'b1;

initial begin: clk_gen
    clk50m = 1'b0;
    
    while(run_sim) begin
        #10ns;
        clk50m = !clk50m;
    end
end

initial begin

    $display("---------------------------");
    $display("    debounce started    ");
    $display("---------------------------");

    @(negedge clk50m);
    rst_n = 1'b0;
    sw = 1'b0;
    #50ns;
    @(negedge clk50m);
    rst_n = 1'b1;
    #50ns;
    
    @(negedge clk50m);
    sw = 1'b0;
    repeat (10) begin
            @ (posedge clk50m);
    end
    #50ns;
    @(negedge clk50m);
	sw = 1'b1;
    
    repeat (5) begin
            @ (posedge clk50m);
    end
    @ (negedge clk50m);
    sw = 1'b0;
    //@ (posedge clk50m);

    @ (negedge clk50m);
    sw = 1'b1;
    repeat (3) begin
            @ (posedge clk50m);
    end

    @(negedge clk50m);
    sw = 1'b0;
    repeat (5) begin
            @ (posedge clk50m);
    end

    @ (negedge clk50m);
    sw = 1'b1;
    repeat (2) begin
            @ (posedge clk50m);
    end

    @ (negedge clk50m);
    sw = 1'b0;

    repeat (8) begin
            @ (posedge clk50m);
    end

    #200ns;

    @ (negedge clk50m);
    sw = 1'b1;

    repeat (8) begin
            @ (posedge clk50m);
    end

    #200ns;


    @ (negedge clk50m);
    sw = 1'b0;

    repeat (8) begin
            @ (posedge clk50m);
    end

    #50ns;
    @ (negedge clk50m);
	run_sim = 0;
    rst_n = 1'b0;
    $display("---------------------------");
    $display("   debounce finished    ");
    $display("---------------------------");

end
endmodule


