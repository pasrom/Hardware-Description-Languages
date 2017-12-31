onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Simulation
add wave -noupdate /tb_counter_updn/clk50m
add wave -noupdate /tb_counter_updn/run_sim
add wave -noupdate -divider Inputs
add wave -noupdate -color Red -itemcolor Red /tb_counter_updn/rst_n
add wave -noupdate /tb_counter_updn/en
add wave -noupdate -color blue -itemcolor blue /tb_counter_updn/down
add wave -noupdate -divider Outputs
add wave -noupdate -color {Orange Red} -format Analog-Step -height 74 -itemcolor {Orange Red} -max 63.0 -radix unsigned -expand -subitemconfig {{/tb_counter_updn/cnt[5]} {-color {Orange Red} -itemcolor {Orange Red}} {/tb_counter_updn/cnt[4]} {-color {Orange Red} -itemcolor {Orange Red}} {/tb_counter_updn/cnt[3]} {-color {Orange Red} -itemcolor {Orange Red}} {/tb_counter_updn/cnt[2]} {-color {Orange Red} -itemcolor {Orange Red}} {/tb_counter_updn/cnt[1]} {-color {Orange Red} -itemcolor {Orange Red}} {/tb_counter_updn/cnt[0]} {-color {Orange Red} -itemcolor {Orange Red}}} /tb_counter_updn/cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {720 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 213
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
WaveRestoreZoom {0 ns} {6790 ns}
