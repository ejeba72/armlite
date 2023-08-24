// 2023.aug.11 1147mf
// My implementation of binary search algorithm.
// Although this is an exercise from the ARMLITE book by Richard Pawson and Peter Higginson, I have decided to not look at the example in the book for guidiance. Instead, I am researching binary search algorithm. As well as attempting to understand and implement the pseudocode in assembly language. The resource I am using right now is wikipedia. 
// It is also worth noting that I am writing this by the hospital bed of my dad. He had a brain surgery.

// IDEA FOR THE ALGORITHM: 
// * there would be a middle index, lower index, and upper index
// * At each point in time, middle index = (lower index + upper index) / 2
// r0 - lower index
// r1 - upper index
// r2 - middle index
// r3 - difference between upper index and lower index
// r4 - difference between upper index and lower index, divided by 2
// r5 - value in the middle index
// r6 - console message register
// r7 - value been searched
// NOTE: middle index = lower index + difference between upper index and lower index, divided by 2
// That is, middle index, r2 = r0 + r4

  mov r3, #arrayLength
  lsr r4, r3, #1  // divide the difference between upper index and lower index by 2 and store it in r4 (the value is actually the middle index)
  mov r0, #arrayData  // current lower index
  add r2, r0, r4  // r2 = r0 + r4
  ldr r5, [r2]
  mov r6, #msg
  str r6, .WriteString
  ldr r7, .InputNum
  cmp r7, r5
numberFound: sub r8, r2, r0
  str r8, .WriteUnsignedNum
  halt

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
msg: .asciz 'Enter the number you wish to search for:'
