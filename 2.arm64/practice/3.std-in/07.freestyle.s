; This is me just freestyling. I won't check any reference or previous work, unless I get stuck
; 2023.nov.24 fri 1324mf

.global jollofRice
.align 4

jollofRice:
; Tell the user to enter a string
  mov x0, #1    ; stdout
  adrp x1, msgToUsr@page    ; adr to write from, labelled msgToUsr
  add x1, x1, msgToUsr@pageoff
  mov x2, #15    ; strlen
  mov x16, #4    ; write syscall
  svc 0xffff   ; supervisor call

; Read string from user
  mov x0, #0    ; stdin
  adrp x1, buffer@page    ; adr to read from, labelled buffer
  add x1, x1, buffer@pageoff    ; I assume "pageoff" should mean "page offset"
  mov x16, #3    ; read syscall
  svc 0xffff    ; supervisor call

; Write the string to stdout
  mov x0, #1    ; stdout
  adrp x1, buffer@page    ; adr to write from, labelled buffer
  add x1, x1, buffer@pageoff    ; pageoff should mean page offset
  mov x16, #4    ; write syscall
  svc 0xffff    ; supervisor call

; Exit program
  mov x0, #0    ; stdin
  mov x16, #1    ; exit syscall
  svc 0xffff    ; supervisor call

.data
msgToUsr: .ascii "Enter a string\n"
buffer: .ds 256    ; you can use .ds or .space
