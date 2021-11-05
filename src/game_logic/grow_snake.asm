

.text

grow_snake:

#   inputs:
#       -s0 = new coordinates of snake head
#       -s9 = coordinate of fruit (should be the same since grow is called if the coordinates are equal)
#   output:
#       - changed s4 vector with new head

lw t0, 0(s4) #load length of snake
addi t0,t0 ,1 #increase length of snake
sw t0, 0(s4) #store new length
slli t0,t0,2 #multiply length by 4
add t1,s4,t0 #address of last element
sw s0,0(t1) #store new coordinate to address of last element

########################################################################
#Console output
#score output in console (score = current snakelength - initial length)
lw a0,0(s4)
addi a0, a0, -3
li a7,1
ecall

li a0, 0x0A # ASCII for new line
li a7, 11
ecall

jal set_fruit #set new fruit

addi s10, s10, -1 # with every collected fruit the movement speed increases (shorter sleep ecall in _keyboard in main.asm)

lw s0, 0(sp)
lw s1, 4(sp)
lw s2, 8(sp)
lw s3, 12(sp)
lw s5, 16(sp)
lw t0,20(sp)
lw t1,24(sp)
lw t2,28(sp)
lw ra,32(sp)
addi sp, sp, 36

ret
