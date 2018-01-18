onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_debounce/rst_n
add wave -noupdate /tb_debounce/clk50m
add wave -noupdate -color blue -itemcolor blue /tb_debounce/sw
add wave -noupdate /tb_debounce/sw_hi
add wave -noupdate /tb_debounce/sw_lo
add wave -noupdate -color blue -itemcolor blue /tb_debounce/sw_dbnc
add wave -noupdate /tb_debounce/run_sim
add wave -noupdate /tb_debounce/action
add wave -noupdate -divider dut
add wave -noupdate /tb_debounce/dut/sw_hi_cnt
add wave -noupdate -format Analog-Step -height 74 -max 7.0 -radix unsigned /tb_debounce/dut/sw_hi_cnt
add wave -noupdate /tb_debounce/dut/sw_hi_cnt_zero
add wave -noupdate /tb_debounce/dut/hi_edge
add wave -noupdate /tb_debounce/dut/sw_lo_cnt
add wave -noupdate -format Analog-Step -height 74 -max 7.0 -radix unsigned /tb_debounce/dut/sw_lo_cnt
add wave -noupdate /tb_debounce/dut/sw_lo_cnt_zero
add wave -noupdate /tb_debounce/dut/lo_edge
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 189
configure wave -valuecolwidth 53
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
WaveRestoreZoom {0 ns} {2460 ns}
