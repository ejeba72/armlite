// 2023.aug.24 thu 2140mf
// program to invert word.

  mov r0, #128
  str r0, .ReadString
  mov r0, #0
  push {r0}
pushLoop:
  mov r0, #128
  hlt
