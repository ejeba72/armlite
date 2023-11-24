; This code is from stackoverflow. However, I have decided to tinker with it, in order to learn from it.
; "https://stackoverflow.com/questions/70592614/capture-input-in-assembly-arm-64-bit-mac-os"
; 2023.nov.15 wed 1349mf
; 2023.nov.19 sun 0913mf
; 2023.nov.21 tue ~1930mf

.global _main
.align 2

_main:


; Tell user to enter string
  mov x0, #1    ; stdout
  adrp x1, msgToUsr@page    ; address where string begins
  add x1, x1, msgToUsr@pageoff
  mov x2, #15    ; strlen
  mov x16, #4    ; write syscall
  svc 0xffff

                                // READ IN FROM KEYBOARD
    mov X16, 3                  // Tell system we want to read from StdIn (#3)
    mov X0, 0                   // Focus on the keyboard (#0)
    mov X2, 20                  // Define length of string to read in

    adrp    x1, buffer@page        // Load the address of the message
    add x1, x1, buffer@pageoff     // Store the address to x1

    svc 0                       // Call kernel to perform the action

_write:
    mov X16, 4                  // Tell system we want to write to StdOut (#4)
    mov X0, 1                   // Focus on the screen (#1)

    adrp    x1, buffer@page        // Load the address of the message
    add x1, x1, buffer@pageoff     // Store the address to x1

    svc 0                       // Call kernel to perform the action

_end:
    mov X0, 0                   // Return 0 (get a run error without this)
    mov X16, 1                  // System call to terminate this program
    svc 0                       // Call kernel to perform the action

.data
buffer: .ds 20                      // 20 bytes of memory for keyboard input
msgToUsr: .ascii "Enter a string\n"
