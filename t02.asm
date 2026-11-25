.data
array: .word 10, 5, 3, 4, 7, 6, 8
end: 
.text
la $t0, array
la $t1, end
add $a0, $t0, $zero
addi $a1, $t1, -4
jal min
add $a0, $t0, $zero
jal imprimir_hex
li $v0, 10
syscall

min:
addi $sp, $sp, -4
sw $ra, 4($sp)
lw $t0, 0($a0)
beq $a0, $a1, min_end
addi $sp, $sp, -4
sw $t0, 4($sp)
addi $a0, $a0, 4
jal min
addi $sp, $sp, 4
lw $t1, 0($sp)
slt $at, $t1, $t0
beq $at, $zero, min_end
add $t0, $t1, $zero
min_end: 
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

# imprime $a0 en hexadecimal (8 digitos) seguido de un espacio
imprimir_hex:
        add  $t0, $a0, $zero
        addi $t1, $zero, 8
ih_bucle:
        srl  $t2, $t0, 28            # digito mas significativo
        slti $t3, $t2, 10
        beq  $t3, $zero, ih_letra
        addi $a0, $t2, 48            # '0' + d
        j    ih_imprime
ih_letra:
        addi $a0, $t2, 87            # 'a' + d - 10
ih_imprime:
        addi $v0, $zero, 11
        syscall
        sll  $t0, $t0, 4
        addi $t1, $t1, -1
        bne  $t1, $zero, ih_bucle
        addi $a0, $zero, 32          # espacio
        addi $v0, $zero, 11
        syscall
        jr   $ra

nueva_linea:
        addi $a0, $zero, 10
        addi $v0, $zero, 11
        syscall
        jr   $ra

