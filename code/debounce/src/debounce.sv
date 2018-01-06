/*-------------------------------------
Project:    debounce
Purpose:    
Author:     rpa2306
Version:    00, 01.06.2018
--------------------------------------*/

`include "debounce.sh"

module debounce (
    input   logic           rst_n,
    input   logic           clk50m,
    input   logic           sw,
    output  logic           sw_hi,
    output  logic           sw_lo,
    output  logic           sw_dbnc
);

// (1) counter for high
    logic [`BITS-1:0]   sw_hi_cnt;
    logic               sw_hi_cnt_zero;

// (2) counter for low
    logic [`BITS-1:0]   sw_lo_cnt;
    logic               sw_lo_cnt_zero;

always_ff @(negedge rst_n or posedge clk50m) begin
    // reset
    if(!rst_n) begin
        sw_hi           <= 1'b0;
        sw_lo           <= 1'b0;
        sw_dbnc         <= 1'b0;
        sw_lo_cnt_zero  <= 1'b0;
        sw_hi_cnt_zero  <= 1'b0;
        sw_hi_cnt       <= '0;
        sw_lo_cnt       <= '1;
    end
    else if (sw && !sw_hi_cnt) begin
        sw_hi           <= 1'b1;
        sw_hi_cnt_zero  <= 1'b1;
        sw_dbnc         <= 1'b1;
    end
    // counter if someone pressed the switch
    else if (sw) begin
        sw_hi_cnt       <= sw_hi_cnt - 1'b1;
        // init low counter to highest value
        sw_lo_cnt       <= 1;
        sw_lo_cnt_zero  <= 1'b0;

        if (sw_hi_cnt == 0) begin
            sw_hi           <= 1'b1;
            sw_hi_cnt_zero  <= 1'b1;
        end
    end
    // counter if someone released the switch
    else if (!sw) begin
        sw_lo_cnt       <= sw_lo_cnt - 1'b1;
        // init low counter to highest value
        sw_hi_cnt       <= 1;
        sw_hi_cnt_zero  <= 1'b0;

        if (sw_lo_cnt == 0) begin
            sw_lo           <= 1'b1;
            sw_lo_cnt_zero  <= 1'b1;
        end
    end

    // initial condition (startup)
    else begin
        sw_hi_cnt   <= '0;
        sw_lo_cnt   <= `BITS'b1;
    end
end

endmodule
