# Title: MP7					Filename: mp7_Gomez.asm
# Author: Mc Kennedy O. Gomez			Date: 10/14/2022
# Description: execute instructions to determine and verify the content of $s2 to $s4
# Input: $s1 = 0x87654321
# Output: contents of $s2 to $s4
################### Data segment #####################
.data
. . .
################### Code segment #####################
.text
.globl main
main:				# main function entry
    li $s1, 0x87654321		# initialize registers
    
    sll $s2, $s1, 16		# 0x43210000
    srl $s3, $s1, 8		# 0x00876543
    sra $s4, $s1, 12		# 0xfff87654
    
    # end program
    li $v0, 10
    syscall
