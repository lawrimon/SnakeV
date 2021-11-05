
.text
#Verification of the snake hitting itself
#   inputs:
#       - s4 = vector of snake
#
#   output:
#       - /

verifySelf:     #For loop that checks for every element if the next coordinate is valid
addi sp, sp, -24
    sw ra, 0(sp)
    sw t1, 4(sp)
    sw t2, 8(sp)
    sw t3, 12(sp)
    sw t4, 16(sp)
    sw s4, 20(sp)
        
    addi t1, zero, 0     # Counter adding up for the for loop
    addi t2, zero, 0     # The next adress
    
    
    lw t3, 0(s4)         # The Length of the snake
    ForSelf:
    beq t1, t3, ForSelfExit #Checking if the last element of snake is reached
    
    addi t2,t2, 4 # Loading next address
    add t4, t2, s4 # Loading offset address
    lw t4, (t4) #Loading the value of the address
    
    beq s0,t4, gameover #if the new head has the same coordinates as any part of the tail then its gameover
    
    addi t1,t1, 1 #Forloop counts one element up until snakelength is reached
    j ForSelf #Jumping to the start of the forloop
    

ForSelfExit:
    lw ra, 0(sp)
    lw t1, 4(sp)
    lw t2, 8(sp)
    lw t3, 12(sp)
    lw t4, 16(sp)
    lw s4, 20(sp)
    addi sp, sp, 24
    ret



