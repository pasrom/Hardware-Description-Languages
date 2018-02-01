/*-------------------------------------
Project:    lut_1596
Purpose:    
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

`include "defines.sh"

module lut_1596 (
    input   logic   [3:0]   x,
    output  logic           y
);


always_comb begin
    case(x)
        4'b`Aone   :  y = 1'b1; 
        4'b`Bone   :  y = 1'b1; 
        4'b`Cone   :  y = 1'b1;
        default    :  y = 1'b0;
    endcase
end

endmodule
