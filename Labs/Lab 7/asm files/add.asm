.data
rs: .word 15
rt: .word 1
rd: .word 0
.text
lw $s0, rs
lw $s1, rt
lw $s2, rd
# rd = rs + rt
add $s2, $s0, $s1
sw $s2, rd
