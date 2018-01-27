onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_coffee_1058/clk4m
add wave -noupdate /tb_coffee_1058/rst_n
add wave -noupdate /tb_coffee_1058/cent20
add wave -noupdate /tb_coffee_1058/cent50
add wave -noupdate /tb_coffee_1058/euro01
add wave -noupdate /tb_coffee_1058/cup_out
add wave -noupdate /tb_coffee_1058/stop_buy
add wave -noupdate /tb_coffee_1058/coffee_ready
add wave -noupdate /tb_coffee_1058/DUT/state
add wave -noupdate /tb_coffee_1058/DUT/state_new
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate /tb_coffee_1058/prepare_coffee
add wave -noupdate /tb_coffee_1058/green
add wave -noupdate /tb_coffee_1058/return_cash
add wave -noupdate /tb_coffee_1058/lock_slit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2556 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 214
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {6738 ns}
