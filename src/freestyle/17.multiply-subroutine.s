// 2023.sep.6 wed 0946mf
// Multiply subroutine: multiplies two integers in r0 and r1 returning the product in r2
// The product must fit within 32 bits to be correct.

  mov r6, #msg1
  str r6, .WriteString
  ldr r0, .InputNum
  mov r6, #msg2
  str r6, .WriteString
  ldr r1, .InputNum
  mov lr, pc
  b multiply
  mov r6, #msg3
  str r6, .WriteString
  str r2, .WriteUnsignedNum
  hlt

msg1: .asciz 'Welcome to the multipy program.\nEnter the first number you wish to multiply: '
msg2: .asciz 'Enter the second number: '
msg3: .asciz '\nThe result is: '

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
