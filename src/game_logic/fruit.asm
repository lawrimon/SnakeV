
.text

set_fruit:
#   inputs:
#       - /
#
#   output:
#       - s9/a0 coordinates of fruit


addi sp, sp, -24
sw t0, 0(sp)
sw t1, 4(sp)
sw t2, 8 (sp)
sw t3, 12(sp)
sw t4, 16(sp)
sw ra, 20(sp)

#a1 = upper bound for random number
li t4,8
li a1,RIGHTBORDER
divu a1,a1,t4 #divide by 4 to check with 64x64 coordinates
li t0,LEFTBORDER
addi t0,t0,1 #set minimum x coordinate for fruit

for_random_x:
li a7,42
ecall #returns random int to a0
slli t3,a0,3
bge t3,t0,end_random_x 
j for_random_x

end_random_x:
addi t1,a0,0 #store x coordinate
li a1,BOTTOMBORDER
divu a1,a1,t4
li t0,TOPBORDER
addi t0,t0,1 #set minimum y coordinate for fruit
j for_random_y

for_random_y:
li a7,42
ecall #returns random int to a0
slli t3,a0,3
bge t3,t0,end_random_y
j for_random_y

end_random_y:
addi t2,a0,0 #store y coordinate

# safe coordinates in 32 bit

slli t1,t1,16 #y coordinate
or s9,t1,t2 #connect coordinates to 32bit

addi a0,s9,0
li a3, 0xFF0000
jal convert_coord
jal draw_point

lw t0, 0(sp)
lw t1, 4(sp)
lw t2, 8 (sp)
lw t3, 12(sp)
lw t4, 16(sp)
lw ra, 20(sp)
addi sp, sp, 24
ret

