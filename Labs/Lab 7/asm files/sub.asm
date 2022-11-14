.data
rs: .word 19088743
rt: .word 591751049
rd: .word 0
.text
lw $s0, rs
lw $s1, rt
lw $s2, rd
# rd = rs - rt
sub $s2, $s0, $s1
sw $s2, rd
