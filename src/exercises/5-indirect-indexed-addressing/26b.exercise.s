// 2023.jul.24 mon 1819mf

  mov r0, #.red 
  mov r1, #.PixelScreen
  mov r2, #0
repeat: add r3, r1, r2
  str r0, [r3]
  add r2, r2, #4
  cmp r2, #256
  blt repeat
  halt
