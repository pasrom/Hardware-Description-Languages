/* ----------------------------------------
Project : DS DAC
Purpose : Toplevel delta sigma DAC
Author  : ANM
Date    : 25.11.2017
------------------------------------------- */

module toplevel_c5g_led_switch_7segx2_gpio_uart(



	//////////// CLOCK //////////
	input 	logic	          		CLOCK_125_p,
	input 	logic	          		CLOCK_50_B5B,
	input 	logic	          		CLOCK_50_B6A,
	input 	logic	          		CLOCK_50_B7A,
	input 	logic	          		CLOCK_50_B8A,

	//////////// LED //////////
	output	logic	     [7:0]		LEDG,
	output	logic	     [9:0]		LEDR,

	//////////// KEY //////////
	input 	logic	          		CPU_RESET_n,
	input 	logic	     [3:0]		KEY,

	//////////// SW //////////
	input 	logic	     [9:0]		SW,

	//////////// SEG7 //////////
	output	logic	     [6:0]		HEX0,
	output	logic	     [6:0]		HEX1,

	//////////// Uart to USB //////////
	input 	logic	          		UART_RX,
	output	logic	          		UART_TX,

	//////////// GPIO, GPIO connect to GPIO Default //////////
	output 	logic	    [35:0]		GPIO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

    logic                                   rst_n;
    logic                                   clk50m;
    logic                                   ds_bitstream;
    logic                                   count_up;
    logic                                   count_low;
    logic                                   count_en;
    logic                           [7:0]   cnt_8bit;
    logic                                   en50m_1m;
    logic                                   cnt_zero;
    logic                           [9:0]   cnt_10bit;
    logic                           [15:0]  analogue_sin;

//=======================================================
//  Structural coding
//=======================================================

// --- Map outputs ---

    assign UART_TX      = 1'b0;
    assign LEDG         = {8{ds_bitstream}};
    assign LEDR[9:0]    = '0;
    assign GPIO[35:1]   = '0;
    assign GPIO [0]     = ds_bitstream;
    
// --- Map inputs ---

    assign                          rst_n       = CPU_RESET_n;
    assign                          clk50m      = CLOCK_50_B5B;
    assign                          count_en    = count_low || count_up;

// --- Modules ---

prescale_50m_1m u0_prescale_50m_1m(
            .rst_n,
            .clk50m,
            .en50m_1m(en50m_1m)
);

debounce u0_debounce(
            .rst_n,
            .clk50m,
            .sw(KEY[0]),
            .sw_hi(),
            .sw_lo(count_low),
            .sw_dbnc()
);

debounce u1_debounce(
            .rst_n,
            .clk50m,
            .sw(KEY[1]),
            .sw_hi(),
            .sw_lo(count_up),
            .sw_dbnc()
);

counter_updn #(.WIDTH (8)) u0_counter_updn(
            .rst_n,
            .clk50m,
            .en(count_en),
            .down(count_low),
            .cnt(cnt_8bit)
);

prescaler_8bit  u0_prescaler_8bit(
            .rst_n,
            .clk50m,
            .en(en50m_1m),
            .preval(cnt_8bit),
            .cnt(),
            .cnt_zero(cnt_zero)
);

counter_updn #(.WIDTH (10)) u1_counter_updn(
            .rst_n,
            .clk50m,
            .en(cnt_zero),
            .down(1'b0),
            .cnt(cnt_10bit)
);

rom_addr16bit u0_rom_addr16bit(
            .address(cnt_10bit),
            .clock(clk50m),
            .q(analogue_sin)
);

ds_dac_sl u0_ds_dac_sl(
            .clk(clk50m),
            .rst_n,
            .clk_en(1'b1),
            .din(analogue_sin),
            .ce_out(),
            .dout(ds_bitstream)
);

sevenseg u0_sevenseg(
            .bin(cnt_8bit[7:4]),
            .hex(),
            .hexn(HEX1[6:0])
);

sevenseg u1_sevenseg(
            .bin(cnt_8bit[3:0]),
            .hex(),
            .hexn(HEX0[6:0])
);

endmodule
