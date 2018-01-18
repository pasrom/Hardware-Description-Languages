/*------------------------------
Projekt: Generic
Purpose: Up/down counter
Author: ANM
Version: v00, 01.10.2017
--------------------------------*/

module tb_counter_updn();

localparam WIDTH = 8;

// (1) DUT wiring
logic                   rst_n;
logic                   clk50m;
logic                   en;
logic                   down;
logic [WIDTH-1:0]       cnt;

// (2) DUT instance
counter_updn #(.WIDTH (8) ) dut(.*);

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


initial begin
    $display("----------------------------------");
    $display("tb_counter_updn started");
    $display("----------------------------------");
    rst_n = 1'b0;
    en = 1'b0;
    down = 1'b0;
    #90ns;
    action = "por";
    $display("\t%s", action);
    rst_n = 1'b1;
    #1us
    action = "300 times up";
    $display("\t%s", action);
    repeat (300) begin
        @ (negedge clk50m) 
            en = 1'b1;
        @ (negedge clk50m)
            en = 1'b0;
    end
    action = "301 times down";
    $display("\t%s", action);
    down = 1'b1;
    repeat (301) begin
        @ (negedge clk50m) 
            en = 1'b1;
        @ (negedge clk50m)
            en = 1'b0;
    end
    
    #1us;
    run_sim = 1'b0;
    
    
    
    $display("----------------------------------");
    $display("tb_counter_updn finished");
    $display("----------------------------------");
    
end



endmodule