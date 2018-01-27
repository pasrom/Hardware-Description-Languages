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
logic           sw_hi_cnt_zero;

always_ff @ (negedge rst_n or posedge clk4m) begin
    if(!rst_n) begin
        c <= '0;
        sw_hi_cnt <= '0;
    end
    if (a == 1'b1 && ~c == 1'b1) begin
        sw_hi_cnt = sw_hi_cnt + 4'b1;
    end
    else if (a == 1'b0) begin
        sw_hi_cnt = '0;
        c = '0;
    end
    if (sw_hi_cnt >= 13) begin
        c = '1;
        sw_hi_cnt ='0;
    end
end    

endmodule
