/*-------------------------------------
Project:    ds_dac_sl
Purpose:    
Author:     rpa2306
Version:    00, 01.12.2018
--------------------------------------*/

`timescale 10ns/10ns


module tb_ds_dac_sl();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic   clk50m;
logic   rst_n;
logic   clk_enable;
logic   [15:0] din;
logic   ce_out;
logic   dout;

/*
*   (2) Create an instance of the DUT
*/

ds_dac_sl                          DUT (.*);

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
    automatic int cntSoftware = 0;
    automatic int offset = 1000;
    automatic int sinus = 0;
    $display("---------------------------");
    $display("    ds_dac_sl started      ");
    $display("---------------------------");

    rst_n = 1'b0;
    clk_enable = 1'b0;
    din = 16'b0;
    #50ns;
    rst_n = 1'b1;
    clk_enable = 1'b1;
    #50ns;
    //din = $sin(3.14);//16'b1111111111;
    repeat (2000*100) begin
        @ (negedge clk50m); // wait for negedge
        cntSoftware++;
        if (cntSoftware % 1 == 0) begin
            sinus = $sin(2*3.14*$realtime*0.000005-3.14/2)*1000+offset;
            if (sinus < 0) begin
                sinus = 0;
            end
            //$display("%d %d %d",sinus, $realtime, start);
        end
        din = sinus;
    end

    run_sim = 1'b0;
    $display("---------------------------");
    $display("   ds_dac_sl finished      ");
    $display("---------------------------");
end
endmodule


