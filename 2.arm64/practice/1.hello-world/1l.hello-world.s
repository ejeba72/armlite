; hello, world program
; 2023.nov.3 fri 1241mf

.global _main
.align 4

; start program
_main:
  mov x0, #1  ; mov into x0, the immediate value 1, which stands for stdout
  adr x1, hi  ; mov into x1 the value in the hi memory address
  mov x2, #13; mov into the x2 the immediate value 12, which represents the string length of the string that begin in hi
  mov x16, #4  ; mov into x16 the immediate value 4, 4 stands for write system call
  svc 0xffff  ; initiate supervisor mode (i.e. kernel mode)

; exit program
  mov x0, #0  ; mov into x0 the immediate value 0, i.e. return 0
  mov x16, #1  ; mov into x16 the immediate value 1
  svc 0xffff  ; initiate supervisor mode (i.e. kernel mode) 

hi: .ascii "hello, world\n"
