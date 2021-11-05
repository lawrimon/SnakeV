.text

draw_point:
# draw 8x8 pixel squares
#
#   inputs:
#       -a1 = x coordinate
#       -a2 = y coordinate
#
#   output:
#       - /

addi sp,sp,-32
sw t0, 0(sp)
sw t1, 4(sp)
sw t2, 8(sp)
sw s0, 12(sp)
sw s1, 16(sp)
sw a1, 20(sp)
sw a2, 24(sp)
sw ra, 28(sp)

addi s0,a1,0 # x coordinate
addi s1,a2,0 # y coordinate

li t0, SQUARE_SIZE # loop counter
li t1,0  #counter
li t2,0  #counter


for_loop_y: #For loop to draw 8x horizontal lines
beq t0, t1, end_y #loop 8x
addi a2,a2,1 #increase y coordinate
addi t1,t1,1 #increase counter
li t2,0  #reset counter
addi a1,s0,0 #reset x coordinate
j for_loop_x

for_loop_x:  #For loop to draw horizontal lines
beq t0, t2, for_loop_y #loop 8x and jump 
addi a1,a1,1 #increase x coordinate
jal draw_pixel #draw pixel at x=a1 and y=a2
addi t2,t2,1 #increase counter
j for_loop_x

end_y:

lw t0, 0(sp)
lw t1, 4(sp)
lw t2, 8(sp)
lw s0, 12(sp)
lw s1, 16(sp)
lw a1, 20(sp)
lw a2, 24(sp)
lw ra, 28(sp)
addi sp,sp,32
ret