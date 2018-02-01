/*-------------------------------------
Project:    uadd_5
Purpose:    Unsigned addition with integer saturation
            and overflow indication
Author:     Passler
Version:    00, 01.02.2018
--------------------------------------*/

module uadd_5 (
// inputs
    input   logic unsigned [4:0] a,
    input   logic unsigned [4:0] b,
// outputs
    output  logic unsigned [4:0] s,
    output  logic                of
);

logic [5:0]         adder;
assign adder = a + b;

always_comb begin
    if (adder[5:5]) begin
        s = 1'b11111;
        of = 1'b1;
    end 
    else begin
        s = adder [4:0];
        of = 1'b0;
    end
end

endmodule
