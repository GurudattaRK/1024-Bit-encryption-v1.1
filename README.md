# 1024-Bit encryption v1.1
#### _Any algorithm that can be written in assembly should be written in assembly XD_


Using this program you can protect your files by encrypting them & you don't need to enter any password instead you have to use any other file as your password! 
As long as you keep this "key file" safe with you all your files are safe.
## How to use it?
This repository has compiled binaries ready to run or .c and .s files if you want to compile the source code yourself.
I have uploaded all files to make it easier to explore , compile , and run on any operating system using x64 architecture(Intel and AMD)

C_asm.c is a C file that you compile on any platform using GCC or Clang & the output will be an executable ready to run on your platform.

#### For WINDOWS users
- Windows_asm.exe is an executable ready to run on any windows platform.
- Windows_asm.s is an assembly file that you can compiled using any C Compiler like GCC or Clang using the command: gcc -C Windows_asm.s -o Windows_asm.exe

#### For Linux users
- Linux_asm is an executable ready to run on any linux platform & make sure you give it executable permissions before running it.
- Linux_asm.s is an assembly file that you can compiled using any C Compiler like GCC or Clang using the command: gcc -C Linux_asm.s -o Linux_asm


## About this project
There's nothing like too much performance XD
So writing the entire algorithm in assembly gave me a low level control of how my algorithm executes & I could make necessary changes to improve its execution speed.
I only wrote the computationally intensive parts (my entire algorithm) of the program in x64 assembly and rest of Input/Output is handled in C because there wouldn't be any signicant perfromance gains by writing these parts in Assembly.

If you see any bugs, crashes , improvements, etc contact me and give me a feedback :)
