`timescale 10ns/10ns

module tb_mult_16bit();

// (1) DUT wiring
    logic	[9:0]  dataa;
    logic   [7:0]  datab;
    logic  [15:0]  result;

// (2) DUT instance

    mult_16bit  dut (.*);

// (3) DUT stimuli

initial begin
    dataa = 10'b10_0000_0000;
    datab = 8'b0000_0000;
    for (int bi = 0; bi < 256; bi++) begin
        #10ns;
        datab = bi;
    end
    #1us;
end


endmodule