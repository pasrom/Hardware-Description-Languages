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
    logic               hi_edge;

// (2) counter for low
    logic [`BITS-1:0]   sw_lo_cnt;
    logic               sw_lo_cnt_zero;
    logic               lo_edge;

// (1) Implementation of counter high        
    assign sw_hi_cnt_zero = ~|sw_hi_cnt;
    
    always_ff @ (negedge rst_n or posedge clk50m) begin // %(*\label{code:ff sw_hi_cnt begin}*)
        if (~rst_n) begin
            sw_hi_cnt <= '1;
        end
        else if (sw & sw_hi_cnt_zero) begin
            sw_hi_cnt <= '0;
        end
        else if (sw) begin
            sw_hi_cnt <= sw_hi_cnt - `BITS'd1;
        end
        else begin
            sw_hi_cnt <= '1;
        end
    end                                                 // %(*\label{code:ff sw_hi_cnt end}*)
    
// edge detection up
    always_ff @ (negedge rst_n or posedge clk50m) begin // %(*\label{code: edge up begin}*)
        if (~rst_n) begin
            hi_edge = 1'b0;
        end
        else if(sw_hi_cnt == `BITS'd1)begin
            hi_edge = 1'b1;
        end
        else begin
            hi_edge = 1'b0;
        end
    end                                                 // %(*\label{code: edge up end}*)
    
    assign sw_hi = (sw_hi_cnt_zero & hi_edge) ;
    
// (2) Implementation of counter low
    assign sw_lo_cnt_zero = ~|sw_lo_cnt;
    
    always_ff @ (negedge rst_n or posedge clk50m) begin // %(*\label{code:ff sw_lo_cnt begin}*)
        if (~rst_n) begin
            sw_lo_cnt <= '1;
        end
        else if (~sw & sw_lo_cnt_zero) begin
            sw_lo_cnt <= '0;
        end
        else if (~sw) begin
            sw_lo_cnt <= sw_lo_cnt - `BITS'd1;
        end
        else begin
            sw_lo_cnt <= '1;
        end
    end                                                 // %(*\label{code:ff sw_lo_cnt end}*)
    
// edge detection down
    always_ff @ (negedge rst_n or posedge clk50m) begin // %(*\label{code: edge down begin}*)
        if (~rst_n) begin
            lo_edge = 1'b0;
        end
        else if(sw_lo_cnt == `BITS'd1)begin
            lo_edge = 1'b1;
        end
        else begin
            lo_edge = 1'b0;
        end
    end                                                 // %(*\label{code: edge down end}*)
    
    assign sw_lo = (sw_lo_cnt_zero & lo_edge);
    
// (3) output FF
    always_ff @ (negedge rst_n or posedge clk50m) begin // %(*\label{code: ff output begin}*)
        if (~rst_n) begin
            sw_dbnc <= 1'b0;
        end
        else if (sw_lo) begin
            sw_dbnc <= 1'b0;
        end
        else if (sw_hi) begin
            sw_dbnc <= 1'b1;
        end
    end                                                 // %(*\label{code: ff output end}*)

endmodule