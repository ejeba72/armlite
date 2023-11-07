; hello, world in arm64 assembly
; 2023.nov.3 fri 1111mf

.global _main
.align 4

; start program
_main:
  mov x0, #1
  adr x1, hi
  mov x2, #12
  mov x16, #4  ;write system call
  svc 0xffff

; exit program
  mov x0, #0
  mov x16, #1
  svc 0xffff

; define variables and/or constants below
hi: .ascii "hello, world"
