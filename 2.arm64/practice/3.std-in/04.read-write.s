; READ, WRITE PROGRAM
; 2023.nov.19 sun 2023

.global _main
.align 4

_main:

; Message to user
  mov x0, #1    ; stdout
  adr x1, msgToUser    ; starting address of string
  mov x2, #50    ; strlen
  mov x16, #4    ; write syscall
  svc #0xffff    ; supervisor call

; User input
  mov x0, #0    ; stdin
  adrp x1, buffer@page    ; address to store user input
  add x1, x1, buffer@pageoff
  mov x16, #3    ; read syscall
  svc #0xffff

; Exit program
  mov x0, #0
  mov x16, #1    ; exit syscall
  svc #0xffff    ; supervisor call

msgToUser: .ascii "Type the word you wish to display (max char: 200)\n"
buffer: .space 16
