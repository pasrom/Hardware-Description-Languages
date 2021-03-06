onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_statemachine/clk50m
add wave -noupdate /tb_statemachine/rst_n
add wave -noupdate /tb_statemachine/door
add wave -noupdate /tb_statemachine/coin
add wave -noupdate /tb_statemachine/new_coin
add wave -noupdate /tb_statemachine/bottle
add wave -noupdate /tb_statemachine/unlock
add wave -noupdate /tb_statemachine/state
add wave -noupdate /tb_statemachine/state_new
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {272975 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3103082 ps}
