onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_debounce/rst_n
add wave -noupdate /tb_debounce/clk50m
add wave -noupdate -color Red -itemcolor Red /tb_debounce/sw
add wave -noupdate -divider {Counter Up}
add wave -noupdate -color Blue -format Analog-Step -height 74 -itemcolor Blue -max 7.0 -radix unsigned /tb_debounce/DUT/sw_hi_cnt
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} /tb_debounce/DUT/sw_hi_cnt_zero
add wave -noupdate -color Cyan -itemcolor Cyan /tb_debounce/DUT/sw_hi
add wave -noupdate /tb_debounce/DUT/hi_edge
add wave -noupdate -divider {Counter Down}
add wave -noupdate -color Magenta -format Analog-Step -height 74 -itemcolor Magenta -max 7.0 -radix unsigned /tb_debounce/DUT/sw_lo_cnt
add wave -noupdate -color Orchid -itemcolor Orchid /tb_debounce/DUT/sw_lo_cnt_zero
add wave -noupdate -color Violet -itemcolor Violet /tb_debounce/DUT/sw_lo
add wave -noupdate /tb_debounce/DUT/lo_edge
add wave -noupdate -divider {Debounced Switch}
add wave -noupdate /tb_debounce/DUT/sw_dbnc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1070000 ps} 0} {{Cursor 3} {390000 ps} 0} {{Cursor 5} {490000 ps} 0} {{Cursor 6} {570000 ps} 0} {{Cursor 7} {710000 ps} 0} {{Cursor 8} {670000 ps} 0} {{Cursor 9} {470000 ps} 0} {{Cursor 10} {1430000 ps} 0} {{Cursor 11} {9040 ps} 0}
quietly wave cursor active 9
configure wave -namecolwidth 216
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {1711500 ps}
