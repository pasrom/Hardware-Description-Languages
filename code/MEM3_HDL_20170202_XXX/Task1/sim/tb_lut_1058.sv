/*-------------------------------------
Project:    lut_1058
Purpose:    
Author:     rpa2306
Version:    00, 01.26.2018
--------------------------------------*/

`include "../src/defines.sh"

`timescale 10ns/10ns

module tb_lut_1058();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic   [3:0]   b;
logic           s;

/*
*   (2) Create an instance of the DUT
*/

lut_1058                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

initial begin
    automatic int cntOne = 0;
    automatic int cntZero = 0;
    automatic int temp=0;
    $display("---------------------------");
    $display("    lut_1058 started    ");
    $display("---------------------------");

    for (int i = 0; i<$bits(b)<<2;i++)begin
        b = i;
        #100ns;
        case(b)
            4'b`Aone   :  temp=1; 
            4'b`Bone   :  temp=1; 
            4'b`Cone   :  temp=1; 
            4'b`Done   :  temp=1; 
            default   :  temp=2;
        endcase
        if (temp == 1 && s != 1) begin
            cntOne++;
        end
        if (temp == 2 && s == 1) begin
            cntZero++;
        end
        temp = 0;
    end
    if (cntOne != 0) begin
        $display("--- ERROR: Input says Output should be one, but is zero! ---");
    end
    else begin
        $display("--- Passed Test one ---");
    end

    if (cntZero != 0) begin
        $display("--- ERROR: Input says Output should be zero, but is one! ---");
    end
    else begin
        $display("--- Passed Test two ---");
    end

    $display("---------------------------");
    $display("   lut_1058 finished    ");
    $display("---------------------------");

end
endmodule


