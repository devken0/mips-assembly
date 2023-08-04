# Title: MP5					Filename: mp5_Gomez.asm
# Author: Mc Kennedy O. Gomez			Date: 10/14/2022
# Description: asks the user to enter two integers A and B and then display the result of computing the expression: A + 2B - 5 
# Input: two integers 
# Output: result of expression A + 2B - 5
################### Data segment #####################
.data
str1:	.asciiz	"Please enter two integer values: \n"
str2:   .asciiz	"The answer is: "
################### Code segment #####################
.text
.globl main
main:				# main function entry
    li $v0, 4
    la $a0, str1
    syscall			# asking two integers
    
    li $v0, 5
    syscall			# get first integer

    move $t1, $v0		# $t1 = A
    li $v0, 5
    syscall			# get second integer
    
    move $t2, $v0		# $t2 = B
    sll $t2, $t2, 1		# multiply second integer, 2(B)
    
    addu $t3, $t1, $t2		# add to first integer, (A + B)
    subiu $t4, $t3, 5		# then subtract to 5, (A + B) - 5
    
    li $v0, 4
    la $a0, str2
    syscall			# display string "the answer is: "
    
    move $a0, $t4
    li $v0, 1
    syscall			# display result of expression
    
    # end program
    li $v0, 10
    syscall
