.data
rt: .word 1
rd: .word 0
.text
lw $s1, rt
lw $s2, rd
# rd = rt << shamt
sll $s2, $s1, 8
sw $s2, rd
