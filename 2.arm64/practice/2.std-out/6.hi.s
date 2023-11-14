; trying my hands at stack
; 2023.nov.12 sun 1438mf

.global _main
.align 4

_main:
  mov x8, #0x6869
  str x8, [sp, #-16]!
  mov x0, #1    ; stdout
  mov x1, sp
  mov x2, #4
  mov x16, #4
  svc #0xffff

  mov x0, #0
  mov x16, #1
  svc #0xffff
