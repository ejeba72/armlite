// 2023.sep.6 wed 1053mf
// Times Table: Enter a single-digit number that you want to find its product with every other single-digit number.
// NOTE: The product must fit within 32 bits to be correct.

  mov r6, #msg1
  str r6, .WriteString
  ldr r0, .InputNum
  mov r1, #0
  mov r6, #msg2
  str r6, .WriteString
repeat:
  add r1, r1, #1
  mov lr, pc
  b multiply
  str r2, .WriteUnsignedNum
  cmp r1, #9
  blt repeat
  hlt

msg1: .asciz 'Welcome to the multipy program.\nEnter number: '
msg2: .asciz '\nThe results are: '

multiply:
  push {r0,r1,r3,lr}
  mov r2, #0  // result
processRightmostDigit:
  and r3, r1, #1  // to test rightmost bit
  cmp r3, #0
  beq skip
  add r2, r2, r0
skip:
  lsr r1, r1, #1
  cmp r1, #0  // if there are no more digits
  beq end
  lsl r0, r0, #1
  b processRightmostDigit
end:
  pop {r0,r1,r3,lr}
  mov pc, lr
