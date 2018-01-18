onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_ds_dac/rst_n
add wave -noupdate -radix unsigned /tb_ds_dac/clk50m
add wave -noupdate -radix unsigned /tb_ds_dac/din
add wave -noupdate -radix unsigned /tb_ds_dac/dout
add wave -noupdate -radix unsigned /tb_ds_dac/run_sim
add wave -noupdate -divider dut
add wave -noupdate -radix unsigned /tb_ds_dac/dut/fdbk
add wave -noupdate /tb_ds_dac/dut/error
add wave -noupdate /tb_ds_dac/dut/integ_add
add wave -noupdate /tb_ds_dac/dut/integ_add_lim
add wave -noupdate /tb_ds_dac/dut/integ
add wave -noupdate -format Analog-Step -height 74 -max 16000.0 -min -48535.0 /tb_ds_dac/dut/integ_add
add wave -noupdate -format Analog-Step -height 74 -max 65536.0 /tb_ds_dac/dut/integ_add_lim
add wave -noupdate -format Analog-Step -height 74 -max 65536.0 /tb_ds_dac/dut/integ
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1400 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 210
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
WaveRestoreZoom {0 ns} {1430 ns}
