
.text

win:

addi sp, sp , -12
sw s0, 0(sp)
sw t0, 4(sp)
sw t1, 8(sp)

la a1, bmp_win # pointer to string of filename; necessary for load_bmp


jal load_bmp # loads the win bitmap

li s0, KEYBOARD_ADDRESS

win.loop: # endless loop for key stroke detection

lw t0, (s0) # bool key_pressed
beq t0, zero, win.end # if (key_pressed == 1)
lw t0, 4(s0) # ASCII value of pressed key

win.start: # switch loop to determine whether 'spacebar' is pressed
  win.spacebar:
  li t1, 32 # ASCII code for spacebar
  bne t0, t1 win.end
  lw s0, 0(sp)
  lw t0, 4(sp)
  lw t1, 8(sp)
  addi sp, sp, 12
  j homescreen # opens the homescreen
  beq zero, zero win.end
win.end:

j win.loop
