/*-------------------------------------
Project:    add_s
Purpose:    Signed adder with OF and UF protection
            selectable bit width
Author:     rpa2306
Version:    00, 01.11.2018
--------------------------------------*/

module add_s # (parameter WIDTH = 4) (
input   logic signed [WIDTH-1:0]      x,
input   logic signed [WIDTH-1:0]      y,
output  logic signed [WIDTH-1:0]      sum,
output  logic                         of,
output  logic                         uf
);
// http://asciiflow.com
//       x       +------------+    sum
//   +-----------+            +----------+
//               |            |    of
//               |            +----------+
//       y       |            |    uf
//   +-----------+            +----------+
//               +------------+

// this is done before the synthesis
localparam POSLIM =  2**(WIDTH-1) - 1;
localparam NEGLIM = -2**(WIDTH-1);

// Create an ADDER with bitwidth WIDTH+1
logic [WIDTH:0]         adder;
assign adder = x + y;

// The inputs are extended to correct bit width. The MSB is used for extension (SIGNED)

// Check for OF or UF

always_comb begin
    if (adder[WIDTH:WIDTH-1] == 2'b01) begin        //OF --> limit to max pos value
        sum = POSLIM;
        of = 1'b1;
        uf = 1'b0;
    end
    else if (adder[WIDTH:WIDTH-1] == 2'b10) begin    //UF --> limit to min neg value
        sum = NEGLIM;
        uf = 1'b1;
        of = 1'b0;
    end 
    else begin                                      //ok --> forward WIDTH bits
        sum = adder[WIDTH-1:0];
        of = 1'b0;
        uf = 1'b0;
    end
end

endmodule
