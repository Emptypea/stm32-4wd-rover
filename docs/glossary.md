# Glossary

Terms in this project, in my own words. Words with two technical meanings are kept side by side.

## Address
A memory box is given an address - A, like the address of a house. Each box holds one byte. Inside it, a value is stored - N, like the rooms, sofa and other objects inside a house. A tells where the box is, N tells what is inside it.
Used for: the CPU finds a particular box using its address.

## Flash
A kind of memory with many storage boxes. It's non-volatile, meaning its contents stay even after power-off.
Used for: holds my program (the machine code I write) and constants. The CPU runs the program straight from flash.
Not the same as the instruction set: the instruction set is the list of instructions the CPU understands (Thumb-2 on this chip). My program is built from those instructions.

## RAM
A kind of memory, volatile. It holds the variables, the data that changes while the program runs.
The CPU does not run my code from RAM, it runs it from flash. Same as on Arduino: the sketch is in flash, the variables are in SRAM.

## Volatile memory
A memory whose contents are lost upon loss of power. It is not wiped clean: at the next power-up, RAM holds random values. Example: RAM.
Why the reset vector is not in RAM: the CPU needs the reset vector the moment the MC powers on, and at that moment RAM only holds random values. Getting the reset vector into RAM would need code to copy it there, and code can't run before the reset vector is read.

## Program Counter
A register inside the CPU that holds the address of the next instruction.

## Reset Vector
A number N stored at address A = 0x00000004 (a mirror of the start of flash), which the CPU reads at power-on and loads into the PC. N is the address of the first instruction of my program.
It is not in RAM because RAM is volatile; see Volatile memory for the full reason.

## Register
A small storage box inside the CPU. 32 bits on this chip. It has a name (like PC), not an address. PC is one of them.
