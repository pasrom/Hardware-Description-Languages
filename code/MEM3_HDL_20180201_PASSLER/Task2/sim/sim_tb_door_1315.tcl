# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/door_1315.sv
# Compile the test bench
vlog tb_door_1315.sv
# Init simulation -> use module name
vsim tb_door_1315
# -r recursive
log -r *
do wave_tb_door_1315.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave
