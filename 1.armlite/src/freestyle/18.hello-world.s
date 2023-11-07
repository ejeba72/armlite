// 2023.sep.15 fri 0016mf

  mov r0, #msg
  str r0, .WriteString
  hlt

msg:
  .asciz 'hello, world\n'
