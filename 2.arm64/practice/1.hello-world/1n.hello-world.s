; "hello, world" program in in arm64 assembly
; 2023.nov.5 sun 1112mf

.global _main
.align 4

; Start program
_main:
  mov x0, #1    ; move into register x0 the immediate value 1 (1 represent stdout)
  adr x1, hello    ; move into register x1 the value in memory that begins at the memory location labelled "hello" (this value is actual the string that I wish to display to standard output)
  mov x2, #13    ; move into register x2 the immediate value 13 (13 is the length of the string in value in memory)
  mov x16, #4    ; move into register 16 the immediate value 4 (4 represents the syscall for write, register 16 is reserved for entering syscalls)
  svc 0xffff    ; supervisor call (it is used to invoke supervisor mode, also known as kernel mode or priviledge mode)

; End program
  mov x0, #0    ; (return value)
  mov x16, #1    ; (1 is the syscall for exit)
  svc 0xffff    ; (invoke kernel mode)

hello: .ascii "hello, world\n"

; NOTE:
; Values in x0, x1 and x2 are arguments for the system call that would be made in x16.
; In the above case, the system call is a write system call.
; The first argument value in x0, tells the computer where to write to. A value of 1 means write to standard output.
; The second argument is a pointer to the string that should be written.
; The third argument indicates the length of the string. However, what I observe is that if the value is too short, only the initial part of the string is written to output. But if the value is more than needed, there is no apparent consequence. This makes me to assume that the third argument is used to instruct the computer on what size of memory to reserve for the display of the string.
; The value in x16, from my own rookie-level understanding, tells the computer what task to perform which I believe is what is known as system call. 
