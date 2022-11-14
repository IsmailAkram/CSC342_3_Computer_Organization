.data
rt: .word 0
rs: .word 2147483648

.text
lw $s0, rs
lw $s2, rt
# rd = rs + SignExtImm
addiu $s2, $s0, 65535
sw $s2, rt
