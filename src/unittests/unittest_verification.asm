.data

.include "../global_constants.asm"


.text

jal start_test

################################################################################################
# Code of verification.asm changed to work with unittest

verifyRight:

    addi sp, sp, -12
    sw ra, 0(sp)
    sw t6, 4(sp)
    sw t0, 8(sp)
    
    li t6, RIGHTBORDER
    bge a1, t6, verifyT1 #is the coordinate  greater or equal the right border?
    blt a1, t6, verifyT2 #is the x coordinate less than the right border?

verifyLeft:
	
    addi sp, sp, -12
    sw ra, 0(sp)
    sw t6, 4(sp)
    sw t0, 8(sp)
    
    li t6, LEFTBORDER
    ble a1, t6, verifyT1 #is the x coordinate smaller than the left border?
    bgt a1, t6, verifyT2 #is the x coordinate greater than the left border?

verifyDown:

    addi sp, sp, -12
    sw ra, 0(sp)
    sw t6, 4(sp)
    sw t0, 8(sp)
    
    li t6, BOTTOMBORDER
    bge a2, t6, verifyT1 #is the y coordinate  less than the bottom border?
    blt a2, t6, verifyT2 #is the y coordinate greater the bottom border?

verifyUp:

    addi sp, sp, -12
    sw ra, 0(sp)
    sw t6, 4(sp)
    sw t0, 8(sp)
    
    li t6, TOPBORDER
    ble a2, t6, verifyT1 # y is the coordinate  less than the top border?
    bgt a2,t6 verifyT2 #is the y coordinate bigger than the top border?


verifyT1:
   li t0,1 #if verification detects error set t0 = 1
   ret
   #j gameover

    
verifyT2:
    li t0,1 #if verification detects no error set t0 = 0
    lw ra, 0(sp)
    lw t6, 0(sp)
    sw t0, 8(sp)
    addi sp, sp, 12
    ret #Directions is Valid and can be used

###############################################################################################


start_test: 

li a1, RIGHTBORDER
addi a1,a1,1
jal verifyRight	#should stop the game if a1 out of range -> t0=1
beqz t0, error_test

li a0, 5 #if program finishes with code 5 the unittest was successfully
li a7,93
ecall

error_test:
li a0, 10 #if program finishes with code 10 the unittest failed
li a7,93
ecall


