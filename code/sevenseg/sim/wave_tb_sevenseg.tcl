onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /tb_sevenseg/bin
add wave -noupdate -color Blue -itemcolor Blue -expand -subitemconfig {{/tb_sevenseg/hex[6]} {-color Blue -height 15 -itemcolor Blue} {/tb_sevenseg/hex[5]} {-color Blue -height 15 -itemcolor Blue} {/tb_sevenseg/hex[4]} {-color Blue -height 15 -itemcolor Blue} {/tb_sevenseg/hex[3]} {-color Blue -height 15 -itemcolor Blue} {/tb_sevenseg/hex[2]} {-color Blue -height 15 -itemcolor Blue} {/tb_sevenseg/hex[1]} {-color Blue -height 15 -itemcolor Blue} {/tb_sevenseg/hex[0]} {-color Blue -height 15 -itemcolor Blue}} /tb_sevenseg/hex
add wave -noupdate -color Red -itemcolor Red -expand -subitemconfig {{/tb_sevenseg/hex_n[6]} {-color Red -height 15 -itemcolor Red} {/tb_sevenseg/hex_n[5]} {-color Red -height 15 -itemcolor Red} {/tb_sevenseg/hex_n[4]} {-color Red -height 15 -itemcolor Red} {/tb_sevenseg/hex_n[3]} {-color Red -height 15 -itemcolor Red} {/tb_sevenseg/hex_n[2]} {-color Red -height 15 -itemcolor Red} {/tb_sevenseg/hex_n[1]} {-color Red -height 15 -itemcolor Red} {/tb_sevenseg/hex_n[0]} {-color Red -height 15 -itemcolor Red}} /tb_sevenseg/hex_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {465780 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {4 ns} {1684 ns}
