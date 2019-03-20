# Write the MIPS assembly code that creates the 32-bit constant 
# 0010 0000 0000 0001 0100 1001 0010 0100 base 2 and 
# stores that value in register $t1.

# 0010 0000 0000 0001 0100 1001 0010 0100  = 0x20014924
.data
.text

.globl main
main:
#li $t0,535955172
#sw $t1,$t0

lui $t1,0x2001 #load upper immediate
#so from the  0x20014924 only 2001 is loaded 
#addi or o ri puts a constant into the leaat significant halfword
ori $t1,$t1,0x4924

li $v0,10
syscall
