# Title: MP10						Filename: mp10_Gomez.asm
# Author: Mc Kennedy O. Gomez				Date: 10/28/2022
# Description: This program will compute the addresses of arr2, arr3, str1,
# and str2, given that address of arr1 is 0x10010000
# Input: pre-defined statements arr1, arr2, arr3, str1, and str2
# Output: computed address of the pre-defined statements
################### Data segment #####################
.data
    arr1: .word 5:20
    arr2: .half 7, -2, 8, -6
    arr3: .space 100
    str1: .asciiz "This is a message"
    str2: .asciiz "Another important string"
################### Code segment #####################
.text
.globl main
main:				# main function entry
    
    # end program
    li $v0, 10
    syscall
