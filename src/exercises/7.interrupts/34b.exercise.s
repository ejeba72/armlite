// 2023.sep.7 thu 1156mf

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
