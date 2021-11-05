snake: 	.align 2 
	.space 1024

.eqv DISPLAY_ADDRESS 0x10040000 # this address is used for the bitmap display because 0x1001000 interferes with the location of strings
.eqv DISPLAY_WIDTH 512
.eqv DISPLAY_HEIGHT 512

.eqv KEYBOARD_ADDRESS 0xFFFF0000

.eqv max_read 1600000 # max size of buffer
.eqv BMP_BUFFER 0x10140000 # buffer for load_bmp

.eqv SQUARE_SIZE 8 # size of one snake element
.eqv SQUARE_SIZE_SHIFT 3 # number to shift left to get multiplication by SQUARE_SIZE

# border values for the playfield 
.eqv RIGHTBORDER 496
.eqv LEFTBORDER 15
.eqv BOTTOMBORDER 384
.eqv TOPBORDER 15


