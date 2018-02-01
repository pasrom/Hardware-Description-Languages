/*-------------------------------------
Project:    uadd_5
Purpose:    
Author:     Passler
Version:    00, 01.02.2018
--------------------------------------*/

`timescale 1ns/1ns

module tb_uadd_5();

/* 
*.  (1) Create wires to connect the DUT
*.  Like footprints for an IC on a PCB
*/

logic unsigned [4:0] a;
logic unsigned [4:0] b;
logic unsigned [4:0] s;
logic                of;

/*
*   (2) Create an instance of the DUT
*/

uadd_5                          DUT (.*);

/*
*   (3) Create stimuli for all inputs
*/

initial begin
    automatic int i;
    automatic int j;
    automatic int calcS;
    automatic int cntOF;
    automatic int cntError;
    $display("---------------------------");
    $display("    uadd_5 started    ");
    $display("---------------------------");

    // show that the adder works
    a = 5'd5;
    b = 5'd9;

    #50ns;

    $display("x: %d, y: %d, Sum: %d, OF: %d", a, b, s, of);

     // create overflow
    a = 5'b11111;
    b = 5'b1;

    #50ns;
    $display("x: %d, y: %d, Sum: %d, OF: %d", a, b, s, of);

    for (i = 0; i < 31; i = i +1) begin
        a = i;
        for (j = 0; j < 31; j = j +1) begin
            b = j;
            calcS = i+j;
            #50ns;
            $display("Real: x: %d y: %d Sum: %d OF: %d", a, b, s, of);
            if (calcS > 31) begin
                if (!of) begin
                    cntOF++;
                end
                if (s != 1'b11111) begin
                    cntError++;
                end
            end
            else begin
                if (of) begin
                    cntOF++;
                end
                if (s != calcS) begin
                    cntError++;
                end
            end
            $display("Calc: xc: %d yc: %d Sumc: %d OFc: %d", i, j, calcS, calcS > 31);
        end
    end
    if (cntError == 0 && cntOF == 0) begin
        $display("Pass: tb_add_u finished w/o errors");
    end
    else begin
        $display("Failed %d times!", cntOF);
        $display("added %d times wrong!", cntError);
    end
    $display("---------------------------");
    $display("   uadd_5 finished    ");
    $display("---------------------------");

end
endmodule


