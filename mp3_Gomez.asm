# Title: MP3					 Filename: mp3_Gomez.asm
# Author: Mc Kennedy Gomez			 Date: 10/07/2022
# Description: program will ask the user to enter their name and display "Hello, + name of user"
# Input: name
# Output: Hello, name
################### Data segment #####################
.data
str0:	.asciiz		"Please type your name: "
str1:	.asciiz		"Please enter an integer value: "
str2:	.asciiz		"You entered "
hello:	.asciiz		"Hello, "
buffer:	.space		 20 # Kennedy
################### Code segment #####################
.text
.globl main 
main:			# main function entry
    li 	$v0, 4		# service code for print string
    la	$a0, str0	# load address of str0 into $a0
    syscall
	
    li	$v0, 8		# service code to read string
    li	$a1, 20		# set size
    la	$a0, buffer	# load address of buffer into $a0
    syscall
	
    li	$v0, 4		# service code for print string
    la	$a0, str1	# load address of str1 into $a0	
    syscall		# execute
	
    li	$v0, 5		# service code for read integer
    syscall 		# execute

    move $s0, $v0	# save input value of $v0 into $s0
    
    li	$v0, 4		# service code for print string
    la	$a0, hello	# load address of hello into $a0
    syscall		# execute
	
    li	$v0, 4		# service code for print string
    la	$a0, buffer	# load address of buffer into $a0
    syscall		# execute
	
    li	$v0, 4		# service code for print string 
    la	$a0, str2	# load address of str2 into $a0
    syscall		# execute
	
    li	$v0, 1		# print out the integer
    move $a0, $s0	# move $t0 to $a0 to be displayed
    syscall		# execute
	
exit:			# return/exit program	
    li 	$v0, 10		
    syscall		
	
	
