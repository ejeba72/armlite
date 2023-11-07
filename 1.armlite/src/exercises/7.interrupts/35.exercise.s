// 2023.sep.7 thu 1214mf

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
writeA:
  push {r0}
  mov r0, #65
  str r0, .WriteChar
  pop {r0}
  rfe
