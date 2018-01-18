onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_prescaler_8bit/rst_n
add wave -noupdate /tb_prescaler_8bit/clk50m
add wave -noupdate /tb_prescaler_8bit/en
add wave -noupdate -radix hexadecimal /tb_prescaler_8bit/preval
add wave -noupdate -radix unsigned /tb_prescaler_8bit/cnt
add wave -noupdate -format Analog-Step -height 74 -max 254.99999999999997 -radix unsigned /tb_prescaler_8bit/cnt
add wave -noupdate /tb_prescaler_8bit/cnt_zero
add wave -noupdate /tb_prescaler_8bit/run_sim
add wave -noupdate /tb_prescaler_8bit/error_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 236
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
configure wave -timelineunits us
update
WaveRestoreZoom {0 ns} {808590 ns}
