; 2023.sep.15 fri 1626mf
; 4th iteration: 'hello, world' program in aarch64 assembly

.global _main
.align 4

; The start of the program
_main:
  mov x0, #1
  adr x1, msg
  mov x2, 30
  mov x16, #4
  svc 0xffff

; End program
  mov x0, #0
  mov x16, #1
  svc 0xffff

msg:
  .ascii "Na wa for Wire road o!"
