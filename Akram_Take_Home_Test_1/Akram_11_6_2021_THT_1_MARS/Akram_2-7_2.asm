.data
i: .word 5
k: .word 10
save: .word 0-100
size: .word 100

.text
lw $s3, i
lw $s5, k
la $s6, save
sw $s5, 20($s6)
# save 10 in save[5]
Loop:
sll $t1, $s3, 2
# Temp reg $t1 = i * 4
add $t1, $t1, $s6
# $t1 = address of save [i]
lw $t0, 0($t1)
# Temp reg $t0 = save[i]
bne $t0, $s5, Exit
# go to Exit if save[i] != k
addi $s3, $s3, 1
# i = i + 1
j Loop
# go to Loop
Exit: