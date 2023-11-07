; 2023.sep.15 fri 1758mf
; 5th iteration: 'hello, world' program with loop

.global _main
.align 4

; main program
_main:
  mov x0, #1
  adr x1, msg
  mov x2, xzr
loop:
  add x2, x2, #1
  cmp x2, #25
  b.cc endProgram
  mov x16, #4
  svc 0xffff
  b loop

; end program
endProgram:
  mov x0, #0
  mov x16, #1
  svc 0xffff

msg:
  .ascii "\nI will succeed!"
