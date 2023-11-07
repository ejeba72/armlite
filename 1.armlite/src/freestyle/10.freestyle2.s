// 2023.aug.24 thu 0125mf

  mov r0, #0x00a4
  str r0, .ReadString
  mov r1, #67
  strb r1, 80
  mov r2, #21
  strb r2, 83
  hlt
