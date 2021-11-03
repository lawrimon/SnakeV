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

src/global_constants.asm # constant values which are used in numerous contexts in our program

### Game Logic

### User Interface

src/user_interface/ui_controller.asm   # interface for handling the following ui fragments 

src/user_interface/homescreen.asm   # draws the homescreen + corresponding keyboard logic

src/user_interface/gameover.asm   # draws the gameover screen +  corresponding keyboard logic

src/user_interface/win.asm   # draws the win screen + corresponding keyboard logic

src/user_interface/field.asm   # draws the playfield

src/user_interface/load_bmp.asm   # loads a bitmap in 32bit XRGB format

src/user_interface/readwordunaligned.asm   # necessary for functionality of load_bmp

src/user_interface/img # directory for bitmap resources

### Unittests

test/test1.asm - test9.asm # 9 unit tests for featureA


## Test
Screenshot that shows succedded (unit) tests 
