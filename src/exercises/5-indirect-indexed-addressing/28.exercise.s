// Define & initialise registers
MOV R0, #arrayData //Address of array data
LDR R1, arrayData
LSL R1, R1, #2 //Multiply this by 4 (for byte count) 
MOV R2, #0 //outerLoop counter initialized
// R3 innerLoop counter
// R4 length of innerLoop
// R5 spare index into array
// R6 first in pair
// R7 second in pair
// R8 ?
startOfOuterLoop:
MOV R3, #0 //reset inner loop counter to zero
SUB R4, R1, R2 //set innerloop max to data length - outerLoopCounter... 
SUB R4, R4, #4 //...minus 4 more
MOV R8, #0
innerLoop:
LDR R6, [R0+R3] //Load first value from address (base + index) 
ADD R5, R3, #4 //Generate index for second value in pair
LDR R7, [R0+R5] //Load second value
CMP R6, R7 //Compare and swap if appropriate
BGT swap
B continueInnerLoop
swap:
   STR R7, [R0+R3]
   STR R6, [R0+R5]
   MOV R8, #1
continueInnerLoop:
   ADD R3, R3, #4
   CMP R3, R4 //Check if reached the end
   BLT innerLoop
continueOuterLoop:
   CMP R8, #0
   BEQ done
   ADD R2, R2, #4
   CMP R2, R1
   BGT done
   B startOfOuterLoop
done: HALT
.ALIGN 256 //Just to make data distinct from code in memory view. arrayLength: 10
arrayData: 6 //1st element
   3
   2
   1
   0
   4
   8
   7
   9
   5 //last element
