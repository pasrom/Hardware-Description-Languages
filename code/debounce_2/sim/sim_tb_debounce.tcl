# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/debounce.sv
# Compile the test bench
vlog tb_debounce.sv
# Init simulation -> use module name
vsim tb_debounce
# -r recursive
log -r *
do wave_tb_debounce.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave
