# (1) Init library
vlib work
vmap work work
# (2) Compile sources
vlog ../src/sevenseg.sv
# (3) Compile testbenches
vlog ./tb_sevenseg.sv

# (4) Init simulation
vsim tb_sevenseg
log -r *
do wave_tb_sevenseg.tcl
# (5) Run simulation
run -all
# (6) Wave window
view wave
wave zoomful
