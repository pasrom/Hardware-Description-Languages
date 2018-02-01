/*-------------------------------------
Project:    lut_1596
Purpose:    
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

`include "../src/defines.sh"
`timescale 10ns/10ns

module tb_lut_1596();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic   [3:0]   x;
logic           y;

/*
*   (2) Create an instance of the DUT
*/

lut_1596                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

initial begin

    automatic int cntOne = 0;
    automatic int cntZero = 0;
    automatic int temp=0;

    $display("---------------------------");
    $display("    lut_1596 started    ");
    $display("---------------------------");

    for (int i = 0; i<$bits(x)<<2;i++)begin
        x = i;
        #100ns;
        case(x)
            4'b`Aone   :  temp=1; 
            4'b`Bone   :  temp=1; 
            4'b`Cone   :  temp=1; 
            default    :  temp=2;
        endcase
        if (temp == 1 && y != 1) begin
            cntOne++;
        end
        if (temp == 2 && y == 1) begin
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
    $display("   lut_1596 finished    ");
    $display("---------------------------");

end
endmodule


