.data
rt: .word 0
rs: .word 255

.text
lw $s0, rs
lw $s2, rt
# rd = rs + SignExtImm
addi $s2, $s0, 1
sw $s2, rt
