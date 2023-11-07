// 2023.aug.29 tue 2248mf

  mov r0, #.green
  mov r1, #32  // x-coordinate (64 columns of pixels; from 0 to 63)
  mov r2, #24  // y-coordinate (48 rows of pixels; from 0 to 47)

drawPixel:
  mov r3, #.PixelScreen
  lsl r4, r1, #2  // for the x-coordinate, multiply by 4 bytes
  lsl r5, r2, #8  // for the y-coordinate, multiply by 256, which is the product of 4 bytes and 64 pixels per row
  add r6, r4, r5
  str r0, [r3+r6]
  hlt
