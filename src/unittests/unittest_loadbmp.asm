.data

.include "../global_constants.asm"

bmp_test: .asciz "unittests/test8_x.bmp" # 8x8 bitmap with 4 different colored aeas
	
.text

# initialization

la a1, bmp_test

jal load_bmp

li s0, 0x00ff0000 # --> red
li s1, 0x0000ff00 # --> green
li s2, 0x000000ff # --> blue
li s3, 0x00ffff00 # --> yellow

lw t0, 0x10040000 # pixel adresses from each color area in the bitmap
lw t1, 0x10040010 
lw t2, 0x10042000 
lw t3, 0x10042010 

bne t0, s0, error_test # check if the right color is placed at the tested address 
bne t1, s1, error_test
bne t2, s2, error_test
bne t3, t3, error_test


li a0, 5 #if program finishes with code 5 the unittest was successfully
li a7,93
ecall

error_test:
li a0, 10 #if program finishes with code 10 the unittest was error
li a7,93
ecall

.include "../user_interface/load_bmp.asm"
