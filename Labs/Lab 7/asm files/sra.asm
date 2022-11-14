.data
rt: .word 4294906420
rd: .word 0
.text
lw $s1, rt
lw $s2, rd
# rd = rt >>> shamt
sra $s2, $s1, 1
sw $s2, rd
