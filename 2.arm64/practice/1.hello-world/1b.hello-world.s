// 2023.sep.15 fri 0057mf

.global main
.align 4

main:
  mov x0, #1
  adr x1, msg
  mov x2, #16
  mov x16, #4
  svc #1

  mov x0, #0
  mov x16, #1
  svc #1

msg:
  .ascii 'hello, world'
