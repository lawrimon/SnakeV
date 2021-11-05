.data

.include "../global_constants.asm"


.text

#initialization

li t0,TOPBORDER
li t1,BOTTOMBORDER
li t2,RIGHTBORDER
li t3,LEFTBORDER

jal set_fruit

# a1: x coordinate
# a2: y coordinate

bge a1,t2,error_test #point out of range
ble a1,t3,error_test #point out of range
ble a2,t0,error_test #point out of range
bge a2,t1,error_test #point out of range


li a0, 5 #if program finishes with code 5 the unittest was successfully
li a7,93
ecall

error_test:
li a0, 10 #if program finishes with code 10 the unittest failed
li a7,93
ecall


.include "../draw_functions/draw_pixel.asm"
.include "../draw_functions/draw_point.asm"
.include "../game_logic/convert_coord.asm"
.include "../game_logic/fruit.asm"








