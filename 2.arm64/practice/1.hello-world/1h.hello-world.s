; 2023.sep.15 fri 1758mf
; 5th iteration: 'hello, world' program with loop

.global _main
.align 4

; main program
_main:
  mov x2, #2
repeat:
  add x2, x2, #1
  cmp x2, #16
  b.gt newline
  mov x0, #1
  adr x1, msg
  mov x16, #4
  svc 0xffff
  b repeat

; create newline at the end of the phrase
newline:
  mov x0, #1
  adr x1, new
  mov x2, #1
  mov x16, #4
  svc 0xffff

; end program
  mov x0, #0
  mov x16, #1
  svc 0xffff

msg:
  .ascii "\nI will succeed!"
new:
  .ascii "\n"
