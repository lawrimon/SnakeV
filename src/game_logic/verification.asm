
.text
#Verification of all the directions involved
#   inputs:
#       - s4 = vector of snake
#
#   output:
#       - /

verifyRight:

    addi sp, sp, -8
    sw ra, 0(sp)
    sw t6, 4(sp)
    
    li t6, RIGHTBORDER
    bge a1, t6, verifyT1 #is the coordinate  greater or equal the right border?
    blt a1, t6, verifyT2 #is the x coordinate less than the right border?

verifyLeft:
	
     addi sp, sp, -8
    sw ra, 0(sp)
    sw t6, 4(sp)
    li t6, LEFTBORDER
    ble a1, t6, verifyT1 #is the x coordinate smaller than the left border?
    bgt a1, t6, verifyT2 #is the x coordinate greater than the left border?

verifyDown:

        addi sp, sp, -8
    sw ra, 0(sp)
    sw t6, 4(sp)
    li t6, BOTTOMBORDER
    bge a2, t6, verifyT1 #is the y coordinate  less than the bottom border?
    blt a2, t6, verifyT2 #is the y coordinate greater the bottom border?

verifyUp:

    addi sp, sp, -8
    sw ra, 0(sp)
    sw t6, 4(sp)
    li t6, TOPBORDER
    ble a2, t6, verifyT1 # y is the coordinate  less than the top border?
    bgt a2,t6 verifyT2 #is the y coordinate bigger than the top border?




verifyT1:
   j gameover

    
verifyT2:
    lw ra, 0(sp)
    lw t6, 0(sp)
    addi sp, sp, 8
    ret #Directions is Valid and can be used

