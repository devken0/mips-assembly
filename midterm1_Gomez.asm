# Title: MIDTERM 1				Filename: midterm1_Gomez.asm
# Author: Mc Kennedy Gomez			Date: 11/23/2022
# Description: This program will utilize the mul instruction to compute
# the factorial of the number (n) given by the user.
# Input: Integer (n) from the user
# Output: 32-bit factorial value (n!)
################### Data segment #####################
.data
    promptstr: .asciiz "Please enter an integer to get its factorial: "
    resultstr: .asciiz "\nThe factorial of "
    resultstr1: .asciiz " is = "
################### Code segment #####################
.text
.globl main
main:				# main function entry
    li $v0, 4
    la $a0, promptstr
    syscall			# ask integer
    
    li $v0, 5
    syscall			# get integer
    
    # place input($v0) on registers for computation
    add $t0, $zero, $v0	# t0 = v0 	
    add $t1, $zero, $t0	# t1 = t0 
    addi $t2, $t1, -1 # t2 = t1 - 1
    
compute: # loop to get factorial
    mul $t0, $t0, $t2 # t0 = t0 * t2
    addi $t2, $t2, -1 # t2 = t2 - 1
    bnez $t2, compute # if t2 is still not equal zero, loop
    
    li $v0, 4
    la $a0, resultstr
    syscall			# result prompt
    
    li $v0, 1
    move $a0, $t1
    syscall			# prints int(n) entered by user
    
    li $v0, 4
    la $a0, resultstr1
    syscall			# result prompt
    
    li $v0, 1
    add $a0, $zero, $t0
    syscall			# prints factorial (n!)
    
    # end program
    li $v0, 10
    syscall
