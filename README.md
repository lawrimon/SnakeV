# SnakeV

Recreation of the retro game Snake in RISC-V Assembly.

## Authors

- Gregor Boschmann
- Laurin Tarta
- Max Kiefer

## Demo Video

[![IMAGE ALT TEXT](http://img.youtube.com/vi/-h3eH4ubuno/0.jpg)](http://www.youtube.com/watch?v=-h3eH4ubuno "Video Title")

Replace -h3eH4ubuno in the this .md by your YT video

## Description

In this hand-crafted version of the retro classic Snake the marvelous journey of the player starts in a minimalistic pixel art homescreen. There he has the opportunity to choose between playing a game or leaving the program (why tho?). In addition to the standard Snake ruleset we included some more functionalities to add some spice to the game and increase the fun factor. With every collected fruit your snake becomes faster and faster. Only well experienced players have the capability to collect all thirty fruits and win this nerve-wracking game. The WASD-keys are used for movement and the head of snake points to right side at the beginning of each round. Moving into the opposite direction of your current way will lead to death (snakes cannot move into their own throat). 
 
### How to run

Setup for your RARS environment to run our program:

- Open the terminal in the src-directory and run RARS from there
- Open and assemble src/main.asm in RARS
- Connect the bitmap display and keyboard to the program
- Set the display address to 0x10040000 (heap) and its size to 512x512
- Run the program and have fun :)

## Files

Description of the content of each file of our application:

### Main

src/main.asm # mainfile that starts the game

src/global_constants.asm # constant values which are used in numerous contexts in our program

### Draw Functions

src/draw_functions/draw_pixel.asm # draws a pixel at given coordinate

src/draw_functions/draw_point.asm # draws a square at given coordinate (coordinate matches top left corner of the square)

src/draw_functions/draw_snake.asm # draws inital snake from vector of coordinates

### Game Logic

src/game_logic/convert_coord.asm # converts coordinates from 64x64 to 512x512

src/game_logic/keyboard.asm # taking the keyboard input and converting it into a direction

src/game_logic/verification.asm # checking the gameborder for collisions

src/game_logic/selfverification.asm  # checking if the snake head collides with the tail

src/game_logic/turn.asm # the snake does a movement to the right/left/top/bottom

src/game_logic/fruit.asm # generates random coordinate and draws point

src/game_logic/grow_snake.asm # increases length of snake by 1

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

src/unittest/unittest_loadbmp.asm # test for load_bmp.asm

src/unittest/unittest_readwordunaligned.asm # test for readwordunaligned.asm

src/unittest/unittest_fruit.asm # test for fruit.asm

src/unittest/unittest_grow.asm # test for grow_snake.asm

## Test

### unittest_loadbmp

![unittest_loadbmp](https://user-images.githubusercontent.com/81292206/140516270-c372702c-664e-4f9a-837d-61d876522a5d.png)

### unittest_readwordunaligned

![unittest_readwordunaligned](https://user-images.githubusercontent.com/81292206/140516452-2dc7ab6b-2513-47cf-bff7-469f84ca6ee2.png)

### unittest_fruit

![unittest_fruit](https://user-images.githubusercontent.com/81292206/140531099-5b545999-1407-4a1f-8367-71e1a273e010.png)

### unittest_grow
