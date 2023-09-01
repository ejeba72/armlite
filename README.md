2023.jul.8 sat 2138hr

This is where I practise armlite assembly. The following are some of the things I understand along the way, using armlite book, reference manual and simulator (little man computer):

- A number or string is a memory address.
- A number or string is an immediate value when the hash symbol is prepended to it.
- A memory address cannot be used with a mov instruction.
- An immediate value cannot be used with a ldr or str instruction.
- The value in the SP (stack pointer) register typically indicates the next address to pop, just as the PC (program counter) register indicates the next address to execute instruction. So, I wonder the mechanism behind pushing to stack.
- push and pop should be at the beginning and end of subroutine respectively.
- the registers to be pushed, are the ones to be used in the subroutine, as well as the register that is used to link back from the subroutine.
- although lr is the in-built register used by armlite for linking back, armlite assembly programmer can choose any of the general purpose register to use as his link back register.
