; M1 assembly language program for writing strings to stdout
; 2023.nov.14 tue 2238mf

.global _main
.align 4

_main:

; display message to user 
  mov x0, #1    ; stdout
  adr x1, msg    ; msg to user
  mov x2, #14    ; strlen
  mov x16, #4    ; write syscall
  svc #0xffff    ; supervisor call

; read user input
  mov x0, #0    ; stdin
  adr x1, buffer    ; user input
  mov x2, #128    ; maxlen for user input
  mov x16, #3    ; read syscall
  svc #0xffff    ; supervisor call

; display user input to user
  mov x0, #1    ; stdout
  adr x1, buffer    ; user input
  mov x2, #128    ; maxlen for user input
  mov x16, #4    ; write syscall
  svc #0xffff    ; supervisor call

; exit program with a return value of zero
  mov x0, #0
  mov x16, #1    ; exit syscall
  svc #0xffff    ; supervisor call

msg: .asciz "Enter string: "
buffer: .space 128
