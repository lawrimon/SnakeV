.text

field:

la a1, bmp_field # pointer to string of filename; necessary for load_bmp

jal load_bmp # loads the field bitmap

j game_start
