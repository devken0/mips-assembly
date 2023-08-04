# Title: MP8					Filename: mp8_Gomez.asm
# Author: Mc Kennedy O. Gomez			Date: 10/19/2022
# Description: Program will ask an integer then display the number of 1's in the
#		binary representation of that integer.
# Input: An integer from the user
# Output: number of 1's from the binary representation of that integer
################### Data segment #####################
.data
str1:	.asciiz "Please enter an integer: \n"
str2:	.asciiz "\nThe number you have entered has ("
str3:	.asciiz ") 1's based on its binary representation."
################### Code segment #####################
.text
.globl main
main:				# main function entry
    li $v0, 4
    la $a0, str1
    syscall			# display string to ask user
    
    li $v0, 5			
    syscall			# read integer
    
    move $t1, $v0
loop:				
    beqz $t1, end		# if quotient is equal zero, end the loop
    div $t1, $t1, 2		# t1 = t1 / 2
    mflo $t1			# move quotient to t1
    mfhi $t2			# move remainder t2
    beqz $t2, continue          # if remainder is zero, ignore next line
    addiu $t3, $t3, 1		# if remainder is one, increment t3
continue: 
    j loop    
end:
    li $v0, 4
    la $a0, str2
    syscall			# display first block of string
   
    move $a0, $t3
    
    li $v0, 1			
    syscall			# display the result integer
        
    li $v0, 4
    la $a0, str3
    syscall			# display the second block of string
    
    # end program
    li $v0, 10
    syscall
