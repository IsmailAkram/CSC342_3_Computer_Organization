.data
rs: .word 134744072
rt: .word 117901063
rd: .word 0
.text
lw $s0, rs
lw $s1, rt
lw $s2, rd
# rd = ~ (rs | rt)
nor $s2, $s0, $s1
sw $s2, rd
