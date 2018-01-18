vlib work
vmap work work

vlog ../src/*.sv
vlog ../src/*.v
vlog ../fpga/Toplevel_C5G_led_switch_7segx2_gpio_uart/ip/mult_16bit.v

vlog tb_toplevel_c5g_led_switch_7segx2_gpio_uart.sv

vsim -L altera_mf_ver -L lpm_ver tb_toplevel_c5g_led_switch_7segx2_gpio_uart
log -r *
do wave_tb_toplevel_c5g_led_switch_7segx2_gpio_uart.tcl

run -all
view wave
wave zoomfull