vlib work
vmap work work

vlog ../src/counter_updn.sv
vlog tb_counter_updn.sv

vsim tb_counter_updn
log -r *
do wave_tb_counter_updn.tcl
run -all

view wave
wave zoomfull