

.text

draw_snake:
# draw inital snake
#
#   inputs:
#       - s4 = vector of coordinates to draw snake points
#
#   output:
#       - 

addi sp, sp, -20
sw s4, 0(sp)
sw t1, 4(sp)
sw t2, 8(sp)
sw t3, 12(sp)
sw ra,16(sp)

lw t0, 0(s4) 	# length of snake
slli t1, t0, 2	# multiply length by 4 (alignment of vector)
li t2, 0	# counter for loop

snake_loop:	
beq t2, t1, end_loop #for(counter < length){...}
addi t2, t2, 4	# increase counter by 4
add t3, t2, s4 	# current element address 
lw a0, (t3) 	# current element value (arr[i])
li a3, 0x00FF00	# color of snake

jal convert_coord #converts word in a0 to x and y coordinate
jal draw_point
j snake_loop 

end_loop:
lw s4, 0(sp)
lw t1, 4(sp)
lw t2, 8(sp)
lw t3, 12(sp)
lw ra,16(sp)
addi sp, sp, 20
ret

