# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/sevenseg.sv
# Compile the test bench
vlog tb_sevenseg.sv
# Init simulation -> use module name
vsim tb_sevenseg
# -r recursive
log -r *
do wave_tb_sevenseg.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave