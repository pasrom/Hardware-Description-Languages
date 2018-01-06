onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_debounce/rst_n
add wave -noupdate /tb_debounce/clk50m
add wave -noupdate /tb_debounce/sw
add wave -noupdate -divider {Counter Up}
add wave -noupdate /tb_debounce/DUT/sw_hi_cnt
add wave -noupdate /tb_debounce/DUT/sw_hi_cnt_zero
add wave -noupdate /tb_debounce/DUT/sw_hi
add wave -noupdate -divider {Counter Down}
add wave -noupdate /tb_debounce/DUT/sw_lo_cnt
add wave -noupdate /tb_debounce/DUT/sw_lo_cnt_zero
add wave -noupdate /tb_debounce/DUT/sw_lo
add wave -noupdate -divider {Debounced Switch}
add wave -noupdate /tb_debounce/DUT/sw_dbnc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 256
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
WaveRestoreZoom {0 ps} {100487 ps}
