# Title: MP6					Filename: mp6_Gomez.asm
# Author: Mc Kennedy O. Gomez			Date: 10/14/2022
# Description: execute instructions to determine and verify the content of $s3 to $s6
# Input: $s1 = 0x12345678 and $s2 = 0xffff9a00
# Output: content in $s3 - $s6
################### Data segment #####################
.data
. . .
################### Code segment #####################
.text
.globl main
main:				# main function entry
    li $s1, 0x12345678		# initialize registers
    li $s2, 0xffff9a00		# initialize registers
    
    and $s3, $s1, $s2		# 0x12341200
    or $s4, $s1, $s2		# 0xffffde78
    xor $s5, $s1, $s2 		# 0xedcbcc78
    nor $s6, $s1, $s2		# 0x00002187
    
    # end program
    li $v0, 10
    syscall
