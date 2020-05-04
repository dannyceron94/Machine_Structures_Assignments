.data

.text

.globl main
main:

li $s5,1
li $s3,1

li $v0, 5
syscall

move $s0, $v0

loop:

	mul $s3,$s3,$s0
	addi $s0,$s0,-1

	bgt $s0, $s5, loop


exit:

li $v0,1
move $a0, $s3


syscall


li $v0, 10
syscall
