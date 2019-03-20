#""int f(int a, int b, int c, int d) {
#return func(func(a,b),c+d);
#}
.data
.text
.globl main
main:

	li $t0,0            # temp values stored on the stack
	li $t1,0            # temp values stored on the stack
	li $t2,0            # c
	li $t3,0            # d
	li $t4,0            # a
	li $t5,0            # b

	jal f
	li $v0,10
    syscall


f:  #f(a,b,c,d)	

	add $t1,$t2,$t3     # t1 = c+d

	sub $sp,$sp,8       # each call the stack goes down by 8
	sw  $ra,0($sp)      # store the return value on stack
	sw  $t1,4($sp)      # store a on stack

	jal func

	move $t0,$v0       #t0 = func(a,b)

	lw $t1,4($sp)      #load from stack a0 =c+d

	jal	func           # call the func(function)

	lw $ra,0($sp)       #load address
	add $sp,$sp,8		#pops the stack

	jr $ra
	
func:

	#someing
	jal f
	#something
	jr $ra

