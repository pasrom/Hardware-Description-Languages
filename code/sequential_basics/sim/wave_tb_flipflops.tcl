onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_flipflops/rst_n
add wave -noupdate -color Red -itemcolor Red /tb_flipflops/clk50m
add wave -noupdate /tb_flipflops/d
add wave -noupdate /tb_flipflops/q
add wave -noupdate /tb_flipflops/sin
add wave -noupdate -color Yellow -itemcolor Yellow -expand -subitemconfig {{/tb_flipflops/sr[3]} {-color Yellow -height 15 -itemcolor Yellow} {/tb_flipflops/sr[2]} {-color Yellow -height 15 -itemcolor Yellow} {/tb_flipflops/sr[1]} {-color Yellow -height 15 -itemcolor Yellow} {/tb_flipflops/sr[0]} {-color Yellow -height 15 -itemcolor Yellow}} /tb_flipflops/sr
add wave -noupdate -radix unsigned /tb_flipflops/cnt
add wave -noupdate -format Analog-Step -height 74 -max 9.0 -radix unsigned /tb_flipflops/cnt
add wave -noupdate /tb_flipflops/cnt_zero
add wave -noupdate /tb_flipflops/run_sim
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {170 ns} 0}
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
WaveRestoreZoom {0 ns} {880 ns}
