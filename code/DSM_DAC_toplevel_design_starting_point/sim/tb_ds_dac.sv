/* ----------------------------------------
Project : DS DAC
Purpose : Show operation of a delta sigma dac
Author  : ANM
Date    : 25.11.2017
------------------------------------------- */
`timescale 10ns/10ns

module tb_ds_dac();

// (1) DUT wiring
    logic               rst_n;
    logic               clk50m;
    logic [15:0]        din;
    logic               dout;

// (2) DUT instance
    ds_dac      dut(.*);

// (3) Test pattern
    logic run_sim = 1'b1;
    string action;
    
    initial begin : clk_gen
        clk50m = 1'b1;
        while (run_sim) begin
            #10ns;
            clk50m = !clk50m;
        end
    end
    
    initial begin : stimuli
        action = "init";
        $display("%s", action);
        rst_n = 1'b0;
        din   = '0;
        #90ns;
        rst_n = 1'b1;
        action = "por";
        $display("%s", action);
        #1us;
        action = "din1000";
        $display("%s", action);
        din = 16'd1000;
        
        #100us;
        run_sim = 1'b0;
    end

endmodule