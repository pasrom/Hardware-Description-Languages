onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_coffee_1557/rst_n
add wave -noupdate /tb_coffee_1557/clk11m
add wave -noupdate /tb_coffee_1557/c50
add wave -noupdate /tb_coffee_1557/e01
add wave -noupdate /tb_coffee_1557/e02
add wave -noupdate /tb_coffee_1557/machine_empty
add wave -noupdate /tb_coffee_1557/coffee_ready
add wave -noupdate /tb_coffee_1557/cup_out
add wave -noupdate /tb_coffee_1557/prepare_coffee
add wave -noupdate /tb_coffee_1557/green
add wave -noupdate /tb_coffee_1557/flash_light
add wave -noupdate /tb_coffee_1557/lock_slit
add wave -noupdate /tb_coffee_1557/run_sim
add wave -noupdate /tb_coffee_1557/DUT/state
add wave -noupdate /tb_coffee_1557/DUT/state_new
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {761 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
configure wave -valuecolwidth 49
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {2977 ns}
