onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ds_dac_sl/DUT/clk50m
add wave -noupdate -color Red -format Analog-Step -height 74 -itemcolor Red -max 2000.0 -radix unsigned /tb_ds_dac_sl/DUT/din
add wave -noupdate /tb_ds_dac_sl/rst_n
add wave -noupdate /tb_ds_dac_sl/clk_enable
add wave -noupdate -color Blue -itemcolor Blue /tb_ds_dac_sl/DUT/dout
add wave -noupdate /tb_ds_dac_sl/DUT/ce_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {704030 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 226
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
configure wave -timeline 1
configure wave -timelineunits ms
update
WaveRestoreZoom {0 ns} {4200095 ns}
