
.text

load_bmp:


	#input
	#	a1 : pointer to string of filename
	#	a2 : address of buffer where bmp data is stored
	#	a3 : address to display buffer
	#
	#
	#output
	#
	#intermediate
	#	s0: address of image buffer
	#	s1: image size in bytes
	#	s2: bitmap offset
	#       s3: pointer to string of filename
	#	s4: image width
	#       s5: image height
	#       s6: filehandle

	
	addi sp, sp, -36
	sw s0, 0x0 (sp)
	sw s1, 0x4 (sp)
	sw s2, 0x8 (sp)
	sw s3, 0xc (sp)
	sw s4, 0x10 (sp)
	sw s5, 0x14 (sp)	
	sw s6, 0x18 (sp)	
	sw ra, 0x1c (sp)
	sw s7, 0x20 (sp)

	# a1 from caller
	li a2, BMP_BUFFER
	li a3, DISPLAY_ADDRESS

	mv s0, a2
	mv s3, a1
	mv gp, s0


	# STEP 2:
	# Open file handle for reading
	mv a0, s3
	li   a7, 1024     # system call for open file
	li   a1, 0        # Open file(flags are 0: read, 1: write)
	ecall             # open a file (file descriptor returned in a0)
	mv   s6, a0       # save the file descriptor
	
	mv s7, a0	  # save the file descriptor second time

	# STEP 3: Read from descriptor that you opend in the last step
	# Use constant max_read as maximum size for the ecall you choose

	mv a1, s0
	li a2, max_read   # read until the end
	li a7,63          # ecall for read 
	ecall
	mv s1, a0         # length of file returned by ecall
			
	# STEP 4:
	# Get image width
	li t0, 0xffff
	addi a1, s0, 0x12
	jal read_word_unaligned
	and a0, a0, t0
	mv s5, a0

	# STEP 5:	
	# Get image height
	addi a1, s0, 0x16
	jal read_word_unaligned
	and a0, a0, t0
	mv s6, a0

	# copy image
	# t0: src pointer
	# t1: dst pointer
	# t3: width counter
	# t4: height counter
	# t5: display width 
	# t6: distance in bytes between end of row and next row in destination buffer : 4 *(DISPLAY_WIDTH - image_width)

	# STEP 6: Copy the image in the right order from IMAGE_BUFFER to DISPLAY_ADDRESS
	# Prepare t0-t6 according to the

	
	mv t1, a3 # display address to t1
	add t0, s0, s1 # goto end of file
	mv t3, s5
	mv t4, s6
	li t5, DISPLAY_WIDTH
	sub t6, t5, s5  # distance from last pixel in a row to first pixel in the next row
	slli t6, t6, 2
	slli t5, t3, 2 # Number of bytes per image row


	loop_y:
		mv t3, s5
		sub t0, t0, t5 # go back by 1 row
		loop_x:
			#STEP 7: Use read_word_unaligned to read a pixel, then update the pixel format
			mv a1, t0
			jal read_word_unaligned
			mv t2, a0
			srli t2, t2, 8 # RGBA -> RGB
			sw t2, (t1)
			addi t0, t0, 4   # next word in source
			addi t1, t1, 4   # next word in destination
			addi t3, t3, -1  # update width counter
			bnez t3, loop_x
		sub t0, t0, t5 # go back by 1 row
		add t1, t1, t6
		
		addi t4, t4, -1
		bnez t4, loop_y
			
	mv a0, s7
	li a7, 57
	ecall

	lw s0, 0x0 (sp)
	lw s1, 0x4 (sp)
	lw s2, 0x8 (sp)
	lw s3, 0xc (sp)
	lw s4, 0x10 (sp)
	lw s5, 0x14 (sp)	
	lw s6, 0x18 (sp)	
	lw ra, 0x1c (sp)
	lw s7, 0x20 (sp)
	addi sp, sp, 36	

	
	ret
		
	  
.include "readwordunaligned.asm"
