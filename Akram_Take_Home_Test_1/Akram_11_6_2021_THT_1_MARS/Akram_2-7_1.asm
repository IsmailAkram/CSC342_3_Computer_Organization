.data
f: .word 1
g: .word 50
h: .word 40
i: .word 30
j: .word 20
.text
lw $s0, f
lw $s1, g
lw $s2, h
lw $s3, i
lw $s4, j
bne $s3, $s4, Else
# go to Else if i != j
add $s0, $s1, $s2
# f = g + h (skipped if i = j)
j Exit
# go to Exit
Else:
sub $s0, $s1, $s2
# f = g - h (skipped if i = j)
Exit: