.data
rt: .word 16777216
rd: .word 0
.text
lw $s1, rt
lw $s2, rd
# rd = rt >> shamt
srl $s2, $s1, 1
sw $s2, rd
