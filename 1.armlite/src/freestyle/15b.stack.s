// 2023.sep.1 fri 1223mf

// NOTE:
// Pixel Resolution: Mid-res = 64x48 (ie 64 pixels per row, and 48 of such rows from top of the screen to the bottom of the screen)
// "Pixel value" for pixel with pixel position (AxB) = A + (B*64) 
// "Pixel address" for pixel with pixel position (AxB) = [A + (B*64)] * 4

// define registers (Note: mid-res --> 64x48)
// r0 - color
// r1 - A
// r2 - B
// r3 - B*64
// r4 - A + (B*64)
// r5 - [A + (B*64)]*4  ie pixel value * 4 bytes
// r6 - base register for pixel position
// r7 - intentionally (experimentation purpose) use r7 for linking back to and from subroutine

  mov r0, #.green  // set pixel color

// set the initial pixel position
  mov r1, #32
  mov r2, #24
  push {r0-r6, r8-r12}
  mov r7, pc
  b drawPixel
  hlt

// draw pixel subroutine
drawPixel:
  lsl r3, r2, #6
  add r4, r1, r3
  lsl r5, r4, #2
  mov r6, #.PixelScreen  // place pixel base address into r6
  str r0, [r6+r5]  // draw pixel pixel on the desired screen location
  pop {r0-r6, r8-r12}
  mov pc, r7
