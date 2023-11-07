// 2023.jul.30 sun 0007mf
// bubble sort, 2nd iteration (use of two base addresses for the successive array elements been compared)
// loops: comparismLoop and stageLoop
// maximum comparismLoop index = (arrayLength - 1) * 4 bytes per memory width

  mov r0, #arrayData  // r0 is the base address of the present element
  add r1, r0, #4  // r1 is the base address of the successive element
  ldr r2, arrayLength  // length of array
  sub r2, r2, #1  // maximum index of comparismLoop
  lsl r2, r2, #2  // maximum index of comparismLoop with address width (4 bytes) been factored in
  mov r3, #0  // initializing comparismLoop with index of 0
  ldr r4, [ r0 + r3 ]
  ldr r5, [ r1 + r3 ]
  cmp r4, r5
  bgt swapNumbers
swapNumbers:
  str r4, [ r1 + r3 ]
  str r5, [ r0 + r3 ]
  halt

arrayLength: 10
arrayData: 9  // 1st element
           8
           7
           6
           5
           4
           3
           2
           1
           0
