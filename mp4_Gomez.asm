# Title: MP4					Filename: mp4_Gomez.asm
# Author: Mc Kennedy Gomez			Date: 10/07/2022
# Description: ask the user to input two integers and check the equality of integers
# Input: two integers from user
# Output: output equal if two integers are equal and not equal if not
################### Data segment #####################
.data
str1:	.asciiz		"Enter two integer values: \n"
str2:	.asciiz		"You entered "
str3:   .asciiz		" and "
equal:  .asciiz		"\nThey are equal."
noteq:  .asciiz		"\nThey are not equal."
################### Code segment #####################
.text
.globl main
main:			# main function entry
    li	$v0, 4		# service code for print string
    la	$a0, str1	# load address of str1 into $a0
    syscall		# execute
    
    li	$v0, 5		# service code for read integer
    syscall		# execute
    
    move $s0, $v0	# save input value into $s0
    li	$v0, 5		# service code for read integer
    syscall		# execute
    
    move $s1, $v0	# save input value into $s1
    li	$v0, 4		# service code for print string
    la	$a0, str2	# load address of str2 into $a0
    syscall		# execute
    
    li	$v0, 1		# service code to print integer
    move $a0, $s0	# save input value into $a0
    syscall		# execute	
    
    li	$v0, 4		# service code for print string
    la	$a0, str3	# load address of str2 into $a0
    syscall		# execute
    
    li	$v0, 1		# service code to print integer
    move $a0, $s1	# save input value into $a0
    syscall		# execute	

    beq $s0, $s1, ifequal
 
    li	$v0, 4		# service code for print string
    la	$a0, noteq	# load address of equal into $a0
    syscall		# execute
    
exit:			# end program	
    li $v0, 10
    syscall 
ifequal:
    li	$v0, 4		# service code for print string
    la	$a0, equal	# load address of equal into $a0
    syscall		# execute
    
    b exit
    

