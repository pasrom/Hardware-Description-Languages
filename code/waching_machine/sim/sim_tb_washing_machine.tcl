# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/washing_machine.sv
# Compile the test bench
vlog tb_washing_machine.sv
# Init simulation -> use module name
vsim tb_washing_machine
# -r recursive
log -r *
do wave_tb_washing_machine.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave