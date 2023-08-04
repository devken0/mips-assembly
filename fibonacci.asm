# Title: MIDTERM 3				Filename: midterm3_Gomez.asm
# Author: Mc Kennedy O. Gomez			Date: 11/23/2022
# Description: This program will ask the user to enter a positive integer(n)
# then print the nth number in the Fibonacci sequence.
# Input: positive integer (n)
# Output: nth Fibonacci number
################### Data segment #####################
.data
    fibonacciArr: .space 1000
    prompt: .asciiz "Please enter the place(nth) of the number you want to display from the Fibonacci sequence: "
    resultstr1: .asciiz "\nThe "
    resultstr2: .asciiz "st/th/nd number in the Fibonacci sequence is = "
################### Code segment #####################
.text
.globl main
main: 				# main function entry
    li $v0, 4
    la $a0, prompt
    syscall
    
    li $v0, 5
    syscall
    
    move $s0, $v0 		# move user input
    add $s3, $zero, $s0 	# move user input for result later
    
    addi $t0, $zero, 0		# index = 0
    addi $s1, $zero, 0 		# i = 0
    addi $t1, $zero, 0 		# first fib number = 0
    beqz $s0, end	
    sw $t1, fibonacciArr($t0)   # store fib number in array		
    addi $t1, $zero, 1
    addi $t0, $t0, 4		
    sw $t1, fibonacciArr($t0)   # store fib number in array  
fibonacciSeq:
    lw $t1, fibonacciArr($t0)
    addi $t0, $t0, -4
    lw $t2, fibonacciArr($t0)
    add $t3, $t1, $t2
    addi $t0, $t0, 8
    sw $t3, fibonacciArr($t0)
    addi $s1, $s1, 1
    bne $s1, $s0, fibonacciSeq

    addi $t0, $zero, 0
    addi $s1, $zero, 0
next:
    beq $s0, $s1, end
    lw $s4, fibonacciArr($t0)
    addi $t0, $zero, 4
    addi $s1, $s1, 1
    j next
end:
    li $v0, 4
    la $a0, resultstr1
    syscall    
    
    li $v0, 1
    move $a0, $s3
    syscall
    
    li $v0, 4
    la $a0, resultstr2
    syscall
    
    li $v0, 1
    move $a0, $s4
    syscall
exit:
    # end program
    li $v0, 10
    syscall

