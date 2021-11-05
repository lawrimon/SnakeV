

.text

convert_coord:
#   inputs:
#       -a0 (32 Bit coordinate)
#
#   output:
#       - a1 x-coordinate 512x512
#       - a2 y-coordinate 512x512 

addi sp,sp,-12
sw t0,0(sp)
sw t1,4(sp)
sw ra,8(sp)

li t0, 0x0000FFFF
li t1, 0xFFFF0000

slli a0,a0,SQUARE_SIZE_SHIFT #convert coordinates to 8x8 squares

and a1, t1, a0	# last 16bits x-coordinate
and a2, t0, a0	# first 16bits y-coordinate
srli a1, a1, 16 #Remove leading zeros 

lw t0,0(sp)
lw t1,4(sp)
lw ra,8(sp)
addi sp,sp,12
ret
