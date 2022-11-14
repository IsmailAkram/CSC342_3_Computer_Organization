.data
rt: .word 0
rs: .word 268435440

.text
lw $s0, rs
lw $s2, rt
# rt = rs & ZeroExtImm
andi $s2, $s0, 65535
sw $s2, rt
