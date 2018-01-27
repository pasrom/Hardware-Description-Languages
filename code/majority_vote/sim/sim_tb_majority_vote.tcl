# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/majority_vote.sv
# Compile the test bench
vlog tb_majority_vote.sv
# Init simulation -> use module name
vsim tb_majority_vote
# -r recursive
log -r *
do wave_tb_majority_vote.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave