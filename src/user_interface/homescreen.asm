
.text

homescreen:

addi sp, sp , -12
sw s0, 0(sp)
sw t0, 4(sp)
sw t1, 8(sp)

la a1, bmp_homescreen # pointer to string of filename; necessary for load_bmp


jal load_bmp # loads the homescreen bitmap

li s0, KEYBOARD_ADDRESS

homescreen.loop: # endless loop for key stroke detection

lw t0, (s0) # bool key_pressed
beq t0, zero, homescreen.end # if (key_pressed == 1)
lw t0, 4(s0) # ASCII value of pressed key

homescreen.start: # switch loop to determine whether 'spacebar' or 'x' is pressed
  homescreen.spacebar:
  li t1, 32 # ASCII code for spacebar
  bne t0, t1 homescreen.x
  lw s0, 0(sp)
  lw t0, 4(sp)
  lw t1, 8(sp)
  addi sp, sp, 12
  j field_init # starts a game
  beq zero, zero homescreen.end
  homescreen.x:
  li t1, 'x'
  bne t0, t1 homescreen.end
  lw s0, 0(sp)
  lw t0, 4(sp)
  lw t1, 8(sp)
  addi sp, sp, 12  
  li a7, 10
  ecall # quits the program
  beq zero, zero homescreen.end
homescreen.end:

j homescreen.loop
