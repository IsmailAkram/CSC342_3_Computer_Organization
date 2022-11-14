transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Izzy/OneDrive/College/CSC342_3 Computer Organization/Labs/Lab 4/4_Memory_Blocks/ram32x4_port_3.vhd}

