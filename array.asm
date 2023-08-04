# BASIC ARRAY
.data
    myArray:  .space 12 # 4 bytes = 1 integer, 12 bytes = 3
.text
main:
    # declaration of values/integers
    addi $s0, $zero, 4 	 # s0 = 4
    addi $s1, $zero, 10  # s1 = 10
    addi $s2, $zero, 12  # s2 = 12
    
    # index = $t0
    addi $t0, $zero, 0   # declare t0 to array index[0]
    sw $s0, myArray($t0) # store word / value of s0 in array[0] 
    	addi $t0, $t0, 4 # update index [0+1]
    sw $s1, myArray($t0) # store word / value of s1 in array[1]
    	addi $t0, $t0, 4 # update index (1+1)
    sw $s2, myArray($t0) # store word / value of s3 in array[2] 
    
    addi $t0, $zero, 0   # declare index back to zero
    addi $t0, $t0, 4     # index [0+1]
    lw $t6, myArray($t0) # access array[1] and store to t6
    
    li $v0, 1	         # instruction to print integer
    move $a0, $t6        # print integer stored in $t6
    syscall	         # execute
exit:
    li $v0, 10	
    syscall		# end of program
