#	Mc Kennedy O. Gomez	BSIT-NS-2CD	1st Project in Computer Architecture	10/01/2022
	.data
mymessage:	.ascii "Hello, World!\n"
	.text
	.globl main
	
main:	
	la	$a0, mymessage
	li	$v0, 4
	syscall
	li 	$v0, 10
	syscall
