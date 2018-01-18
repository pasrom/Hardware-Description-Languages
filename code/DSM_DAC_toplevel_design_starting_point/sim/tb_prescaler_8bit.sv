/*------------------------------
Projekt: Generic
Purpose: Adjustable 8bit prescaler
Author: ANM
Version: v00, 01.12.2017
--------------------------------*/
`timescale 10ns/10ns

module tb_prescaler_8bit();

// (1) DUT wiring
logic               rst_n;
logic               clk50m;
logic               en;
logic [7:0]         preval;
logic [7:0]         cnt;
logic               cnt_zero;

// (2) DUT instance
prescaler_8bit dut(.*);

// (3) DUT stimuli
logic run_sim = 1'b1;
int error_cnt = 0;
string action = "init";

initial begin : clk_gen
    clk50m = 1'b0;
    while (run_sim) begin
        #10ns;
        clk50m = !clk50m;
    end
end

prescale_50m_1k   u1_prescale_50m_1k(
    .rst_n                      ,
    .clk50m                     ,
    .en50m_1k                   (en)
);

initial begin : counter_stimuli
    $display("------------------------");
    $display("tb_prescaler_8bit started");
    $display("------------------------");
    $display("\t%s",action);
    rst_n = 1'b0;
    preval = '0;
    #90ns;
    action = "por";
    $display("\t%s",action);
    #1us;
    //-------------------
    preval = '1;
    action ="8'hff";
    $display("\t%s",action);
    rst_n = 1'b1;
    repeat(250) begin
        @(negedge en);
    end
    //-------------------
    preval = 8'h7F;
    action ="8'hff";
    $display("\t%s",action);
    rst_n = 1'b1;
    repeat(250) begin
        @(negedge en);
    end
    //-------------------
    preval = 8'h00;
    action ="8'h00";
    $display("\t%s",action);
    rst_n = 1'b1;
    repeat(250) begin
        @(negedge en);
    end
    
    #1us;
    run_sim = 1'b0;
    $display("------------------------");
    $display("tb_prescaler_8bit finished");
    $display("------------------------");

end

endmodule