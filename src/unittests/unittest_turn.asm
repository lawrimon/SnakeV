.data


.include "../global_constants.asm"


.text

#initialization

la s4,snake #Vector of snake
li t0,3 #inital size of snake
sw t0,0(s4) #store size

li t0, 0x0014000F 	#first element of the snake
sw t0, 4(s4)		
li t0, 0x0015000F	#second element of the snake
sw t0, 8(s4)		
li t0, 0x0016000F	#third element of the snake
sw t0, 12(s4)

jal draw_snake
	
jal turn_right

jal turn_down

jal turn_down

jal turn_left

jal turn_up

li t2, 0x00160010
slli t0,t0,2
add t1,t0,s4 #address of head
lw t1,(t1)    #Coordinates of head

bne t1,t2, error_test

li a0, 5 #if program finishes with code 5 the unittest was successfully
li a7,93
ecall

error_test:
li a0, 10 #if program finishes with code 10 the unittest failed
li a7,93
ecall

game_start:
field_init: # labels are needed for inclusion of ui_controller.asm, but won't affect the outcome of this unittest

.include "../draw_functions/draw_pixel.asm"
.include "../draw_functions/draw_point.asm"
.include "../draw_functions/draw_snake.asm"
.include "../game_logic/turn.asm"
.include "../game_logic/convert_coord.asm"
.include "../game_logic/grow_snake.asm"
.include "../game_logic/verification.asm"
.include "../game_logic/selfverification.asm"
.include "../game_logic/fruit.asm"
.include "../game_logic/keyboard.asm"
.include "../user_interface/ui_controller.asm"
