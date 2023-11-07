; "hello, world" program
; 2023.nov.3 fri 1852mf

.global _main
.align 4

; start program
_main:
  mov x0, #1
  adr x1, hi
  mov x2, #13
  mov x16, #4
  svc 0xffff

; end program
  mov x0, #0
  mov x16, #1
  svc 0xffff

; variables/constants section
hi: .ascii "hello, world\n"
