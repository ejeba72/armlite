2023.jul.8 sat 2138mf

This is where I practise armlite assembly. The following are some of the things I understand along the way, using armlite book, reference manual and simulator (little man computer):

MEANING OF MNEMONICS:
  mov -- MOVe
  ldr -- LoaD Register
  str -- STore Register
  adr -- ADdress Register

- A number or string is a memory address.
- A number or string is an immediate value when the hash symbol is prepended to it.
- A memory address cannot be used with a MOV instruction.
- An immediate value cannot be used with a LDR or STR instruction.
- The value in the SP (stack pointer) register typically indicates the next address to pop, just as the PC (program counter) register indicates the next address to execute instruction. So, I wonder the mechanism behind pushing to stack.
- PUSH and POP should be at the beginning and end of subroutine respectively.
- the registers to be pushed, are the ones to be used in the subroutine, as well as the register that is used to link back from the subroutine.
- although LR is the in-built register used by armlite for linking back, an armlite assembly programmer can choose any of the general purpose registers to use as his link back register.

2023.sep.5 tue 1858mf
- A label or symbol is, in my own words, a "nick name" for the address of a memory location. A label is used because it is more memorable than an address (which is actually a number).
- An anology for label: label is to memory address, as comment is to code. This is a rough or not-so-accurate analogy, but it gives you an idea.
- When you want to transfer data between a register and a memory address, you use LDR and STR instructions respectively.
- Sometimes it is important to place the address of a memory location (not the data in the memory location) inside a register. For instance, if 0x0010 is a memory address that you want place in register r0, you can do it in the following ways for armlite and arm respectively,
  mov r0, #0x0010  // armlite
  adr r0, 0x0010  // arm
- If you don't know the address of the memory location, but there is a label for it, you can place the address of the memory location inside a register like so,
  mov r0, #nameOfRegister  // armlite
  adr r0, nameOfRegister  // arm

2023.sep.10 sun 2201mf
- In ARMlite assembly, if you wish to make use of an interrupt, there are three things to do:
  -- set up interrupt
  -- write your main program
  -- write your desired interrupt routine

2023.oct.29 sun 1249mf
- The linker command for macos is: "ld file-name.o -o filename -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path`"
  -- "lSystem" means link system library. The System library is a set of system-level libraries that provide various functions and services for macOS programs. By linking with this library, your program can use macOS system functions and features.
  -- "syslibroot" means 
