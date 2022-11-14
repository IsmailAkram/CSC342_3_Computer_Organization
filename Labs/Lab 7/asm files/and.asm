.data
rs: .word 4294967295
rt: .word 4294967295
rd: .word 0
.text
lw $s0, rs
lw $s1, rt
lw $s2, rd
# rd = rs & rt
and $s2, $s0, $s1
sw $s2, rd
