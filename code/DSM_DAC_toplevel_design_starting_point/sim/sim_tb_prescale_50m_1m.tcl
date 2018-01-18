vlib work
vmap work work

vlog  ../src/prescale_50m_1m.sv
vlog  ./tb_prescale_50m_1m.sv

vsim tb_prescale_50m_1m
log -r *
do wave_tb_prescale_50m_1m.tcl

run -all

view wave
wave zoomfull