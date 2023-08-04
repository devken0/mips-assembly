# Title: MP1					Filename: mp1_Gomez.asm
# Author: Mc Kennedy Gomez			Date: 10/07/2022
# Description: program will double the number that will be entered by the user.
# Input: Integer value from user
# Output: doubled value of the integer
################### Data segment #####################
.data
str1:		.asciiz		"Enter an integer value "
str2:		.asciiz		"\nYou entered "
double:		.asciiz		"\n\n(x2) = "
################### Code segment #####################
.text
.globl main
main:				# main function entry
	li	$v0, 4		# service code for print string
	la	$a0, str1	# load address of str1 into $a0	
	syscall			# print str1 string
	
	li	$v0, 5		# service code for read integer
	syscall 		# read integer input into $v0
	
	move	$t0, $v0	# save input value in $t0
	li	$v0, 4		# service code for print string
	la	$a0, str2	# load address of str2 into $a0	
	syscall			# execute
	
	li	$v0, 1		# service code to print integer
	move	$a0, $t0	# save value of $t0 into $a0
	syscall			# execute
	
	add $t0, $t0, $t0	# t0 = t0 + t0
	li $v0, 4		# service code for print string
	la $a0, double		# load address of double into $a0
	syscall			# execute
	
	move $a0, $t0		# save the value of $t0 into $a0
	li $v0, 1		# output the sum
	syscall			# execute
	
exit:				# end of program
	li 	$v0, 10				
	syscall		
	
	
