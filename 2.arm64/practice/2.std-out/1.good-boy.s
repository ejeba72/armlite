; 2023.sep.17 sun 2033mf
; write string to standard output

.global _main
.align 4

_main:
  mov x0, #1    ; 1 is the code for std output
  adr x1, msg    ; place in x1 the memory address of msg
  mov x2, #11    ; 11 is the length of the string labelled as msg (ie the number of char)
  mov x16, #4    ; 4 is the system call for write
  svc 0xffff    ; supervisor mode

  mov x0, #0    ; 0 is for return
  mov x16, #1    ; 1 is the exit system call
  svc 0xffff    ; supervisor mode

msg:
  .ascii "a good boy\n"
