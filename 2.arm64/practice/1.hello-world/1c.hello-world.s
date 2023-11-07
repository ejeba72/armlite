; 2023.sep.15 fri 0936mf
; 3rd iteration: 'hello, world' with arm64 Assembly

.global _main
.align 4

; write 'hello, world'
_main:
  mov x0, #1
  adr x1, msg
  mov x2, #16  ; string length
  mov x16, #4
  svc #1

; exit program
  mov x0, #0
  mov x16, #1
  svc #1

msg:
  .ascii "hello, world"
