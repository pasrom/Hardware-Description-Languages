onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ds_dac_sl/DUT/clk50m
add wave -noupdate /tb_ds_dac_sl/rst_n
add wave -noupdate /tb_ds_dac_sl/clk_enable
add wave -noupdate -color Blue -itemcolor Blue /tb_ds_dac_sl/DUT/dout
add wave -noupdate -color Red -format Analog-Step -height 120 -itemcolor Red -max 65535.0 -radix unsigned -childformat {{{/tb_ds_dac_sl/DUT/din[15]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[14]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[13]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[12]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[11]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[10]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[9]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[8]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[7]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[6]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[5]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[4]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[3]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[2]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[1]} -radix unsigned} {{/tb_ds_dac_sl/DUT/din[0]} -radix unsigned}} -subitemconfig {{/tb_ds_dac_sl/DUT/din[15]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[14]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[13]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[12]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[11]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[10]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[9]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[8]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[7]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[6]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[5]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[4]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[3]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[2]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[1]} {-color Red -itemcolor Red -radix unsigned} {/tb_ds_dac_sl/DUT/din[0]} {-color Red -itemcolor Red -radix unsigned}} /tb_ds_dac_sl/DUT/din
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2492480 ns} 0} {{Cursor 2} {7495020 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 226
configure wave -valuecolwidth 75
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
WaveRestoreZoom {0 ns} {10500179 ns}
