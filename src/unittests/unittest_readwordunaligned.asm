
	
.text

# initialization


li t0, 0xdeadbeef
li t1, 0xaffed00f
sw t0, (gp)
sw t1, 4 (gp)
mv a1, gp
addi a1,a1,2
jal read_word_unaligned # a0 is output

mv s0, a0

li t2, 0xd00fdead # reference value

bne t2, s0, error_test

li a0, 5 #if program finishes with code 5 the unittest was successfully
li a7,93
ecall

error_test:
li a0, 10 #if program finishes with code 10 the unittest was error
li a7,93
ecall


.include "../user_interface/readwordunaligned.asm"