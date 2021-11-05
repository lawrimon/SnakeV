.data

.include "global_constants.asm"


.text


j homescreen

#initialization
field_init:

j field # loads the playfield

game_start:

li s11, 0 # resets keyboard input
li s10, 30 # number of fruits the player has to collect to win

la s4,snake # Vector of snake
li t0,3 # inital size of snake
sw t0,0(s4) # store size

li t0, 0x0014000F 	#first element of the snake
sw t0, 4(s4)		
li t0, 0x0015000F	#second element of the snake
sw t0, 8(s4)		
li t0, 0x0016000F	#third element of the snake
sw t0, 12(s4)

jal draw_snake # draws the snake

jal set_fruit #inital fruit

li s0, 'a' # ASCII-Value of a
li s1, 'd' # ASCII-Value of d
li s2, 's' # ASCII-Value of s
li s3, 'w' # ASCII-Value of w


_keyboard: 	
jal check_key #return value of key (s11)

beq s10, zero, win # win condition: every fruit is collected

# s10 decreases with every collected fruit (see grow_snake.asm)

# sleep
mv a0, s10 # sleep time manages moevement speed -> depends on value of s10
li a7, 32
ecall

beq s11, s1, move_right # key 'd' is pressed -> move right
beq s11, s3, move_up # key 'w' is pressed -> move up
beq s11, s2, move_down # key 's' is pressed -> move down
beq s11, s0, move_left # key 'a' is pressed -> move left
j _keyboard
		
move_right:		
jal turn_right
j _keyboard

move_down:
jal turn_down
j _keyboard

move_left:
jal turn_left
j _keyboard

move_up:
jal turn_up
j _keyboard



.include "draw_functions/draw_pixel.asm"
.include "draw_functions/draw_point.asm"
.include "draw_functions/draw_snake.asm"
.include "game_logic/convert_coord.asm"
.include "game_logic/turn.asm"
.include "game_logic/keyboard.asm"
.include "game_logic/verification.asm"
.include "game_logic/selfverification.asm"
.include "game_logic/grow_snake.asm"
.include "game_logic/fruit.asm"
.include "user_interface/ui_controller.asm"




