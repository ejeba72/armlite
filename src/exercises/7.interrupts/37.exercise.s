; 2023.sep.9 sat 1753mf
; Code for clock interrupt

; Set up interrupt
  mov r0, #pixelClock
  str r0, .ClockISR
  mov r0, #1000
  str r0, .ClockInterruptFrequency
  mov r0, #1
  str r0, .InterruptRegister

; Main program
mainProgramLoop:
  b mainProgramLoop

; Interrupt routine
pixelClock:
  push {r0,r1}
  mov r1, #.white
  ldr r0, .Pixel0
  eor r0, r0, r1
  str r0, .Pixel0
  pop {r0,r1}
  rfe
