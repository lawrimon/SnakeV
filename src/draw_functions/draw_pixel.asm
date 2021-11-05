
draw_pixel:
# Creates colored pixel at position (x,y)  

# Inputs
#----------------------
#    a1: x
#    a2: y
#    a3: color
# Outputs: None
	# calle save
	addi sp, sp, -12
	sw t0, 8(sp)
	sw t1, 4(sp)
	sw t2, 0(sp)
	#define DISPLAY_WIDTH 256
	#define DISPLAY_ADDRESS 0x10010000
	# int∗ crtaddress = (int∗) DISPLAY_ADDRESS + x + y∗DISPLAY_WIDTH;


	li t1, DISPLAY_WIDTH
	mul t2, t1, a2
	add t2, t2, a1
	slli t2, t2, 2
		li t0, DISPLAY_ADDRESS
	add t2, t2, t0

	sw a3, (t2)

	#calle restore
		lw t2, 0(sp)
	lw t1, 4(sp)
	lw t0, 8(sp)
	addi sp, sp, 12
	ret
