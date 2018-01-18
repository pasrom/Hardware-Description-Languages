onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_rom_addr16bit/address
add wave -noupdate -format Analog-Step -height 74 -max 1023.0000000000001 -radix unsigned /tb_rom_addr16bit/address
add wave -noupdate /tb_rom_addr16bit/clock
add wave -noupdate -radix unsigned /tb_rom_addr16bit/q
add wave -noupdate -format Analog-Step -height 160 -max 65535.0 -radix unsigned /tb_rom_addr16bit/q
add wave -noupdate /tb_rom_addr16bit/run_sim
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 177
configure wave -valuecolwidth 76
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
WaveRestoreZoom {0 ps} {31631231 ps}
