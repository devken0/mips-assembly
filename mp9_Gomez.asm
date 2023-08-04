# Title: MP9					Filename: mp9_Gomez.asm	
# Author: Mc Kennedy O. Gomez			Date: 10/19/2022
# Description: Program will enter two integers n1 & n2 then print the sum of all
#		the numbers from n1 & n2. 
# Input: two integers from the user
# Output: sum of all the numbers from the two integers
################### Data segment #####################
.data
str1: 	.asciiz	"Please enter two integers: \n"
str2:	.asciiz "The sum is: "
################### Code segment #####################
.text
.globl main
main:				# main function entry
    li $v0, 4			
    la $a0, str1
    syscall			# displays string to ask user
    
    li $v0, 5		
    syscall			# read first integer (n1)
    
    move $t1, $v0		# example: t1 = 3
    
    li $v0, 5
    syscall			# read second integer (n2)
    
    move $t2, $v0		# example: t2 = 7
    blt $t1, $t2, begin		# if t1 is less than t2, proceed to begin function
swap: # swaps the values if n1 is greater than n2, so if t1=7 and t2=3
    move $s1, $t2		# s1 = 3 (t2)
    move $s2, $t1		# s2 = 7 (t1)
    move $t1, $s1		# t1 = 3 (s1)
    move $t2, $s2		# t2 = 7 (s2)	
begin:
    addiu $t0, $t1, 0		# t0 = 3 + 0 
loop: 
    beq $t1, $t2, end		# 3 == 7   # 4 == 7   # 5 == 7    # 6 == 7    # 7 == 7, end
    addiu $t1, $t1, 1 		# t1 = 3+1 # t1 = 4+1 # t1 = 5+1  # t1 = 6+1  # 
    add $t0, $t0, $t1 		# t0 = 3+4 # t0 = 7+5 # t0 = 12+6 # t0 = 18+7 #
    j loop
end: 
    li $v0, 4
    la $a0, str2
    syscall			# display string "The sum is: "
    
    move $a0, $t0
    li $v0, 1
    syscall			# display the result integer
    
    # end program
    li $v0, 10
    syscall