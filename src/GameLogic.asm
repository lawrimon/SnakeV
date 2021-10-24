
logic:

.data
addi s0, zero, zero #Leftborder
addi s1, zero, zero #Rightborder
addi s2, zero, zero #Bottomborder
addi s3, zero, zero #Topborder
addi s4, zero, zero #Gameover
addi s5, zero, zero #Score

addi s6, zero, zero #Snakelength
addi s7, zero, zero #SnakeX
addi s8, zero,zero  #SnakeY

addi s9,zero,zero #FruitX
addi s10,zero,zero #FruitY

.word snake 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.text
#function checking for the borders

collision:
beq s7,s0,gameover #Leftborder Kollision
beq s7,s1,gameover #Rightborder Kollision
beq s8,s2,gameover #Bottomborder Kollision
beq s8,s3,gameover #Topborder Kollision

fruitpickup:
#function checking for fruitpickup 
beq s7,s9,pickup


pickup:
beq s8,s10,score
#Jump back to main

score:
#Score hochzählen und Pickup neu setzen 
addi s5,s5,10
#Rand um X und Y neu zu setzen 
addi s9,s9,30
addi s10,s10,30


selfkollision:
#Array durchchecken und mit X&Y vegleichen
#Im 2. Schritt vergleichen ob Arrayelement auf 1 gesetzt ist


#Jump back to main
gameover:
