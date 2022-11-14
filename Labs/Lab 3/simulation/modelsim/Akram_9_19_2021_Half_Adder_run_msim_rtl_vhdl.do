transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Izzy/OneDrive/College/CSC342_3 Computer Organization/Labs/Lab 3/Akram_9_19_2021_Half_Adder.vhd}

