# Title: MP11					Filename: mp11_Gomez.asm
# Author: Mc Kennedy O. Gomez			Date: 10/28/2022
# Description: This program defines a one-dimensional array of 10 integers
# in the static area of the data segment, ask the user to input all 10
# array elements, computes, and displays the sum
# Input: 10 user integer
# Output: the sum of all the elements in the array 
################### Data segment #####################
.data
    array: .space 40 # 10 integers
    prompt: .asciiz "Please enter 10 integers:\n"
    resultstr: .asciiz "\nThe sum is: "    
################### Code segment #####################
.text
.globl main
main:		# main function entry
    addi $t0, $zero, 0	# initialize array index to 0    	
    li $v0, 4		# service code to print string
    la $a0, prompt	# load this string
    syscall		# execute
while:			# while loop for getting 10 integers from user
    beq $t1, 10, end	# end if t1 = 10
    addi $t1, $t1, 0	# declare t1 = 0
    li $v0, 5		# service code to get integer
    syscall
    move $s0, $v0	# move the integer to $s0
    sw $s0, array($t0)	# place that value in the array
    addi $t0, $t0, 4	# increment index +1
    addi $t1, $t1, 1	# increment t1 + 1
    j while 		# loop
end:
    addi $t0, $zero, 0	# initialize the index to zero again
next: 			# loop to add all integers
    beq $t0, 40, continue	# proceed to continue after 10 integers are computed
    lw $t2, array($t0)		# load the value from array index[0]
    addi $t0, $t0, 4		# increment index +1
    add $s1, $s1, $t2		# $s1 = $s1 + $t2
    j next			# loop
continue:	
    li $v0, 4		# service code to print string			
    la $a0, resultstr	# print "The sum is:"
    syscall 		# execute
    
    li $v0, 1		# service code to print integer
    move $a0, $s1	# move result to $a0 
    syscall		# execute
exit:
    # end program
    li $v0, 10
    syscall
