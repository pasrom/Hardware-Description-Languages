# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/add_s.sv
# Compile the test bench
vlog tb_add_s.sv
# Init simulation -> use module name
vsim tb_add_s
# -r recursive
log -r *
do wave_tb_add_s.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave
