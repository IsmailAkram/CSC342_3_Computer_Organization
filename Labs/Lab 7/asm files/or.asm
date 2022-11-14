.data
rs: .word 252645135
rt: .word 135138572
rd: .word 0
.text
lw $s0, rs
lw $s1, rt
lw $s2, rd
# rd = (rs | rt)
or $s2, $s0, $s1
sw $s2, rd
