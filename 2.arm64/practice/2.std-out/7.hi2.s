; trying my hands at stack (but this time, since it is 2 byte info, I will do without stack)
; 2023.nov.12 sun 1438mf

.global _main
.align 4

_main:
  mov x0, #1    ; stdout
  mov x1, #0x6869
  mov x2, #4
  mov x16, #4
  svc #0xffff

  mov x0, #0
  mov x16, #1
  svc #0xffff
