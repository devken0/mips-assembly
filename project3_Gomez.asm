# Title: Project 3: Sum of Three Integers	Filename: project3_Gomez.asm
# Author: Mc Kennedy Gomez				Date: 10/06/2022
# Objective: This code computes the sum of three integers entered by the user.
# Input: read three integers/numbers
# Output: print the sum
################# Data segment #####################
.data
prompt:	.asciiz		"Please enter three numbers: \n"
result: .asciiz		"The sum is: "
################# Code segment #####################
.text
.globl main
main:				# main program entry
la $a0, prompt			# display prompt string
li $v0, 4
syscall

li $v0, 5			# read the first integer into $t0
syscall

move $t0, $v0
li $v0, 5			# read 2nd integer into $t1
syscall

move $t1, $v0
li $v0, 5			# read 3rd integer into $t2
syscall

move $t2, $v0
addu $t0, $t0, $t1
addu $t0, $t0, $t2
la $a0, result			# write sum message/ result
li $v0, 4
syscall

move $a0, $t0			# output sum
li $v0, 1
syscall

			
li $v0, 10			# exit program
syscall