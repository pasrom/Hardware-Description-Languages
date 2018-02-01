/*-------------------------------------
Project:    lut_1557
Purpose:    implement a Combinatorial logic
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

`include "defines.sh"

module lut_1557 (
    input   logic   [3:0]   b,
    output  logic           s
);


always_comb begin
    case(b)
        4'b`Aone   :  s = 1'b0; 
        4'b`Bone   :  s = 1'b0; 
        4'b`Cone   :  s = 1'b0; 
        4'b`Done   :  s = 1'b0; 
        4'b`Eone   :  s = 1'b0; 
        4'b`Fone   :  s = 1'b0; 
        4'b`Gone   :  s = 1'b0; 
        default    :  s = 1'b1;
    endcase
end

endmodule
