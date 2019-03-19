.data
.text
.globl main
main:


li $t4,1                           #t4 = 1
li $a0,6
li $v1,0
	fib:	
		bgt  $a0,1,fib_Recursive   # this will take care of both if and ifelse
								   # if the value is less than 1 it will return that value
		move $v0, $a0
		jr   $ra

fib_Recursive:
	sub  $sp,$sp,12					# 3 registers used, 3*4 = 12, each call it moves 12 downs the stack
	sw   $ra,0($sp)					# save ra on the stack
	sw   $s0,4($sp)					#save s0
	move $s0,$a0					#n

	addi $a0,$a0,-1					# n-1
	jal  fib						#??
	sw   $v0,8($sp)					# stores the return value of n-1

	addi $a0,$s0,-2					#n-2
	jal fib
	lw  $t0,8($sp)					#t = fib(n-1)
	add $v1,$v1,$t0                   #new return fib(n-1)+fib(n-2)

	#this happens when the base returns the values.
	lw  $s0,4($sp)			#restore $s0
	lw  $ra,0($sp)			#restore $ra
	add $sp,$sp,12			#pops the stack
	jr  $ra					# return to the caller the main in this case

li $v0, 10
syscall