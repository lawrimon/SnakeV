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

li s0, 0x00000061 # Value of a
li s1, 0x00000064 # Value of d
li s2, 0x00000073 # Value of s
li s3, 0x00000077 # Value of w

li a0,0x0017000F #dummy address of fruit 
addi s9,a0,0 #load coordinate to s9
jal convert_coord
li a3, 0xFFFFFF
jal draw_point
jal turn_right
lw t0, 0(s4) #snake size
li t1, 4
bne t0,t1,error_test #snake size successfully increased to 4

li a0, 5 #if program finishes with code 5 the unittest was successfully
li a7,93
ecall

error_test:
li a0, 10 #if program finishes with code 10 the unittest was error
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






