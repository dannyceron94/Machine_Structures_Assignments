.data

.text

.globl main
main:

li $s0,1
li $s1,2
li $s4,3
li $s5,4

#part a1
mul $s0,$s0,$s0
mul $s4,$s4,$s4

mul $t0,$s1,$s1
mul $t0,$t0,$s1

mul $t1,$s5,$s5
mul $t1,$t1,$s5

sub $t2,$s0,$t0
sub $t3,$s4,$t1

add $t4,$t2,$t3

li $v0,1

move $a0,$t4
syscall

#b1
#li $s0,5
#li $s1,6
#li $s4,7
#li $s5,8



mul $t0,$t0,-1
mul $t1,$t1,-1

add $t5,$s0,$t0
add $t5,$t5,$s4
add $t5,$t5,$t1

li $v0,1
move $a0,$t5
syscall

li $s0,5
li $s1,6
li $s4,7
li $s5,8

mul $t0,$s0,$s0# 5*5
mul $t0,$t0,$s0# 25*5
mul $t1,$s4,$s4# 7*7
mul $t1,$t1,$s4# 49*7

mul $s1,$s1,$s1
mul $s5,$s5,$s5

mul $s5,$s5,-1
mul $s1,$s1,-1

add $t9,$t0,$s1
add $t9,$t9,$t1
add $t9,$t9,$s5

li $v0,1
move $a0,$t9
syscall

li $v0, 10
syscall