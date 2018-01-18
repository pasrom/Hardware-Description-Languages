vlib work
vmap work work

vlog +incdir+../src ../src/debounce.sv
vlog +incdir+../src ./tb_debounce.sv

vsim tb_debounce
log -r *
do wave_tb_debounce.tcl

run -all

view wave
wave zoomfull