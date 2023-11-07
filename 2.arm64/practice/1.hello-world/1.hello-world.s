; 2023.sep.13 wed 1620mf
; 'hello, world' for apple silicon

.global _main
.align 4

_main:
  mov x0, #1
  adr x1, helloWorld
  mov x2, #16  ; length of the string
  mov x16, #4
  svc #1

  mov x0, #0
  mov x16, #1  ; unix exit system call
  svc #1

helloWorld:
  .ascii "hello, world\n"
