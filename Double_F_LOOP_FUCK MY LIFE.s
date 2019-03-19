#for(i=0; i<a; i++)
	#for(j=0; j<b; j++)	
		#D[4*j] = i + j;


.data

msg1: .asciiz "Double for loop:\n"
msg2: .asciiz "\n"

array: .word 0

.text

.globl main

main:
li $t0,5
li $t1,5
li $s0, 0#i
li $s1, 0#j
li $s2, 0
li $s3, 0
li $s4, 0

la $t3, array#array is now in t3
#Ptr msg1
li $v0,4
la $a0,msg1
syscall
 
 
loop: 
	
	loop2:
		
#		li $v0, 1
#		move $a0, $s1
#		syscall
#
#		li $v0,4
#		la $a0,msg2
#		syscall
#
#		addi $s1,$s1,1

		add $t2,$s0,$s1#i+j

		sll $t4,$s0,4#4*j

		add $t5,$t4,$t3#D[4*j]

		sw $t2,0($t5)#D[4*j] = i+j

	blt	$s1,$t1,loop2
	li $s1,0# reset j =0

#	li $v0,4
#	la $a0,msg2
#	syscall

	addi $s0,$s0,1
blt $s0,$t0, loop
li $s0,0# reset i = 0


li $v0, 10
syscall
