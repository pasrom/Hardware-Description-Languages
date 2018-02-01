/*-------------------------------------
Project:    count_1596
Purpose:    
Author:     rpa2306
Version:    00, 01.29.2018
--------------------------------------*/

module count_1596 (
    input   logic           clk5m,
// Input
    input   logic           rst_n,
    input   logic           en,
    input   logic   [9:0]   data_in,
    input   logic           load,
    input   logic           updn,
// Output
    output  logic   [9:0]   cnt
);

// (1) counter for high
//logic [9:0]     cnt;

always_ff @ (negedge rst_n or posedge clk5m) begin
    if(!rst_n) begin
        cnt <= 10'b0;
    end else if (load) begin
        cnt <= data_in;
    end else if(en) begin
        if (updn) begin
            cnt <= cnt - 10'd1;
        end else begin
            cnt <= cnt + 10'd1;
        end
    end
    
end    

endmodule
