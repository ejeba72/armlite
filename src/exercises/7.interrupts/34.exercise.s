// 2023.sep.7 thu 1132mf

// Main program
  mov r1, #.PixelScreen
  mov r2, #0
paintPixel:
  mov r0, #.Random
  str r0, [r1+r2]
  add r2, r2, #4
  cmp r2, #12288
  blt paintPixel
  mov r2, #0
  b paintPixel


// OBSERVATION:
There is a benign bug in this program. However the program still works fine, howbeit, not exactly as intended. It is interesting, so I'm going to leave it as it is. And do my correction in another file.
