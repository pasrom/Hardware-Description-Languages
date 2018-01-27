onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_washing_machine/clk50m
add wave -noupdate /tb_washing_machine/rst_n
add wave -noupdate /tb_washing_machine/run_sim
add wave -noupdate -divider Sensors
add wave -noupdate /tb_washing_machine/start
add wave -noupdate /tb_washing_machine/full
add wave -noupdate /tb_washing_machine/hot
add wave -noupdate /tb_washing_machine/clean
add wave -noupdate /tb_washing_machine/dry
add wave -noupdate -divider Outputs
add wave -noupdate /tb_washing_machine/heater
add wave -noupdate /tb_washing_machine/valve
add wave -noupdate /tb_washing_machine/motor_wash
add wave -noupdate /tb_washing_machine/pump
add wave -noupdate /tb_washing_machine/door_lock
add wave -noupdate /tb_washing_machine/motor_spin
add wave -noupdate -divider States
add wave -noupdate /tb_washing_machine/error_cnt
add wave -noupdate /tb_washing_machine/dut/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {38459439 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 231
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
WaveRestoreZoom {0 ps} {53823 ns}
