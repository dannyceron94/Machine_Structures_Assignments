
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
str: .asciiz "1234/67" #char str[]
space: .asciiz "\n"


.text

.globl main
main:
li $t0,0
li $t1,5
li $t2,10
la $a1,str                  #a0 = str
li $s1,0                    #end value holder
loop:	
	lbu  $s2,0($a1)     #lbu $s2,0($a1). s2 = a1[i]
	addi $a1,$a1,1      #i+1/
	beqz $s2,exit 	    #if char[0]=null then exit.
	addi $s2,$s2,-48    #adjust ascii to actual number
	
	
#	blt  $s2,$zero,loop #jumps back to the loop if the value is less than zero in case there
			    #is non interger on the string 
	
	blt $s2,$zero,exit #if the value is >0, the exit.
	
	#----------------adding each degit to the total value------------------------
	mul   $s1,$s1,$10 #making space for the following coming digit.
	add  $s1,$s1,$s2
	#---------------------------------------------------------------------------
	move $a0,$s2 
	
	
	li $v0,1            #printing chars
	syscall
	
	li $v0,4	    #print "\n"
	la $a0, space
	syscall
	
	addi $t0,$t0,1	    #counter not really needed 

	j loop		    #back to the loop

exit:

li $v0,1
move $a0,$s1
syscall 

li $v0,10
syscall