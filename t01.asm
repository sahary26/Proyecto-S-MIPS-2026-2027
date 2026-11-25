.data
letters: .ascii "H", "O", "L", "A",",", "M", "U", "N", "D", "O", "(", ":"
.text
read:
la $t0, letters
lw $a0, 0($t0)
srl $a1, $a0, 8
srl $a2, $a0, 16
srl $a3, $a0, 24
jal print # HOLA
addi $t0, $t0, 4
lw $a0, -4($t0) 
srl $a1, $a0, 8
srl $a2, $a0, 16
srl $a3, $a0, 24
jal print # HOLA
lb $a0, 0($t0)
lb $a1, 1($t0)
lb $a2, 2($t0)
lb $a3, 3($t0)
jal print # ,MUN
lbu $a0, 0($t0)
lbu $a1, 1($t0)
lbu $a2, 2($t0)
lbu $a3, 3($t0)
jal print # ,MUN
addi $t0, $t0, 4
lb $a0,-4($t0)
lb $a1,-3($t0)
lb $a2,-2($t0)
lb $a3,-1($t0)
jal print # ,MUN
sb $a3, 0($t0)
sb $a2, 1($t0)
sb $a1, 2($t0)
sb $a0, 3($t0)
lbu $a0, 0($t0) 
lbu $a1, 1($t0)
lbu $a2, 2($t0)
lbu $a3, 3($t0)
jal print
sll $a3, $a3, 8
sll $a2, $a2, 16
sll $a1, $a1, 24
or $a0, $a0, $a1
or $a0, $a0, $a2
or $a0, $a0, $a3
sw $a0, 0($t0)
sw $a0, -4($t0)
lb $a0, 0($t0)
lb $a1, 1($t0)
lb $a2, 2($t0)
lb $a3, 3($t0)
jal print
lb $a0, -1($t0)
lb $a1, -2($t0)
lb $a2, -3($t0)
lb $a3, -4($t0)
jal print
# END OF PROGRAM
li $v0, 10 
syscall

print:
li $v0, 11
syscall
add $s0, $a0, $zero
li $v0, 11
add $a0, $a1, $zero
syscall
li $v0, 11
add $a0, $a2, $zero
syscall
li $v0, 11
add $a0, $a3, $zero
syscall
add $a0, $s0, $zero
jr $ra


