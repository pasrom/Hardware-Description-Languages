# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/coffee_1557.sv
# Compile the test bench
vlog tb_coffee_1557.sv
# Init simulation -> use module name
vsim tb_coffee_1557
# -r recursive
log -r *
do wave_tb_coffee_1557.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave
