; 2023.sep.20 wed 0637mf
; This is a practise with writing test to standard output. As the saying goes, practise makes perfect.

.global _main
.align 4

; main section
_main:
  mov x0, #1    ; 1 is for writing to stdout (standard output)
  adr x1, msg    ; write the starting address of message to x1 
  mov x2, #15    ; write the msg length in x2. It is ok to over estimate the length if you are not sure of the exact length
  mov x16, #4    ; write the syscall for writing to stdout in x16
  svc 0xffff

; end program
  mov x0, #0    ; 0 is for ending a program
  mov x16, #1    ; #1 is the exit syscall
  svc 0xffff

msg:
  .ascii "sweet mother\n"
