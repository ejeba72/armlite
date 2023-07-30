// date started: 2023.jul.30 sun 0909mf
// date completed: 2023.jul.30 sun 1236mf
// bubble sort, 3rd iteration: use of two base addresses (instead of one base address) for the two successive numbers been compared in the array.
// loops: comparismLoop and stageLoop
// maximum comparismLoop index = (arrayLength - 1) * 4 bytes per memory width
// the comparismLoop compares each number in an array, with the next successive number in that array. If a number is greater than the next successive number, a position swap is made between them. Otherwise, their positions are maintained.
// the comparismLoop is repeated for every number in the array, except the last number in the array. Because, the last number has no successive number next to it, to be compared with.
// when every number has been compared, if at least one swap occurred during the present stage of comparing all the numbers, another stage of comparing all the numbers will occur. More and more stages will occur until a stage is reached when no single swap occured in the entire process of comparing all the numbers in the array. When this stage is reached, the entire array would be guaranteed to be sorted.

// PURPOSE OF REGISTERS
// r1 - base address of present number. Present number is the number presently been compared with the next successive number
// r2 - base address of successive number. Successive number is the next successive number
// r3 - index address of both present number and successive number
// r4 - present number is loaded into r4
// r5 - successive number is loaded into r5
// r6 - swap indicator. That is, r6 is used to determine if a position swap occurred during a stage of number comparisms

  mov r0, #arrayData
  add r1, r0, #4
  ldr r2, arrayLength  // length of array
  sub r2, r2, #1  // maximum index of comparismLoop
  lsl r2, r2, #2  // maximum index of comparismLoop with address width (4 bytes) been factored in
stageLoop:
  mov r6, #0  // reset swap indicator to 0
  mov r3, #0  // reset index address to 0
comparismLoop:
  ldr r4, [ r0 + r3 ]
  ldr r5, [ r1 + r3 ]
  cmp r4, r5
  bgt swapNumbers
  b continueComparismLoop
swapNumbers:
  str r4, [ r1 + r3 ]
  str r5, [ r0 + r3 ]
  mov r6, #1  // change the value of r6 from 0 to 1 to indicate that at least one swap has occurred in the present stage
continueComparismLoop:
  add r3, r3, #4
  cmp r3, r2
  blt comparismLoop
  cmp r6, #1
  beq stageLoop
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
