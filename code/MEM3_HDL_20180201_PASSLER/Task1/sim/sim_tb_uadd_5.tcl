# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/uadd_5.sv
# Compile the test bench
vlog tb_uadd_5.sv
# Init simulation -> use module name
vsim tb_uadd_5
# -r recursive
log -r *
do wave_tb_uadd_5.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave
