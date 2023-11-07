// 2023.sep.8 fri 2043mf

// Set up interrupt
  mov r0, #pressKey
  str r0, .KeyboardISR
  mov r0, #1
  str r0, .KeyboardMask
  str r0, .InterruptRegister

// Main program
  mov r1, #.PixelScreen
  mov r2, #0
paintPixelLoop:
  ldr r0, .Random
  str r0, [r1+r2]
  add r2, r2, #4
  cmp r2, #12288
  blt paintPixelLoop
  mov r2, #0
  b paintPixelLoop

// Interrupt routine
pressKey:
  push {r0}
  ldr r0, .LastKey
  str r0, .WriteChar
  pop {r0}
  rfe
