# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/fsm_door_1596.sv
# Compile the test bench
vlog tb_fsm_door_1596.sv
# Init simulation -> use module name
vsim tb_fsm_door_1596
# -r recursive
log -r *
do wave_tb_fsm_door_1596.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave
