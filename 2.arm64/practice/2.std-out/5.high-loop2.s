; write "the tide is high" string to standard output
; 2023.nov.7 tue 0855mf

; this program is used to practise both writing ascii characters to standard output as well as practise looping.

.global _main
.align 4

; main code
_main:
  mov x3, #2
loop:
  mov x0, #1    ; argument for stdout (standard output)
  adr x1, highTide    ; memory address where block of memory allocated to string begins
  mov x2, x3    ; strlen (string length)
  mov x16, #4    ; write syscall (4 is the system call for write)
  svc 0xffff    ; supervisor call
  add x3, x3, 1    ; increment x3 by 1
  cmp x3, #74
  ble loop

; exit code
  mov x0, #0    ; 0 is the return value
  mov x16, #1    ; the argument 1 is the exit syscall
  svc 0xffff

highTide: .ascii "\nThe tide is high. But I'm holding on. I'm gonna be all number 1!\n"    ; strlen: 74 char
