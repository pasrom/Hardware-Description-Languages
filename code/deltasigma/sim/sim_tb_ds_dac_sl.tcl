# Create simulation environment
vlib work
vmap work work

# Compile desing files -> use file names
vlog ../src/ds_dac_sl.sv
# Compile the test bench
vlog tb_ds_dac_sl.sv
# Init simulation -> use module name
vsim tb_ds_dac_sl
# -r recursive
log -r *
do wave_tb_ds_dac_sl.tcl

# Run simulation
run -all
# run 100us
# Show results
view wave
