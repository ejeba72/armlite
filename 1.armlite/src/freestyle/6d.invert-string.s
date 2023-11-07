// 2023.aug.28 mon 1012mf
// program that will receive a string and invert the positions of the characters in the strings.
// define registers:
// r0 - memory address of inputed string
// r1 - index address of individual characters of string 
// r2 - ascii value for individual characters of string
  mov r0, #myString
  str r0, .ReadString
  mov r2, #0
  push {r2}
  ldrb r2, [r0+r1]
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

// P.S.
// I really want to optimize the pushLoop. But I realise that what was done in my previous iteration is the best I can come up with for now. My previous iteration is not the above code. Instead, it is in a different file, which is presently named "6c.invert-string.s". I ended up, for the pushLoop section, with the same code that is in the armlite book. The above code is a more earlier iteration of my work which can  presently be found in "6b.invert-string.s". I wanted to start with it in an attempt to get something more optimized than the last iteration. Alas, I am expending too much time.
