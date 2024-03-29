COMMANDLINE, VIM AND ARM LESSONS
2023.nov.7 tue 1044mf (this is not the earliest date)

DISCLAIMER: I'm not an expert, but a student. The following contents are my perceptions of what I'm learning. They may contain misleading inaccuracies. Consequently, they should be subjected to verification.

I'm including vim to this readme file. I acknowledge that vim and arm are different, but I'm actually learning the two together. I am using vim to write my arm assembly code. Consequently, it is more convenient to write whatever I learn about both of them in the same file. Besides, I'm really fond of both.

2023.nov.14 tue 2144mf
I will also be including the terminal commands that I learn along the way.



***********************************************************************************************
RESOURCES
2023.nov26 sun 2231mf

ASCII LOOKUP TABLE FROM THE COMMANDLINE
- "man ascii" is used to check for the value of ascii characters



***********************************************************************************************
TERMINAL COMMANDS THAT I'M LEARNING ALONG THE WAY
2023.nov14 tue 2148mf

RETURN VALUE COMMAND
- echo $?

USING LEFT OPTIONS KEY AS META KEY IN "ITERM2" APP
- Go to Settings >> Profiles >> Keys >> General >> Left Option key >> Esc+  (i.e. check the "Esc+" option. NOTE: checking the "Meta" option won't work).

USING LEFT OPTIONS KEY AS META KEY IN "TERMINAL" APP
- Go to Edit >> "Use Option as Meta key"  (or press "command+option+O" to toggle between Normal Option Key function and Meta key funtion for the Option key).



***********************************************************************************************
WHAT I'VE LEARNT IN VIM
2023.nov.7 tue 1054mf
"Learning to use vim is like learning to touch-type. Both require muscle memory, and both are fast and efficient!"
-- Emmanuel Eni 2023.dec18 mon ~1800mf
"If you enjoy touch typing, vim could be right for you! :)"
-- Emmanuel Eni 2023.dec18 mon 1821mf

SEARCH FOR PATTERNS
- ":/pattern" or "/pattern" is used to search for the next occurrence.
- ":?pattern" or "?pattern" is used to search for the previous occurrence.

NAVIGATE THROUGH SEARCH PATTERNS
- "n" for forward navigation.
- "N" for reverse navigation.

SUBSTITION COMMAND
- ":%s/old-pattern/new-pattern/gc"
- ":" is used to enter command mode.
- "%" means it involves every line in the entire file instead of the current line. The default is the current line.
- "g" means it involves every occurrence of the old-pattern in a line. The default is the 1st occurrence in a line.
- "c" allows you to confirm each substitution before executing it.

OPENING A FILE WITH ANY COMMANDLINE EDITOR THAT IS ALREADY OPENED WITH CAT
- "vim !$" instead of typing out the name of the file
- "nvim !$" for nvim.
- "nano !$" for nano. 
- the same approach for other editors.

NAVIGATE THROUGH A LINE
In Vim, you can move the cursor within a line using various keybindings. Here are some of the keybindings for moving the cursor within a line:
- h is used to move the cursor one character to the left.
- l is used to move the cursor one character to the right.
- w is used to move the cursor forward one word.
- b is used to move the cursor backward one word.
- 0 is used to move the cursor to the beginning of the line.
- ^ is used to move the cursor to the first non-blank character of the line.
- $ is used to move the cursor to the end of the line.
- f{char} is used to move the cursor to the next occurrence of {char} on the current line.
- F{char} is used to move the cursor to the previous occurrence of {char} on the current line.
- t{char} is used to move the cursor to just before the next occurrence of {char} on the current line.
- T{char} is used to move the cursor to just after the previous occurrence of {char} on the current line.
- / is used in command mode to search for the next occurrences (in every line) of string. Use n and N to navigate.
- ? is used in command mode to search for the previous occurrences (in every line) of string. Use n and N to navigate.
- * is used to search for the next occurrences (in every line) of a string under or nearest to the cursor.
- # is used to search for the previous occurrences (in every line) of a string under or nearest to the cursor.
NOTE: You can prefix many of these commands with a number to repeat the movement that many times. For example,
- 3w will move the cursor forward three words.
- 3f{char} will move the cursor to the third occurrence of {char} on the current



***********************************************************************************************
WHAT I'VE LEARNT FROM BOTH ARMLITE AND ARM64
2023.jul.8 sat 2138mf (this is the earliest date, i.e. the first time I wrote on this file)
This is where I practise armlite assembly. The following are some of the things I understand along the way, using armlite book, reference manual and simulator (little man computer):

MEANING OF MNEMONICS:
  mov -- MOVe
  ldr -- LoaD Register
  str -- STore Register
  adr -- ADdress Register

MEMORY ADDRESS AND IMMEDIATE VALUE
- A memory address is the address of a memory location.
- An immediate value is a number that is directly written or manually entered to a register.

USING MEMORY ADDRESSES AND IMMEDIATE VALUES WITH MNEMONICS
- A number or string is a memory address.
  -- e.g. "ldr r0, 8"    ; Means load register r0 with the value stored in memory address 8.
- A number or string is an immediate value when the hash symbol is prepended to it.
  -- e.g. "mov r0, #3"    ; Means move into register r0 the immediate value 3.
- A memory address cannot be used with a MOV instruction.
- An immediate value cannot be used with a LDR or STR instruction.

STACK POINTER
- The value in the SP (stack pointer) register typically indicates the next address to pop, just as the PC (program counter) register indicates the next address to execute instruction. So, I wonder the mechanism behind pushing to stack.
- PUSH and POP should be at the beginning and end of subroutine respectively.
- the registers to be pushed, are the ones to be used in the subroutine, as well as the register that is used to link back from the subroutine.
- although LR is the in-built register used by armlite for linking back, an armlite assembly programmer can choose any of the general purpose registers to use as his link back register.

2023.sep.5 tue 1858mf
LABEL
- A label or symbol is, in my own words, a "nick name" for the address of a memory location. A label is used because it is more memorable than an address (which is actually a number).
- An anology for label: label is to memory address, as comment is to code. This is a rough or not-so-accurate analogy, but it gives you an idea.

LDR, STR, MOV, STR
- When you want to transfer data between a register and a memory address, you use LDR and STR instructions respectively.
- Sometimes it is important to place the address of a memory location (not the data in the memory location) inside a register. For instance, if 0x0010 is a memory address that you want to place in register r0, you can do it in the following ways for armlite and arm respectively,
  mov r0, #0x0010  ; armlite (will also work for arm)
  adr r0, 0x0010  ; arm  (?! I am now beginning to doubt if this is a valid arm64 instruction. 2023.nov.12 sun 1549mf)
- the above "mov" and "adr" mnemonics can be literally interpreted as follows:
  -- mov r0, #0x0010  ; move into register r0 the immediate value 0x0010. That is, since the address is known, it is manually written to r0 as an immediate value.
  -- adr r0, 0x0010  ; move into register r0 the immediate value that is derived from the given address of the memory location you are interested in.
- NOTE: As can be observed above, if the memory address is known, the "mov" instruction can also be used in arm to write the address to a register.
- If you don't know the address of the memory location, but there is a label for it, you can place the address of the memory location inside a register like so,
  mov r0, #addressLabel  ; armlite (this approach will not work in arm)
  adr r0, addressLabel  ; arm
- the above "mov" and "adr" mnemonics can be literally interpreted as follows:
  -- mov r0, #addressLabel  ; move into register r0 the immediate value that is derived from the address of the memory location labelled "addressLabel".
  -- adr r0, addressLabel  ; move into register r0 the immediate value that is derived from the address of the memory location labelled "addressLabel".

2023.sep.10 sun 2201mf
- In ARMlite assembly, if you wish to make use of an interrupt, there are three things to do:
  -- set up interrupt
  -- write your main program
  -- write your desired interrupt routine

**LINKER PALAVER! :)
2023.oct.29 sun 1249mf
2023.nov.5 sun 1730mf (added a few more things I learnt about linkers)
2023.nov.15 wed 1408mf

