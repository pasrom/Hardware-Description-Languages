# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/flipflops.sv
# Compile the test bench
vlog tb_flipflops.sv
# Init simulation -> use module name
vsim tb_flipflops
# -r recursive
log -r *
do wave_tb_flipflops.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave