// 2023.jul.28 fri 1932mf
// Bubble Sort
// My Understanding Of Bubble Sort:
// The 1st and 2nd numbers in an array of numbers, are compared. If the 1st number is greater than the 2nd number, there will be a position swap of the numbers. Otherwise, no swap will occur. Then the 2nd and 3rd numbers are compared. If the 2nd number is greater than the 3rd number, there would be a swap. Otherwise, no swap will occur. This process is repeated until the 2nd-to-the-last number is compared with the last number in the array. Afterwards, if there was no need to swap any of the numbers, because, they are sorted, the program ends. Otherwise, a second stage of comparing successive numbers and swapping them if need bbe, will be initiated. More stages will be initiated, until a stage is reached where for such stage, no swapping of numbers occured. If such a stage is reached, the program will end. Let me emphasize that the stage where no swapping occurs in each of the comparism, indicates that the numbers in the array are sorted.
// PseudoCode:
// There will be two loops. The first loop will be called stageLoop. The second loop will be called comparismLoop.
// Maximum number of stageLoops is equal to arrayLength (My assumption)
// Maximum number of comparismLoops is equal to arrayLength - 1 (My hypothesis)
// 1st element of number array is in #arrayData address
// last element of number array is in [(arrayLength - 1) * 4 bytes] address in memory. Note: Each memory address is 4 bytes wide.
// successive elements in array are seperated by 4 bytes.

  mov r0, #arrayData  // base address of array
  ldr r1, arrayLength
  sub r1, r1, #1
  lsl r1, r1, #2  // index address of last element in number array. Multiply by 4 because each memory address is 4 bytes wide
  mov r2, #0  // index address of present element, initialized to zero, since index address of 1st element is zero
  add r3, r2, #4  // index address of the next successive array element
  ldr r4, [ r0, r2 ]   // using index addressing to get the value of the current array element
  ldr r5, [ r0, r3 ]  // using index addressing to get the value of the next array element
  cmp r3, r4
  bgt swap
swap:
  str r4, [ r0, r3 ]
  str r5, [ r0, r2 ]
  hlt

arrayLength: 10
arrayData: 9 // 1st element
  8
  7
  6
  5
  4
  3
  2
  1
  0 // last element
