.data
rt: .word 0
rs: .word 252645135

.text
lw $s0, rs
lw $s2, rt
# rt = rs & ZeroExtImm
ori $s2, $s0, 28784
sw $s2, rt
