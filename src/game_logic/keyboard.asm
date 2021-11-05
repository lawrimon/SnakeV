.text

check_key:
#   inputs:
#       - /
#
#   output:
#       - s11 = pressed key

addi sp,sp,-20
sw s0, 0(sp)
sw t0, 4(sp)
sw t1, 8(sp)
sw ra, 16(sp)
sw a0, 20(sp)

li s0, KEYBOARD_ADDRESS

lw t0, 0(s0)
beq t0, zero, switch.end #if no key is pressed jump to the end of the loop
lw t0, 4(s0)
switch.start: #switch case to check which key is pressed
  switch.w:
  li t1, 'w'
  bne t0, t1, switch.s
  lw s11,4(s0) #store value of pressed key
  beq zero, zero, switch.end
  switch.s:
  li t1, 's'
  bne t0, t1, switch.a
  lw s11,4(s0) #store value of pressed key
  beq zero, zero, switch.end
  switch.a:
  li t1, 'a'
  bne t0, t1, switch.d
  lw s11,4(s0) #store value of pressed key
  beq zero, zero, switch.end
  switch.d:
  li t1, 'd'
  bne t0, t1, switch.end
  lw s11,4(s0) #store value of pressed key
  beq zero, zero, switch.end
switch.end:

# sleep for 20ms
li a0, 20
li a7, 32
ecall



lw s0, 0(sp)
lw t0, 4(sp)
lw t1, 8(sp)
lw ra, 16(sp)
lw a0, 20(sp)
addi sp,sp,20
ret

  
  
  
  
  
