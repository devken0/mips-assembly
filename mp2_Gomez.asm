# Title: MP2					 Filename: mp2_Gomez.asm
# Author: Mc Kennedy Gomez			 Date: 10/07/2022
# Description: program will now ask the user to repeat the program
# Input: y or n
# Output: display/repeat the program again
################### Data segment #####################
.data
str1:		.asciiz		"Enter an integer value "
str2:		.asciiz		"\nYou entered "
repeat:		.asciiz		"\nRepeat [y/n]?"
answer:		.space		256
################### Code segment #####################
.text
.globl main 
main:			# main function entry
    li	$v0, 4		# service code for print string
    la	$a0, str1	# load address of str1 into $a0	   
    syscall		# execute
	
    li	$v0, 5		# service code for read integer
    syscall 		# read integer input into $v0
    
    move $s0, $v0	# save input value in $s0
    li	$v0, 4		# service code to print string
    la	$a0, str2	# load address of str2 into $a0
    syscall		# execute
	
    li	$v0, 1		# print out the integer
    move $a0, $s0	# move $t0 to $a0 to be displayed
    syscall		# execute
	
    li	$v0, 4		# service code to print string
    la 	$a0, repeat 	# load address of repeat into $a0
    syscall		# execute
	
    li	$a1,  4		# declare size of input character
    li	$v0,  8		# read character/string from user
    la	$a0,  answer	# load address of answer into $a0
    move $s0, $v0	# save input value in $s0
    syscall		# execute
	
    lb $s0, 0($a0)	# load bytes 
    beq $s0, 'y', main	# check equality

exit:			# end of program
    li 	$v0, 10		
    syscall		
	
	
