// 2023.jul.24 mon 2121mf
// Exercise 27

// (A.) Indexed version:
  mov r0, #.red
  mov r1, #.PixelScreen
  mov r2, #0
repeat: str r0, [ r1 + r2 ]
  add r2, r2, #4
  cmp r2, #256
  blt repeat
  halt

// (B.) Vertical green line:
// NOTE: 4 bytes per pixel, (4 * 64) bytes per horizontal line, (4 * 64 * 48) bytes for the entire screen.
  mov r0, #.green
  mov r1, #.PixelScreen
  mov r2, #0
repeat: str r0, [ r1 + r2 ]
  add r2, r2, #256
  cmp r2, #12288
  blt repeat
  halt

// (C.) Solid blue rectangle, 20 pixels wide by 10 pixels deep:
  mov r0, #.blue
  mov r1, #.PixelScreen
  mov r2, #0         // starting pixel for each line
  mov r3, #80        // ending pixel for each line (20 pixels * 4 bytes per pixel = 80 bytes)
nextPixel: str r0, [ r1 + r2 ]
  add r2, r2, #4
  cmp r2, r3
  blt nextPixel
  add r2, r2, #176   // starting point of next line of pixels
  add r3, r2, #80    // ending point of next line of pixels
  cmp r2, #2560
  blt nextPixel
  halt

