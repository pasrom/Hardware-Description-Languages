# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/coffee_1058.sv
# Compile the test bench
vlog tb_coffee_1058.sv
# Init simulation -> use module name
vsim tb_coffee_1058
# -r recursive
log -r *
do wave_tb_coffee_1058.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave
