vlib work
vmap work work

vlog ../fpga/Toplevel_C5G_led_switch_7segx2_gpio_uart/ip/mult_16bit.v
vlog tb_mult_16bit.sv

vsim -L altera_mf_ver -L lpm_ver tb_mult_16bit
do wave_tb_mult_16bit.tcl
log *
run -all

view wave
wave zoomfull