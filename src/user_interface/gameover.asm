
.text

gameover:

addi sp, sp , -12
sw s0, 0(sp)
sw t0, 4(sp)
sw t1, 8(sp)

la a1, bmp_gameover # pointer to string of filename; necessary for load_bmp


jal load_bmp # loads the gameover bitmap

li s0, KEYBOARD_ADDRESS

gameover.loop: # endless loop for key stroke detection

lw t0, (s0) # bool key_pressed
beq t0, zero, gameover.end # if (key_pressed == 0) 
lw t0, 4(s0) # ASCII value of pressed key

gameover.start: # switch loop to determine whether 'spacebar' is pressed
  gameover.spacebar:
  li t1, 32 # ASCII code for spacebar
  bne t0, t1 gameover.end
  lw s0, 0(sp)
  lw t0, 4(sp)
  lw t1, 8(sp)
  addi sp, sp, 12
  j homescreen # opens the homescreen
  beq zero, zero gameover.end
gameover.end:

j gameover.loop
