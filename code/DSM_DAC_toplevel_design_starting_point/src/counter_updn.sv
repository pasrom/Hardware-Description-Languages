/*------------------------------
Projekt: Generic
Purpose: Up/down counter
Author: ANM
Version: v00, 01.10.2017
--------------------------------*/


module  counter_updn #(parameter WIDTH = 8) (
    input   logic                   rst_n,
    input   logic                   clk50m,
    input   logic                   en,
    input   logic                   down,
    output  logic [WIDTH-1:0]       cnt
);



always_ff @ (negedge rst_n or posedge clk50m) begin
    if (!rst_n) begin
        cnt <= '0;
    end
    else if(en && down) begin
        cnt <= cnt - 1;
    end
    else if (en) begin
        cnt <= cnt + 1;
    end
end


endmodule