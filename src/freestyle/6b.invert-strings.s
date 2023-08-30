// 2023.aug.26 sat 1833mf
// program that will receive a string and invert the positions of the characters in the strings.
// define registers:
// r0 - memory address of inputed string
// r1 - index address of individual characters of string 
// r2 - ascii value for individual characters of string
  mov r0, #myString
  str r0, .ReadString
  mov r2, #0
  push {r2}
pushLoop:
  ldrb r2, [r0+r1]
  push {r2}
  add r1, r1, #1
  cmp r2, #0
  bgt pushLoop
  mov r1, #0
popLoop:
  pop {r2}
  strb r2, [r0+r1]
  add r1, r1, #1
  cmp r2, #0
  beq writeString
  b popLoop
writeString:
  str r0, .WriteString
  hlt
.align 64
myString:
