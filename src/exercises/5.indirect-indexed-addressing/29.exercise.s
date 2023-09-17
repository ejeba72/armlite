BINARY SEARCH
Replica from the ARMlite book

// Define registers
  //R0 Target value
  //R1 Pointer to first data item
  //R2 Pointer to mid-point
  //R3 Pointer to last data item
  //R4 Temp data value
  //R5 Temp use to display messages
start:
  MOV R1, #first
  MOV R3, #last
  MOV R5, #msg1
  STR R5, .WriteString
  LDR R0, .InputNum
  STR R0, .WriteUnsignedNum
loop:
  ADD R2, R1, R3
  LSR R2, R2, #3 //Divide by 8, then...
  LSL R2, R2, #2 //...multiply by 4. Net effect is divide by 2, but modulo 4. 
  LDR R4, [R2] //Get mid-point value
  CMP R0,R4 //Compare target to mid value
  BEQ found
  BLT belowMid
//Must be above mid if here
  MOV R1, R2
  ADD R1, R1, #4 //start = mid + 4 (bytes)
  B checkForOverlap
belowMid:
  MOV R3, R2
  SUB R3, R3, #4 //start = mid - 4 (bytes)
  B checkForOverlap
checkForOverlap:
  CMP R1, R3
  BGT notFound
  B loop
notFound:
  MOV R5, #msg3
  STR R5, .WriteString
  B start
found:
  MOV R5, #msg2
  STR R5, .WriteString
  STR R2, .WriteHex
  B start
msg1: .ASCIZ "\nSearch for ?"
msg2: .ASCIZ "\nIs at memory location: " 
msg3: .ASCIZ "\nNot found!"
.ALIGN 256 //Just to separate data from code in the memory view 
first: 3
  6
  7
  15
  22
  24
  31
  50
  79
last: 94
