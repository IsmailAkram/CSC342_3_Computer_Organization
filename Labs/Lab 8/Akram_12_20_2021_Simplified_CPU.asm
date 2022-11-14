.data
list: .word 1, 2, 3, 4, 5

.text
li $t0, 0x00000000  # initializing a loop counter to $t0
li $t4, 0x00000005  # last index of the array
li $t3, 0x00000000  # register for final sum
la $t1, list  # Register containing address of list[0]

loop: 
  lw $t2, 0($t1)   # load list[index] into $t2
  add $t3, $t3, $t2 # $t3 = $t3 + $t2 ... compute the sum
  add $t1, $t1,0x00000004
  add $t0, $t0,0x00000001
  beq $t0, $t4, end
  j loop

end: