; write "the tide is high" string to standard output
; 2023.nov.7 tue 0855mf

; this program is used to practise both writing ascii characters to standard output as well as practise looping.

.global _main
.align 4

; main code
_main:
  mov x0, #1    ; argument for stdout (standard output)
  adr x1, highTide    ; memory address where block of memory allocated to string begins
  mov x2, #74    ; strlen (string length)
  mov x16, #4    ; write syscall (4 is the system call for write)
  svc 0xffff    ; supervisor call

; exit code
  mov x0, #0    ; 0 is the return value
  mov x16, #1    ; the argument 1 is the exit syscall
  svc 0xffff

highTide: .ascii "The tide is high\nBut I'm holding on\nI'm gonna be all number 1!\n"    ; strlen: 74 char