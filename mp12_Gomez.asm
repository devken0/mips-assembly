# Title: MP12 					Filename: mp12_Gomez.asm
# Author: Mc Kennedy O. Gomez			Date: 11/12/2022
# Description: This program will perform integer multiplication
# Input: a.) 98765×54321 using the multu instruction
#	 b.) -98765×-54321 using the mult instruction  
# Output: value of LO and HI registers
################### Data segment #####################
.data
    newLine: .asciiz "\n" 
################### Code segment #####################
.text
.globl main
main:				# main function entry
    addi $s1, $zero, 98765
    addi $s2, $zero, 54321
    addi $s3, $zero, -98765
    addi $s4, $zero, -54321	
    
    multu $s1, $s2
    mflo $t0
    mfhi $t1
    
    mult $s3, $s4
    mflo $t2
    mfhi $t3
    
    li $v0, 1
    add $a0, $zero, $t0
    syscall
    
    li $v0, 4
    la $a0, newLine
    syscall
    
    li $v0, 1
    add $a0, $zero, $t1
    syscall
    
    li $v0, 4
    la $a0, newLine
    syscall
    
    li $v0, 1
    add $a0, $zero, $t2
    syscall
    
    li $v0, 4
    la $a0, newLine
    syscall
    
    li $v0, 1
    add $a0, $zero, $t3
    syscall
    
    # end program
    li $v0, 10
    syscall
