/*-------------------------------------
Project:    pwf_1058
Purpose:    
Author:     rpa2306
Version:    00, 01.26.2018
--------------------------------------*/

module pwf_1058 (
    input   logic           rst_n,
    input   logic           clk4m,
    input   logic           a,
    output  logic           c
);

// (1) counter for high
logic [3:0]     sw_hi_cnt;

always_ff @ (negedge rst_n or posedge clk4m) begin
    if(!rst_n) begin
        c <= 1'b0;
        sw_hi_cnt <= 4'd0;
    end
    else begin
        if (a && !c) begin
            sw_hi_cnt <= sw_hi_cnt + 4'd1;
        end
        else if (!a) begin
            sw_hi_cnt <= 4'd0;
            c <= 1'b0;
        end
        if (sw_hi_cnt >= 12 && !c) begin
            c <= 1'b1;
        end
    end
end    

endmodule
