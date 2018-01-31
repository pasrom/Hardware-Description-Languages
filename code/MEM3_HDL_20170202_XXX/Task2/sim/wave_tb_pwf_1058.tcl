onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_pwf_1058/clk4m
add wave -noupdate /tb_pwf_1058/rst_n
add wave -noupdate /tb_pwf_1058/a
add wave -noupdate /tb_pwf_1058/c
add wave -noupdate -color blue -format Analog-Step -height 74 -itemcolor blue -max 14.0 -radix unsigned -expand -subitemconfig {{/tb_pwf_1058/DUT/sw_hi_cnt[3]} {-color blue -height 15 -itemcolor blue} {/tb_pwf_1058/DUT/sw_hi_cnt[2]} {-color blue -height 15 -itemcolor blue} {/tb_pwf_1058/DUT/sw_hi_cnt[1]} {-color blue -height 15 -itemcolor blue} {/tb_pwf_1058/DUT/sw_hi_cnt[0]} {-color blue -height 15 -itemcolor blue}} /tb_pwf_1058/DUT/sw_hi_cnt
add wave -noupdate /tb_pwf_1058/run_sim
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3875 ns} 0}
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
WaveRestoreZoom {0 ns} {7481 ns}
