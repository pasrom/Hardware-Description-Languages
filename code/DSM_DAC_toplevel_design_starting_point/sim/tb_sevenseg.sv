`timescale 1ns/1ns

module tb_sevenseg();

// (1) DUT wiring
    logic   [3:0]               bin;
    logic   [6:0]               hex;
    logic   [6:0]               hexn;


// (2) DUT instance
    sevenseg    u0_sevenseg(.*);

// (3) test stimuli

    initial begin
        $display("TB sevenseg started");
        $display("-------------------------");
        $display("bin --> hex");
        
        for (int i = 0; i<16;i++) begin
            bin = i;
            #1ns;
            $display("%d  --> %b",bin,hex);
            #100ns;
        end
        
        $display("-------------------------");
        $display("TB sevenseg started");
    end

endmodule