

.text

turn_right:
#   inputs:
#       - s4 = vector of snake
#
#   output:
#       - s0 = new head coordinate
#       - changed s4

addi sp, sp, -36
sw s0, 0(sp)
sw s1, 4(sp)
sw s2, 8(sp)
sw s3, 12(sp)
sw s5, 16(sp)
sw t0,20(sp)
sw t1,24(sp)
sw t2,28(sp)
sw ra,32(sp)


lw s0, 0(s4) 	#length of the snake
slli s1, s0, 2	#Multiply by 4
add s2, s4, s1 	#Coordinate of the Head
lw s2, (s2)	#Value of the Head
li t0,0x00010000 # Value to increase x-Coordinate
add a0,s2,t0	#new coordinates
add t1,s1,s4 #address of head
addi s0,a0,0 #new coordinates
li a3, 0x00FF00 #color of snake

jal convert_coord
jal verifyRight
jal verifySelf
jal draw_point

beq s0,s9,grow_snake #if coordinates of new head equals coordinates of fruit

addi a0,s4,4 #address of first element 
lw a0,(a0) #value of first element arr[1] (arr[0] stores the lenght)
jal convert_coord
li a3, 0x000000 #color of snake
jal draw_point #delete last element (draw the pixel with background color)
j refresh_vector

######################################################################################

turn_left:
#s4 snake vector
addi sp, sp, -36
sw s0, 0(sp)
sw s1, 4(sp)
sw s2, 8(sp)
sw s3, 12(sp)
sw s5, 16(sp)
sw t0,20(sp)
sw t1,24(sp)
sw t2,28(sp)
sw ra,32(sp)

lw s0, 0(s4) 	#length of the snake
slli s1, s0, 2	#Multiply by 4
add s2, s4, s1 	#Coordinate of the Head
lw s2, (s2)	#Value of the Head
li t0,0x00010000 # Value to increase x-Coordinate
sub a0,s2,t0	#new coordinates
add t1,s1,s4 #address of head
addi s0,a0,0 #new coordinates
li a3, 0x00FF00 #color of snake

jal convert_coord
jal verifyLeft
jal verifySelf
jal draw_point

beq s0,s9,grow_snake #if coordinates of new head equals coordinates of fruit

addi a0,s4,4 #address of first element 
lw a0,(a0) #value of first element arr[1] (arr[0] stores the lenght)
jal convert_coord
li a3, 0x000000 #color of snake
jal draw_point #delete last element (draw the pixel with background color)
j refresh_vector

######################################################################################

turn_up:
#s4 snake vector
addi sp, sp, -36
sw s0, 0(sp)
sw s1, 4(sp)
sw s2, 8(sp)
sw s3, 12(sp)
sw s5, 16(sp)
sw t0,20(sp)
sw t1,24(sp)
sw t2,28(sp)
sw ra,32(sp)

lw s0, 0(s4) 	#length of the snake
slli s1, s0, 2	#Multiply by 4
add s2, s4, s1 	#Coordinate of the Head
lw s2, (s2)	#Value of the Head
li t0,0x00000001 # Value to increase x-Coordinate
sub a0,s2,t0	#new coordinates
add t1,s1,s4 #address of head
addi s0,a0,0 #new coordinates
li a3, 0x00FF00 #color of snake

jal convert_coord
jal verifyUp
jal verifySelf
jal draw_point

beq s0,s9,grow_snake #if coordinates of new head equals coordinates of fruit

addi a0,s4,4 #address of first element 
lw a0,(a0) #value of first element arr[1] (arr[0] stores the lenght)
jal convert_coord
li a3, 0x000000 #color of snake
jal draw_point #delete last element (draw the pixel with background color)
j refresh_vector

######################################################################################

turn_down:
#s4 snake vector
addi sp, sp, -36
sw s0, 0(sp)
sw s1, 4(sp)
sw s2, 8(sp)
sw s3, 12(sp)
sw s5, 16(sp)
sw t0,20(sp)
sw t1,24(sp)
sw t2,28(sp)
sw ra,32(sp)

lw s0, 0(s4) 	#length of the snake
slli s1, s0, 2	#Multiply by 4
add s2, s4, s1 	#Coordinate of the Head
lw s2, (s2)	#Value of the Head
li t0,0x00000001 # Value to increase x-Coordinate
add a0,s2,t0	#new coordinates
add t1,s1,s4 #address of head
addi s0,a0,0 #new coordinates
li a3, 0x00FF00 #color of snake

jal convert_coord
jal verifyDown
jal verifySelf
jal draw_point

beq s0,s9,grow_snake #if coordinates of new head equals coordinates of fruit

addi a0,s4,4 #address of first element 
lw a0,(a0) #value of first element arr[1] (arr[0] stores the lenght)
jal convert_coord
li a3, 0x000000 #color of snake
jal draw_point #delete last element (draw the pixel with background color)
j refresh_vector

######################################################################################

refresh_vector:

li t2,0
addi s1,s1,-4 #makes the loop not get undue address values

#after the new element is drawn and the first element is deleted, the vector elements need to be rearranged [0,1,2,3] -> [1,2,3,4]
refresh_vector_loop:
beq s1, t2, end_refresh_loop #for loop over all elements
addi t2, t2, 8 
add s3, s4, t2 # #address of next but one element arr[i+1]
addi s5, s3, -4 #address of next element arr[i]
lw s3, (s3)	#load value s3=arr[i+1]
sw s3, (s5)	#flip value arr[i]=arr[i+1]
addi t2, t2, -4
j refresh_vector_loop
end_refresh_loop:

sw s0, (t1) #store new coordinate to head address

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
