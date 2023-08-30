// 2023.aug.30 wed 1835mf

// define registers:
// r0 - pixel color
// r1 - x-coordinate (64 columns of pixels; from 0 to 63)
// r2 - y-coordinate (48 rows of pixels; from 0 to 47)

// assign r0 the color Green
  mov r0, #.green

// draw a line from 6x10 to 57x10 pixels
  mov r1, #6
  mov r2, #10
  mov lr, pc
  b drawPixel
drawLine:
  add r1, r1, #1
  mov lr, pc
  b drawPixel
  cmp r1, #57
  blt drawLine
  hlt

drawPixel:
  mov r3, #.PixelScreen
  lsl r4, r1, #2  // for the x-coordinate, multiply by 4 bytes
  lsl r5, r2, #8  // for the y-coordinate, multiply by 256, which is the product of 4 bytes and 64 pixels per row
  add r6, r4, r5
  str r0, [r3+r6]
  mov pc, lr
