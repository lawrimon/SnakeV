
# interface for handling homescreen.asm, gameover.asm and win.asm in one .asm-file while still embracing modularity

.data 

bmp_gameover: .asciz "user_interface/img/gameover512_x.bmp"
.align 2
bmp_homescreen: .asciz "user_interface/img/home512_x.bmp"
.align 2
bmp_win: .asciz "user_interface/img/win512_x.bmp"
.align 2
bmp_field: .asciz "user_interface/img/field512_x.bmp"


.text

.include "homescreen.asm"
.include "gameover.asm"
.include "win.asm"
.include "field.asm"
.include "load_bmp.asm"
