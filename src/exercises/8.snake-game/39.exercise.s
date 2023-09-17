// 2023.sep.12 tue 1949mf
// 1ST ITERATION OF SNAKE GAME

  mov r0, #.green
  mov r1, #.PixelScreen
  mov r2, #0
paintPixelLoop:
  str r0, [r1+r2]
  add r2, r2, #4
  b paintPixelLoop
