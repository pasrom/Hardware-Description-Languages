onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_pwf_1557/rst_n
add wave -noupdate /tb_pwf_1557/run_sim
add wave -noupdate /tb_pwf_1557/clk11m
add wave -noupdate /tb_pwf_1557/g
add wave -noupdate /tb_pwf_1557/i
add wave -noupdate -radix unsigned /tb_pwf_1557/DUT/sw_hi_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7050 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {7780 ns}
