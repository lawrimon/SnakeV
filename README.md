# SnakeV

Recreation of the retro game Snake in RISC-V Assembly.

## Authors

Gregor Boschmann, Laurin Tarta, Max Kiefer

## Demo Video

[![IMAGE ALT TEXT](http://img.youtube.com/vi/-h3eH4ubuno/0.jpg)](http://www.youtube.com/watch?v=-h3eH4ubuno "Video Title")

Replace -h3eH4ubuno in the this .md by your YT video

## Description

An in-depth paragraph about your project and overview of use.

### How to run

Setup for your RARS environment to run our program:

- Open the terminal in the src-directory and run RARS from there
- Open and assemble src/main.asm in RARS
- Connect the bitrmap display and keyboard to the program
- Set the display address to 0x10040000 (heap) and its size to 512x512
- Run the program and have fun :)

## Files

Description of the content of each file of our application:

### Main

src/main.asm # mainfile that starts the game

src/global_constants.asm # constant values which are used in numerous contexts in our program

### Draw Functions

src/draw_functions/draw_pixel.asm # platzhalter

src/draw_functions/draw_point.asm # platzhalter

src/draw_functions/draw_snake.asm # platzhalter

### Game Logic

src/game_logic/convert_coord.asm # platzhalter

src/game_logic/keyboard.asm # taking the keyboard input and converting it into a direction

src/game_logic/verification.asm # checking the gameborder for collisions

src/game_logic/selfverification.asm  # checking if the snake head collides with the tail

src/game_logic/turn.asm # the snake does a movement to the right/left/top/bottom

src/game_logic/platzhalter.asm # fruit funktion

src/game_logic/platzhalter.asm # score funktion

### User Interface

src/user_interface/ui_controller.asm   # interface for handling the following ui fragments 

src/user_interface/homescreen.asm   # loads the homescreen + corresponding keyboard logic

src/user_interface/gameover.asm   # loads the gameover screen + corresponding keyboard logic

src/user_interface/win.asm   # loads the win screen + corresponding keyboard logic

src/user_interface/field.asm   # loads the playfield

src/user_interface/load_bmp.asm   # loads a bitmap in 32bit XRGB format

src/user_interface/readwordunaligned.asm   # necessary for functionality of load_bmp

src/user_interface/img # directory for bitmap resources

### Unittests

test/test1.asm - test9.asm # 9 unit tests for featureA

## Test
Screenshot that shows succedded (unit) tests 
