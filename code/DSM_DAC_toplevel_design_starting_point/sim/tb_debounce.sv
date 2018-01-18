`timescale 1ns/1ns
`include "debounce.sh"
module tb_debounce();

    //(1) DUT wiring
    logic           rst_n;
    logic           clk50m;
    logic           sw;
    logic           sw_hi;
    logic           sw_lo;
    logic           sw_dbnc;
    
    // (2) DUT instance
    debounce dut (.*);
    
    // (3) DUT stimuli
    logic run_sim = 1'b1;
    string action = "init";
    
    initial begin : clk_gen
        clk50m = 1'b1;
        while(run_sim) begin
            #10ns;
            clk50m = ~clk50m;
        end
    end
    
    initial begin : stimuli
        $display("-------------------------------");
        $display("TB_prescaler started.");
        rst_n = 1'b0;
        sw = 1'b0;
        $display("%s",action);
        #99ns;
        action = "por";
        $display("%s",action);
        rst_n = 1'b1;
        
        @ (negedge clk50m)
        action = "sw action";
        $display("%s",action);
        repeat(10) @(negedge clk50m);
        sw = 1'b1;
        repeat(5) @(negedge clk50m);
        sw = 1'b0;
        repeat(1) @(negedge clk50m);
        sw = 1'b1;
        repeat(3) @(negedge clk50m);
        sw = 1'b0;
        repeat(5) @(negedge clk50m);
        sw = 1'b1;
        repeat(2) @(negedge clk50m);
        sw = 1'b0;
        repeat(19) @(negedge clk50m);
        sw = 1'b1;
        repeat(16) @(negedge clk50m);
        sw = 1'b0;
        
        #1us;
        run_sim = 1'b0;
        action = "stop";
        $display("%s",action);
        $display("TB_prescaler finished.");
        $display("-------------------------------");
        end
    
    // (4) Checker (if any)

endmodule