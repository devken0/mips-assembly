# Title: MIDTERM 3				Filename: midterm3_Gomez.asm
# Author: Mc Kennedy O. Gomez			Date: 11/23/2022
# Description: This program will ask the user to enter a positive integer(n)
# then print the nth number in the Fibonacci sequence.
# Input: positive integer (n)
# Output: nth Fibonacci number
################### Data segment #####################
.data
    prompt: .asciiz "Please enter the place(nth) of the number you want to display from the Fibonacci sequence: "
    resultstr1: .asciiz "\nThe "
    resultstr2: .asciiz "st/th/nd number in the Fibonacci sequence =  "
################### Code segment #####################
.text
.globl main
main: 				# main function entry
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    
    move $s0, $v0
    addi $t0, $zero, 0 # fib0 = 0
    addi $t1, $zero, 1 # fib1 = 1
    addi $s1, $zero, 2 # i = 2
    
    beq $s0, 1, fibzero
    beqz $s0, fibzero
    bge $s0, $s1, sequence
sequence:
    beq $s0, $s1, end
    add $t3, $t0, $t1
    move $t0, $t1
    move $t1, $t3
    addi $s1, $s1, 1
    j sequence
end:
    li $v0, 4
    la $a0, resultstr1
    syscall
    
    li $v0, 1
    move $a0, $s0
    syscall
    
    li $v0, 4
    la $a0, resultstr2
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 10
    syscall
fibzero:
    addi $t1, $t1, -1
    b end

