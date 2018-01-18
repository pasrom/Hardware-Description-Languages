onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_counter_updn/rst_n
add wave -noupdate /tb_counter_updn/clk50m
add wave -noupdate /tb_counter_updn/en
add wave -noupdate /tb_counter_updn/down
add wave -noupdate -radix unsigned /tb_counter_updn/cnt
add wave -noupdate -format Analog-Step -height 80 -max 255.0 -radix unsigned /tb_counter_updn/cnt
add wave -noupdate /tb_counter_updn/run_sim
add wave -noupdate /tb_counter_updn/error_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 274
configure wave -valuecolwidth 55
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
WaveRestoreZoom {0 ps} {17515838 ps}
