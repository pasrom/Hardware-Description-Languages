# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/counter_updn.sv
# Compile the test bench
vlog tb_counter_updn.sv
# Init simulation -> use module name
vsim tb_counter_updn
# -r recursive
log -r *
do wave_tb_counter_updn.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave