/* ----------------------------------------
Project : DS DAC
Purpose : Show operation of a delta sigma dac
Author  : ANM
Date    : 25.11.2017
------------------------------------------- */


module ds_dac(
    input   logic               rst_n,
    input   logic               clk50m,
    input   logic [15:0]        din,
    output  logic               dout
);


logic [15:0]                    fdbk;               //u16
logic signed [16:0]             error;              //s17
logic signed [18:0]             integ_add;          //s19
logic signed [17:0]             integ_add_lim;      //s18
logic signed [17:0]             integ;              //s18

/* DELTA */
assign error = {1'b0,din} - {1'b0,fdbk};

/* SIGMA */
assign integ_add = error + integ;
always_comb begin
    if (integ_add[18]) begin
        integ_add_lim = 18'b01_0000_0000_0000_0000;
    end
    else begin
        integ_add_lim = integ_add[17:0];
    end
end

always_ff @ (negedge rst_n or posedge clk50m) begin
    if (!rst_n) begin
        integ <= '0;
    end
    else begin
        integ <= integ_add_lim;
    end
end

/* COMPARATOR */
always_comb begin
    dout = 1'b0;
    fdbk = 16'h0000;
    if (integ_add_lim > (1'b1 << 14) ) begin
        dout = 1'b1;
        fdbk = 16'hffff;
    end
end


endmodule