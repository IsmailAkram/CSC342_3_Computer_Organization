.data
a: .word 4
b: .word 15
c: .word 0
.text
lw $a0, a
lw $a1, b
lw $s0, c
jal myadd
add $s0, $zero, $v0
sw $s0, c
j Exit
myadd:
	add $v0, $a0, $a1
	jr $ra
Exit:
