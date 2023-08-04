# ARRAY LOOP
.data
    myArray:  .space 12 # declaration of array
    newLine:  .asciiz " "
.text
main:
    # declaration of values/integers
    addi $s0, $zero, 4
    addi $s1, $zero, 10
    addi $s2, $zero, 12
    
    # index = $t0
    addi $t0, $zero, 0 # clear the t0 register
    			# first index 0
    sw $s0, myArray($t0) # store word / value of s0 in array 
    	addi $t0, $t0, 4 # update index (1)
    sw $s1, myArray($t0) # store word / value of s1 in array
    	addi $t0, $t0, 4 # update index (2)
    sw $s2, myArray($t0) # store word / value of s3 in array 
    
    addi $t0, $zero, 0	# clear the register again before looping 
while:
    beq $t0, 12, exit
    
    lw $t6, myArray($t0)
    
    addi $t0, $t0, 4
    
    li $v0, 1
    move $a0, $t6
    syscall
    
    li $v0, 4
    la $a0, newLine
    syscall
    
    j while
exit:
    li $v0, 10
    syscall