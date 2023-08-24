// 2023.aug.16 wed 2141mf

// BINARY SEARCH

// r0 - base address
// r1 - array index
// r2 - lower index
// r3 - middle index
// r4 - upper index
// r5 - console message
// r6 - input value
// r7 - index difference = upper index - lower index = r4 - r2
// NOTE:
// middle index = index difference / 2 i.e. r3 = r7/2
// upper index = arrayLength - 1 i.e. nth element has an index of n-1

  mov r0, #arrayData  // defining base address
  mov r5, #msg1
  str r5, .WriteString
  ldr r6, .InputNum
  ldr r4, arrayLength
  sub r4, r4, #1  // initializing upper index
  mov r2, #0  // initializing lower index
  b search
lowerRange:
  sub r4, r3, #1  // new upper index
  b search
upperRange:
  add r2, r3, #1  // new lower index
search:
  sub r7, r4, r2  // index difference
  lsr r3, r7, #1  // middle index = index difference / 2
  lsl r10, r3, #2  // accounting for each block of memory (4 bytes per block)
  ldr r8, [r0 + r10]  // load into r8 the middle index value
  add r9, r0, r10  // the memory address of middle index value
  cmp r6, r8  // compare input value with middle index value
  blt lowerRange
  bgt upperRange
  beq found
  mov r5, #msg3
  str r5, .WriteString
  b endProgram
found:
  mov r5, #msg2
  str r5, .WriteString
  str r9, .WriteHex
endProgram:
  hlt

arrayLength: 10
arrayData: 0
  1
  2
  3
  4
  5
  6
  7
  8
  9
msg1: .asciz 'Enter the number you wish to search for:\n'
msg2: .asciz 'The number is in index: '
msg3: .asciz 'Number not found in array'
