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

debounce       DUT (.*);

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
    sw = 1'b0;
    rst_n = 1'b1;
    #100ns;
    rst_n = 1'b0;

    @(negedge clk50m);
    sw = 1'b0;
    repeat (2) begin
            @ (posedge clk50m);
        end
    $display("\t%b\t%b\t%b\t%b\t%b\t%b",rst_n, clk50m, sw, sw_hi, sw_lo, sw_dbnc);

	
	run_sim = 0;
    $display("---------------------------");
    $display("   debounce finished    ");
    $display("---------------------------");

end
endmodule


