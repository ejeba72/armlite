; I'm having troubles reading strings from stdin
; 2023.nov.15 wed 1314mf

.global _main
.align 4

_main:
  adr x1, buffer
  mov x0, #0
  ldr x1, [x1]
  mov x2, #4
  mov x16, #3
  svc #0xffff

  mov x0, #0
  mov x16, #1
  svc #0xffff

buffer: .ds 4
