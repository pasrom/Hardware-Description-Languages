vlib work
vmap work work

vlog +define+SIM ../src/prescale_50m_1k.sv
vlog ../src/prescaler_8bit.sv
vlog tb_prescaler_8bit.sv

vsim tb_prescaler_8bit
log -r *
do wave_tb_prescaler_8bit.tcl

run -all
view wave
wave zoomfull