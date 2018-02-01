# This is a TCL script that controls ModelSim

# Create a simulation library and map to it
vlib work
vmap work work

# Compile sources
# use relative path!
vlog	../src/statemachine.sv

# Compile testbenches
vlog	tb_statemachine.sv

# Init simulation
# Define shich Verilog module shall be simulated!
vsim	tb_statemachine

# Specify which signals shall be logged
# Here: log all signals recursively
log -r *

# Start simulation
run -all
# run 100ns

# Open wave viewer
view wave
 do wave_sim_statemachine.tcl
wave zoomful