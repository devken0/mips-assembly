# Title: PR3: FILE					Filename: project3_file_Gomez.asm
# Author: Mc Kennedy O. Gomez				Date: 01/02/2022
# Description: This program will write a string to an output file.
# Input: the text to be written on the file
# Output: the output txt file
################### Data segment #####################
.data
    outfile: .asciiz "out.txt" 
    msg:     .asciiz "This text should be written in file out.txt"
################### Code segment #####################
.text
.globl main
main:				# main function entry
    li $v0, 13			# service to open a file
    la $a0, outfile		# load the file name
    li $a1, 1			# write only with create
    syscall 			# execute
    move $s0, $v0		# $s0 = file descriptor
    li $v0, 15			# service to write to file	
    move $a0, $s0		# $a0 = file descriptor
    la $a1, msg			# load the output text
    li $a2, 43			# number of characters to write
    syscall			# execute
    li $v0, 16			# service to close file
    syscall			# execute
exit:  			        # end program
    li $v0, 10
    syscall
