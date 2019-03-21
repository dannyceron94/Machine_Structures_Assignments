
#Write a program in MIPS assembly language to convert an ASCII number string containing 
#positive and negative integer decimal strings, to an integer. 
#Your program should expect register $a0 to hold the address of a null terminated string
#containing some combination of the digits 0 through 9. 
#Your program should compute the integer value equivalent to this string of digits,
#then place the number in register $v0. 
#If a non-digit character appears anywhere in the string, 
#your program should stop with the value ?1 in register $v0. 
#For example, if register $a0 points to a sequence of three bytes 50 base 10, 52 base 10,
#0 base 10 (the null terminated string “24
#then when the program stops, register $v0 should contain the value 24 base 10.
.data
str: .asciiz "12344" #char str[]

.text

.globl main
main:
loop:
	la$s1,str #a0 = str
	lb $s2,($s1)
	#lbu $s0,0($s1) #s0 = s1[i]
	move $a0,$s2
	li $v0,11 #printing chars
	syscall
	addi $s1,$s1,1
	
	bne $s1,$0,loop





li $v0,10
syscall