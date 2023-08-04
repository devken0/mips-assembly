.data
outfile: .asciiz "out.txt" 
msg:	 .asciiz "This text should be written in file out.txt"
.text
.globl main
main: 
    li $v0, 13
    la $a0, outfile
    li $a1, 1
    syscall 
    move $s0, $v0
    li $v0, 15
    move $a0, $s0
    la $a1, msg
    li $a2, 43
    syscall
    li $v0, 16
    move $a0, $s0
    syscall
exit: 
    li $v0, 10
    syscall
   
