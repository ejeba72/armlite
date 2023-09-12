// 2023.sep.10 sun 2213mf
// Click-pixel interrupts

// Set up interrupt
  mov r0, #paint
  str r0, .PixelISR
  mov r0, #1
  str r0, .PixelMask
  str r0, .InterruptRegister
  mov r12, #.red

// Main program
emptyLoop:
  b emptyLoop

// Interrupt routine
paint:
  push {r1,r2}
  mov r1, #.PixelScreen
  ldr r2, .LastPixelClicked
  lsl r2, r2, #2  ; multiply for 4 (ie 4 bytes per pixel)
  str r12, [r1+r2]
  pop {r1,r2}
  rfe
