; 2023.sep.15 fri 2150mf

paintPixelRoutine:
  lsl r4, r4, #2  ; pixel position along the horizontal axis
  lsl r5, r5, #8  ; pixel position along the vertical axis (I have assumed screen resolution of 64x48)
  add r3, r4, r5
  mov r0, #.green
  mov r1, #.PixelScreen
  mov r2, r3
  str r0, [r1+r2]
  ret

; move snake right
moveRight:
  add r4, r4, #1
