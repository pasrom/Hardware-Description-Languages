/*-------------------------------------
Project:    lut_1058
Purpose:    implement a Combinatorial Logic
Author:     rpa2306
Version:    00, 01.26.2018
--------------------------------------*/

`include "defines.sh"

module lut_1058 (
    input   logic   [3:0]   b,
    output  logic           s
);


always_comb begin
    case(b)
        4'b`Aone   :  s = 1'b1; 
        4'b`Bone   :  s = 1'b1; 
        4'b`Cone   :  s = 1'b1; 
        4'b`Done   :  s = 1'b1; 
        default   :  s = 1'b0;
    endcase
end
endmodule
