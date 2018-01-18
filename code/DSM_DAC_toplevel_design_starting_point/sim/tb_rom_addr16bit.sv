`timescale 10ns/10ns

module tb_rom_addr16bit();

// (1) DUT wiring
    logic [9:0]             address;
    logic                   clock;
    logic [15:0]            q;

// (2) DUT instance
    rom_addr16bit   dut(.*);

// (3) DUT stimuli
    logic run_sim = 1'b1;
    
    
    initial begin : clk_gen
        clock = 1'b0;
        while (run_sim) begin
            #10ns;
            clock = !clock;
        end
    end
    
    initial begin
        $readmemh("../fpga/Toplevel_C5G_led_switch_7segx2_gpio_uart/ip/mem_sine_01.txt", dut.altsyncram_component.m_default.altsyncram_inst.mem_data);
        address = '0;
        #10us;
        repeat(1024) begin
            @(negedge clock);
            address = address + 1;
        end
        #1us;
        run_sim = 1'b0;
    end
    
endmodule
