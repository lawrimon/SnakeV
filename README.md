# SnakeV :snake:

Recreation of the retro game Snake in RISC-V Assembly :desktop_computer:	

## Authors :family_man_man_boy:	

:man_scientist: Gregor Boschmann  
:man_technologist: Laurin Tarta  
:man_artist: Max Kiefer

## Media :movie_camera:	

### Tutorial Video

[![IMAGE ALT TEXT](http://img.youtube.com/vi/lU9VKJT4uNE/0.jpg)](https://www.youtube.com/watch?v=lU9VKJT4uNE "SnakeV Tutorial")

### Presentation Video

[![IMAGE ALT TEXT](http://img.youtube.com/vi/WpIAXO0PboY/0.jpg)](https://www.youtube.com/watch?v=WpIAXO0PboY "SnakeV Presentation")

## Description :books:	

In this hand-crafted version of the retro classic Snake the marvelous journey of the player starts in a minimalistic pixel art homescreen. There he has the opportunity to choose between playing a game or leaving the program (why tho?). In addition to the standard Snake ruleset we included some more functionalities to add some spice to the game and increase the fun factor. With every collected fruit the snake becomes faster and faster. Only well experienced players are able to collect all thirty fruits and win this nerve-wracking game. The head of the snake points to the right side at the beginning of each round. Moving into the opposite direction of your current one will lead to death (snakes cannot move into their own throat).  

### Key Assignment

`SPACEBAR` & `X`: Menu controls  
  
`W`: Move up  
  
`A`: Move left  
  
`S`: Move down  
  
`D`: Move right  

### How to run

Setup for your RARS environment to run our program:

:one:	Open the terminal in the src-directory and run RARS from there  
  
:two:	Open and assemble src/main.asm in RARS  
  
:three:	Connect the bitmap display and keyboard to the program  
  
:four:	Set the display address to 0x10040000 (heap) and its size to 512x512  
  
:five:	Run the program and have fun :)

## Files 	:file_folder:	

Description of the content of each file of our application:

### Main

[`src/main.asm`](src/main.asm) # mainfile that starts the game

[`src/global_constants.asm`](src/global_constants.asm) # constant values which are used in numerous contexts in our program

### Draw Functions

[`src/draw_functions/draw_pixel.asm`](src/draw_functions/draw_pixel.asm) # draws a pixel at given coordinate

[`src/draw_functions/draw_point.asm`](src/draw_functions/draw_point.asm) # draws a square at given coordinate (coord matches top left corner of the square)

[`src/draw_functions/draw_snake.asm`](src/draw_functions/draw_snake.asm) # draws inital snake from vector of coordinates

### Game Logic

[`src/game_logic/convert_coord.asm`](src/game_logic/convert_coord.asm) # converts coordinates from 64x64 to 512x512

[`src/game_logic/keyboard.asm`](src/game_logic/keyboard.asm) # taking the keyboard input and converting it into a direction

[`src/game_logic/verification.asm`](src/game_logic/verification.asm) # checking the gameborder for collisions

[`src/game_logic/selfverification.asm`](src/game_logic/selfverification.asm)  # checking if the snake head collides with the tail

[`src/game_logic/turn.asm`](src/game_logic/turn.asm) # the snake does a movement to the right/left/top/bottom

[`src/game_logic/fruit.asm`](src/game_logic/fruit.asm) # generates random coordinate and draws point

[`src/game_logic/grow_snake.asm`](src/game_logic/grow_snake.asm) # increases length of snake by 1

### User Interface

[`src/user_interface/ui_controller.asm`](src/user_interface/ui_controller.asm) # interface for handling the following ui fragments 

[`src/user_interface/homescreen.asm`](src/user_interface/homescreen.asm)   # loads the homescreen + corresponding keyboard logic

[`src/user_interface/gameover.asm`](src/user_interface/gameover.asm)   # loads the gameover screen + corresponding keyboard logic

[`src/user_interface/win.asm`](src/user_interface/win.asm)   # loads the win screen + corresponding keyboard logic

[`src/user_interface/field.asm`](src/user_interface/field.asm)  # loads the playfield

[`src/user_interface/load_bmp.asm`](src/user_interface/load_bmp.asm)   # loads a bitmap in 32bit XRGB format

[`src/user_interface/readwordunaligned.asm`](src/user_interface/readwordunaligned.asm)   # necessary for functionality of load_bmp

[`src/user_interface/img`](src/user_interface/img) # directory for bitmap resources

### Unittests

[`src/unittests/unittest_loadbmp.asm`](src/unittests/unittest_loadbmp.asm) # test for load_bmp.asm

[`src/unittests/unittest_readwordunaligned.asm`](src/unittests/unittest_readwordunaligned.asm) # test for readwordunaligned.asm

[`src/unittests/unittest_fruit.asm`](src/unittests/unittest_fruit.asm) # test for fruit.asm

[`src/unittests/unittest_grow.asm`](src/unittests/unittest_grow.asm) # test for grow_snake.asm

[`src/unittests/unittest_verification.asm`](src/unittests/unittest_verification.asm) # test for verification.asm

[`src/unittests/unittest_turn.asm`](src/unittests/unittest_turn.asm) # test for turn.asm


## Tests :fire_extinguisher:	

### Expected Console Output  

:heavy_check_mark: program is finished running (5)     
:x: program is finished running (10) 	

### unittest_loadbmp

![unittest_loadbmp](https://user-images.githubusercontent.com/81292206/140516270-c372702c-664e-4f9a-837d-61d876522a5d.png)

### unittest_readwordunaligned

![unittest_readwordunaligned](https://user-images.githubusercontent.com/81292206/140516452-2dc7ab6b-2513-47cf-bff7-469f84ca6ee2.png)

### unittest_fruit

![unittest_fruit](https://user-images.githubusercontent.com/81292206/140531099-5b545999-1407-4a1f-8367-71e1a273e010.png)

### unittest_grow

![unittest_grow](https://user-images.githubusercontent.com/81292206/140531813-4f12a6c6-7fa2-400b-9aad-c7b300c88237.png)

### unittest_verification

![unittest_verification](https://user-images.githubusercontent.com/81292206/140542393-69bc8718-3bae-44bc-b5df-0873e1137b43.png)

### unittest_turn

![unittest_turn](https://user-images.githubusercontent.com/81292206/140548295-cc6ee741-3632-42c3-8ac7-998b97bdccf9.png)
