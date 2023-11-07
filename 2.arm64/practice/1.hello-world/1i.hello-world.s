; hello, world
; 2023.oct.27 fri 1014mf

  .global _main
  .align 4

; main program
; STEPS:
; 1. move into x0 your desired output type. e.g standard output.
; 2. move into x1 the strings you wish to print.
; 3. move into x2 the length of the string.
; 4. move into x16 your desired syscall.
; 5. call kernel to output the string.

_main:
  mov x0, #1
  adr x1, hello
  mov x2, #12
  mov x16, #4
  svc #0xffff
 
hello: .ascii "hello, world"
