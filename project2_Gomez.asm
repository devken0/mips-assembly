# Title: Project 2: Reading and Printing Integer	Filename: project2_Gomez.asm
# Author: Mc Kennedy Gomez				Date: 10/06/2022
# Description: This code reads and displays an integer entered by the user.
# Input: read integer
# Output: print integer
################# Data segment #####################
.data
################# Code segment #####################
.text
.globl main
main:				# main program entry
li $v0, 5			# read integer
syscall

move $a0, $v0			# $a0 value to print
li $v0, 1			# print integer
syscall

li $v0, 10			# exit program
syscall