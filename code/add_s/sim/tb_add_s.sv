/*-------------------------------------
Project:    add_s
Purpose:    
Author:     rpa2306
Version:    00, 01.11.2018
--------------------------------------*/

`timescale 10ns/10ns

module tb_add_s();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

localparam TBWIDTH = 4;

logic signed [TBWIDTH-1:0]        x;
logic signed [TBWIDTH-1:0]        y;
logic signed [TBWIDTH-1:0]        sum;
logic                             of;
logic                             uf;

/*
*   (2) Create an instance of the DUT
*/

add_s    # (.WIDTH (TBWIDTH))    DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/


initial begin

    $display("---------------------------");
    $display("    add_s started    ");
    $display("---------------------------");

// 3 + (-5)

    x = 4'b0011;
    y = 4'b1011;

    #50ns;
    $display("x: %d, y: %d, Sum: %d, OF: %d UF: %d", x, y, sum, of, uf);
// 3 + 6
    x = 4'b0011;
    y = 4'b0110;

    #50ns;
    $display("x: %d, y: %d, Sum: %d, OF: %d UF: %d", x, y, sum, of, uf);

    x = 4'b1001;
    y = 4'b1100;

    #50ns;
    $display("x: %d, y: %d, Sum: %d, OF: %d UF: %d", x, y, sum, of, uf);

    $display("---------------------------");
    $display("   add_s finished    ");
    $display("---------------------------");

end
endmodule


