# SnakeV

Recreation of the retro game Snake in Risc-V Assembly.


## Authors

Gregor Boschmann, Laurin Tarta, Max Kiefer

## Demo Video

[![IMAGE ALT TEXT](http://img.youtube.com/vi/-h3eH4ubuno/0.jpg)](http://www.youtube.com/watch?v=-h3eH4ubuno "Video Title")

Replace -h3eH4ubuno in the this .md by your YT video

## Description

An in-depth paragraph about your project and overview of use.

### How to run

Specify which file need to be used to run your program:
e.g.
run my_cool_program.asm in RARS

## Files
Description of the content of each file of our application:

### Main

src/global_constants.asm # values such as KEYBOARD_ADDRESS which are used in numerous contexts in our program

### Game Logic

### User Interface

src/user_interface/ui_controller.asm   # interface for handling the following ui fragments 

src/user_interface/homescreen.asm   # draws the homescreen + keyboard logic

src/user_interface/gameover.asm   # draws the gameover screen + keyboard logic

src/user_interface/win.asm   # draws the win screen + keyboard logic

src/user_interface/field.asm   # draws the playfield

src/user_interface/load_bmp.asm   # loads a bitmap in 32bit XRGB format

src/user_interface/readwordunaligned.asm   # necessary for functionality of load_bmp

src/user_interface/img # directory for bitmap resources

### Unittests

test/test1.asm - test9.asm # 9 unit tests for featureA


## Test
Screenshot that shows succedded (unit) tests 
