; PRACTICE SESSION
; 2023.oct.30 mon 2130mf

.global _main
.align 4

_main:
  mov x0, #1
  adr x1, hello
  mov x2, #20
  mov x16, #4
  svc 0xffff

  mov x0, #0
  mov x16, #1
  svc 0xffff

hello: .ascii "hello, world\n"
