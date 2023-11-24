; This is me just attempting to practice...
; 2023.nov.21 tue 1919mf
; Remark: I observe that the maximum length of string that I can enter is about 15 or 16 bytes long (that is 15 or 16 characters). It doesn't matter how many bits of block memory I reserve in the "msgFrmUsr" label. Consequently, I perceive that it could be because the maximum size of a register is 16 bytes. That is, the register could be the limiting factor. I need to make use of the stack.

.global bolanle
.align 4

bolanle:
; Request user to enter string
  mov x0, #1    ; stdout
  adrp x1, msgToUsr@page    ; adr of msgToUsr
  add x1, x1, msgToUsr@pageoff
  mov x2, #15    ; strlen
  mov x16, #4    ; write syscall
  svc 0xffff    ; supervisor call

; Read the string user enters
  mov x0, #0    ; stdin
  adrp x1, msgFrmUsr@page    ; adr of msgFrmUsr
  add x1, x1, msgFrmUsr@pageoff
  mov x16, #3    ; read syscall
  svc 0xffff

; Write the string to stdout
  mov x0, #1    ; stdout
  adrp x1, msgFrmUsr@page    ; adr of msgFrmUsr
  add x1, x1, msgFrmUsr@pageoff
  mov x16, #4    ; write syscall
  svc 0xffff    ; supervisor call

; Exit program
  mov x0, #0    ; stdin
  mov x16, #1    ; exit syscall
  svc #0xffff    ; supervisor call

.data
msgToUsr: .ascii "Enter a string\n"
msgFrmUsr: .ds 1024    ; you can use .space or .ds
