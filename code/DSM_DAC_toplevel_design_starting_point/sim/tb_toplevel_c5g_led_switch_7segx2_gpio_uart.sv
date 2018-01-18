/* ----------------------------------------
Project : DS DAC
Purpose : Toplevel delta sigma DAC
Author  : ANM
Date    : 25.11.2017
------------------------------------------- */
`timescale 10ns/10ns
module tb_toplevel_c5g_led_switch_7segx2_gpio_uart();
    // (1) DUT wiring
    //////////// CLOCK //////////
	logic	          		CLOCK_125_p;
	logic	          		CLOCK_50_B5B;
	logic	          		CLOCK_50_B6A;
	logic	          		CLOCK_50_B7A;
	logic	          		CLOCK_50_B8A;

	//////////// LED //////////
	logic	     [7:0]		LEDG;
	logic	     [9:0]		LEDR;

	//////////// KEY //////////
	logic	          		CPU_RESET_n;
	logic	     [3:0]		KEY;

	//////////// SW //////////
	logic	     [9:0]		SW;

	//////////// SEG7 //////////
	logic	     [6:0]		HEX0;
	logic	     [6:0]		HEX1;

	//////////// Uart to USB //////////
	logic	          		UART_RX;
	logic	          		UART_TX;

	//////////// GPIO; GPIO connect to GPIO Default //////////
	logic	    [35:0]		GPIO;


    // (2) DUT instance
    toplevel_c5g_led_switch_7segx2_gpio_uart	dut(.*);
    
    // (3) DUT stimuli
    logic run_sim = 1'b1;
    int error_cnt = 0;
    string action = "init";
    
    // --- Clocks and Reset ---
    initial begin : clk_gen_125m
        CLOCK_125_p = 1'b0;
        while (run_sim) begin
            #4ns;
            CLOCK_125_p = ~CLOCK_125_p;
        end
    end
    
    initial begin : clk_gen_50m
        CLOCK_50_B5B = 1'b0;
        while (run_sim) begin
            #10ns;
            CLOCK_50_B5B = ~CLOCK_50_B5B;
        end
    end
    assign CLOCK_50_B6A = CLOCK_50_B5B;
    assign CLOCK_50_B7A = CLOCK_50_B5B;
    assign CLOCK_50_B8A = CLOCK_50_B5B;
    
    initial begin : rst_gen
        CPU_RESET_n = 1'b0;
        #99ns
        CPU_RESET_n = 1'b1;
    end
    
    initial begin : load_memory
        $readmemh("../fpga/Toplevel_C5G_led_switch_7segx2_gpio_uart/ip/mem_sine_01.txt", dut.u0_rom_addr16bit.altsyncram_component.m_default.altsyncram_inst.mem_data);
    end
    
    // --- Stimulate inputs ---
    
    
    initial begin
        $display("--------------------------------");
        $display("tb_toplevel_c5g_led_switch_7segx2_gpio_uart started.");
        $display("--------------------------------");
        KEY = '1;
        SW = '0;
        UART_RX = '0;
        #1us;
        action="Push KEY[0] 300 times";
        $display("\t%s",action);
        repeat(300) begin
            @ (negedge CLOCK_50_B5B);
            KEY[0] = 1'b0;
            #1us;
            @ (negedge CLOCK_50_B5B);
            KEY[0] = 1'b1;
        end
        
        #100us;
        
        action="Push KEY[1] 555 times";
        $display("\t%s",action);
        repeat(555) begin
            @ (negedge CLOCK_50_B5B);
            KEY[1] = 1'b0;
            #1us;
            @ (negedge CLOCK_50_B5B);
            KEY[1] = 1'b1;
        end
        CPU_RESET_n = 1'b0;
        #99ns
        CPU_RESET_n = 1'b1;
        #2000us;
        
        run_sim = 1'b0;
        $display("--------------------------------");
        $display("tb_toplevel_c5g_led_switch_7segx2_gpio_uart finished.");
        $display("--------------------------------");
    end
        
endmodule