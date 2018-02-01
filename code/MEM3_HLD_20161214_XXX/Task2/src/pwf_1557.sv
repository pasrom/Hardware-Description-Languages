/*-------------------------------------
Project:    pwf_1557
Purpose:    
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

module pwf_1557 (
    input   logic           rst_n,
    input   logic           clk11m,
    input   logic           g,
    output  logic           i
);

// (1) counter for high
logic [3:0]     sw_hi_cnt;

always_ff @ (negedge rst_n or posedge clk11m) begin
    if(!rst_n) begin
        i <= 1'b0;
        sw_hi_cnt <= 4'd0;
    end
    if (g && !i) begin
        sw_hi_cnt <= sw_hi_cnt + 4'd1;
    end
    else if (!g) begin
        sw_hi_cnt <= 4'd0;
        i <= 1'b0;
    end
    if (sw_hi_cnt >= 12 && !i) begin
        i <= 1'b1;
    end
end   

endmodule
