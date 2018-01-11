onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_add_s/TBWIDTH
add wave -noupdate /tb_add_s/x
add wave -noupdate /tb_add_s/y
add wave -noupdate /tb_add_s/sum
add wave -noupdate /tb_add_s/of
add wave -noupdate /tb_add_s/uf
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20 ns} 0}
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
WaveRestoreZoom {0 ns} {160 ns}