- ld filename.o -o filename -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

- reference: "https://stackoverflow.com/questions/70592614/capture-input-in-assembly-arm-64-bit-mac-os"

- breakdown of the last two components of the above command:
  -- "-e _start": the -e flag is used to state the label that is used to identify the the entry point to the main code of the program. In this case the label is "_start". I guess the meaning of -e should be "entry point".
  -- "-arch arm64": the -arch flag is used to indicate the architecture the program is written for.

- various ways of finding sdk path
(1) The linker command for macos is: 
    "ld filename.o -o filename -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path`"

(2) An alternative is:
    "ld filename.o -o filename -lSystem -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"

(3) Another variant that I improvised by combining the above two is: 
    "ld filename.o -o filename -lSystem -L /`xcrun -sdk macosx --show-sdk-path`/usr/lib

(4) Yet another variant that I have derived from the first two alternatives is:
    "ld bin -o exe -lSystem -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"

- The following are my understanding or interpretation of the components of the above dynamic link command:
  -- "lSystem" means link system library. The System library is a set of system-level libraries that provide various functions and services for macOS programs. By linking with this library, your program can use macOS system functions and features.
  -- "syslibroot" means 
  -- "xcrun" is derived from "xcode" and "run". That is, "xcode run".

2023.nov.2 thu 2300mf
MY PERSONAL IMPROVISED MNEMONIC FOR "ld filename.o -o filename -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path`"
- "Link filename.o and name the final file output as filename. Link system library. System library root. Xcode run. software development kit for macosx. Show sdk path."

2023.nov.6 mon 1943mf
OBJECT DUMP COMMAND
- objdump with the -d flag (d for disassembly) can be used to convert an object file to assembly language.

2023.nov.15 wed 1142mf
ASSEMBLY DIRECTIVES
- .ascii
- .asciz
- .string -- it is more or less an alias for .asciz
