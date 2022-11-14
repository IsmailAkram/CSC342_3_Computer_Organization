.data
rs: .word 2147483648
rt: .word 65281
rd: .word 0
.text
lw $s0, rs
lw $s1, rt
lw $s2, rd
# rd = rs + rt
addu $s2, $s0, $s1
sw $s2, rd
