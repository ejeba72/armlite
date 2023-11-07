// 2023.jul.10 mon 1435hr

// Nigerian flag
/*
DIMENSIONS (Drawing or sketch could help):
- the flag has a rectangular shape which has 4 corners: (A) UPPER_LEFT_CORNER, (B) UPPER_RIGHT_CORNER, (C) LOWER_RIGHT_CORNER, (D) LOWER_LEFT_CORNER.
- width: should be 3/4 of the width of the screen == 3/4*64 == 48 pixels == 48*4 bit == 192 bit
- height: should be 2/3 of the height of the screen == 2/3*48 == 32 pixels == 32*4 bit == 128 bit
- However, I would like the flag to be at the center of the screen.
- starting position: let pixel origin be #.PixelScreen. Flag starting point, which is the UPPER_LEFT_CORNER, is 8 pixels east of pixel origin and 4 pixels south of pixel origin (I will just use east or south hence forth, instead of east of pixel origin and such).
- In other words, 
- HORIZONTAL_OFFSET (of UPPER_LEFT_CORNER) == 8 pixels == 8*4 bit == 32 bit
- VERTICAL_OFFSET (of UPPER_LEFT_CORNER) == 4 pixel == 4*4 == 16 bit
- green-white-green sections: 1/3*48 == 16 pixels for each section == 16 * 4 bits == 64 bits
- the LOWER_RIGHT_CORNER on the flag == (8+48) pixels east of the pixel origin and (4+32) pixels south of the pixel origin == 56 by 36 pixels == you would have to count 35 horizontal lines of pixels (64 pixels or 256 bits per line) from top to bottom (southward), and on the 36th line, you would count 56 pixel (56 * 4 bits) from left to right (eastward) == (35*256 bit) + (56*4 bit) == 9184 bits
- since the width of each section is 64 bits, we can locate or map the pixel at the LOWER_RIGHT_CORNER of each section.
- first of all, the LOWER_LEFT_CORNER of the entire flag == (((VERTICAL_OFFSET + height of the flag) - 1) * a line of pixel) + HORIZONTAL_OFFSET == (((4 pixel + 32 pixel) - 1 pixel) * 256 bit per line) + 32 bits == 8992 bit
- the LOWER_RIGHT_CORNER of the 1st section == 64 bit + LOWER_LEFT_CORNER of the entire flag == 64+8992 bit == 9056 bit
- the LOWER_RIGHT_CORNER of the 2nd section == 64 bit + LOWER_RIGHT_CORNER of the 1st section == 64+9056 bit == 9120 bit
- the LOWER_RIGHT_CORNER of the 3rd section == 64 bit + LOWER_RIGHT_CORNER of the 2nd section == 64+9120 == 9184 bit
- I imagine that the LOWER_RIGHT_CORNER of the flag should be equal to the LOWER_RIGHT_CORNER of the 3rd section of the flag. The results confirms this.
*/

// 2023.jul.10 mon 1435hr
/* 
1ST ITERATION (simplest approach):
- let the flag starting point be at the pixel origin.
- create the 1st line of the 1st section of the flag == 48pixel ÷ 3 == 16pixel == 16 * 4 == 64 bits.
*/
mov r0, #.green
mov r1, #.PixelScreen
mov r2, #0
nextPixel: str r0, [r1+r2]
add r2, r2, #4  // this add operation is inorder to color the next pixel
cmp r2, #64
blt nextPixel
halt

/*
2ND ITERATION:
*/
mov r0, #.green
mov r1, #.PixelScreen
mov r2, #0
mov r3, #64
nextPixel: str r0, [r1+r2]
add r2, r2, #4  // this add operation is inorder to color the next pixel
cmp r2, r3
blt nextPixel
mov r0, #.white
mov r2, #0
mov r3, #128
nextPixel: str r0, [r1+r2]
halt

/*
3RD ITERATION
- since in this case the flag's starting point is exactly at the pixel origin, the last point on the flag == 48 pixels east of the pixel origin and 32 pixels south of the pixel origin == 48 by 32 pixels == you would have to count 31 horizontal lines of pixels (64 pixels or 256 bits per line) from top to bottom (southward), and on the 32nd line, you would count 48 pixels (48 * 4 bits) from left to right (eastward) == (31*256 bit) + (48*4 bit) ==  8128 bits
- INITIAL_STARTING_POINT == UPPER_LEFT_CORNER of flag == r2 = 0
- NEXT_PIXEL == add r2, r2, #4
- NEXT_LINE_OF_PIXELS == add r2, r2, #192  (width of the screen - width of a section == 256-64 == 192 bits)
- ENDING_POINT of 1st section == the LOWER_RIGHT_CORNER of the 1st section == 9056 bit

- STARTING_POINT of 2nd section == WIDTH_OF_SECTION + 4 bits + HORIZONTAL_OFFSET + EFFECT_OF_VERTICAL_OFFSET == (16 * 4) + 4 + 0 + 0 = 68 bits
- ENDING_POINT OF 2nd section == the LOWER_RIGHT_CORNER of the 2nd section == 9120 bits

- the mathematical or absolute difference between the STARTING_POINT of 2nd section and the ENDING_POINT of 2nd section == | 68 - 9120 | == 9052

- NEXT_SECTION_OF_FLAG == manually assign the value of a section's starting point.
- FINAL_ENDING_POINT == LOWER_RIGHT_CORNER of flag == r... = ...

- STOP ALL THIS TOO MANY GEOMETRIC CALCULATIONS!!! All you need to know are the starting points of each section. And the number of horizontal lines of pixels you wish to have. Then use an incrementer and compare operators to determine the number of lines you wish to color.
*/
mov r0, #.green
mov r1, #.PixelScreen
mov r4, #0  // initializing the line incrementer or line counter
mov r2, #0
lineEnd: add r3, r2, #64  // r3 is assigned the value for the end of a line
nextPixel: str r0, [r1+r2]
add r2, r2, #4  // this increment operation is in order to color the next pixel
cmp r2, r3
blt nextPixel
cmp r2, #3200  // this is where consideration for next line begins
bgt endProg
add r2, r2, #192  // this add operation is in order to color the next line of pixels
b lineEnd
endProg: halt

/*
4TH ITERATION: UNINTENDED OUTCOME
- STOP ALL THIS TOO MANY GEOMETRIC CALCULATIONS!!! All you need to know are the starting points of each section. And the number of horizontal lines of pixels you wish to have. Then use an incrementer and compare operators to determine the number of lines you wish to color.

- FLAG_WIDTH == 48 pixels
- FLAG_HEIGHT == 32 pixels
- NUMBER_OF_SECTIONS == 3  (green-white-green)
- SECTION_WIDTH == 16 pixels
- 1ST_STARTING_POINT == 0 pixels
- 2ND_STARTING_POINT == 17 pixels  (68 bits)
- 3RD_STARTING_POINT == 33 pixels  (132 bits)
*/
  mov r0, #.red
  mov r1, #.PixelScreen
  mov r2, #0
  mov r3, #0  // section_width initialization
  mov r4, #0  // section_height initialization
  nextPixel: str r0, [r1+r2]
  add r2, r2, #4  // location of next pixel
  add r3, r3, #1
  cmp r3, #16  // section_width
  blt nextPixel
  add r2, r2, #192
  cmp r4, #32  // section_height
  b nextPixel
  halt


/*
5TH ITERATION: EASIER APPROACH
- STOP ALL THIS TOO MANY GEOMETRIC CALCULATIONS!!! All you need to know are the starting points of each section. And the number of horizontal lines of pixels you wish to have. Then use an incrementer and compare operators to determine the number of lines you wish to color.

- FLAG_WIDTH == 48 pixels
- FLAG_HEIGHT == 32 pixels
- NUMBER_OF_SECTIONS == 3  (green-white-green)
- SECTION_WIDTH == 16 pixels
- 1ST_STARTING_POINT == 0 pixels
- 2ND_STARTING_POINT == 17 pixels  (68 bits)
- 3RD_STARTING_POINT == 33 pixels  (132 bits)
*/
  mov r0, #.red
  mov r1, #.PixelScreen
  mov r2, #0
  mov r3, #0  // section_width initialization
  mov r4, #0  // section_height initialization
  nextPixel: str r0, [r1+r2]
  add r2, r2, #4  // location of next pixel
  add r3, r3, #1
  cmp r3, #16  // section_width
  blt nextPixel
  mov r3, #0
  add r2, r2, #192
  add r4, r4, #1
  cmp r4, #32  // section_height
  blt nextPixel
  halt

/*
6TH ITERATION: UNINTENDED BEHAVIOUR
- STOP ALL THIS TOO MANY GEOMETRIC CALCULATIONS!!! All you need to know are the starting points of each section. And the number of horizontal lines of pixels you wish to have. Then use an incrementer and compare operators to determine the number of lines you wish to color.

- FLAG_WIDTH == 48 pixels
- FLAG_HEIGHT == 32 pixels
- NUMBER_OF_SECTIONS == 3  (green-white-green)
- SECTION_WIDTH == 16 pixels (64 bits)
- 1ST_STARTING_POINT == 0 pixels
- 2ND_STARTING_POINT == 17 pixels  (68 bits)
- 3RD_STARTING_POINT == 33 pixels  (132 bits)
*/
  mov r0, #.red
  mov r1, #.PixelScreen
  mov r2, #0
  mov r3, #0  // section_width initialization
  mov r4, #0  // section_height initialization
  nextPixel: str r0, [r1+r2]
  add r2, r2, #4  // location of next pixel
  cmp r2, #64  // section_width (16 pixels * 4 bits per pixel)
  blt nextPixel
  mov r3, #0
  add r2, r2, #192  // start of a new line of pixels
  cmp r2, #6144  // section_height (32 linesOfPixels * 192 bits per lineOfPixels)
  blt nextPixel
  halt


/*
7TH ITERATION <EFFICIENCY, 1ST SECTION>:
- STOP ALL THIS TOO MANY GEOMETRIC CALCULATIONS!!! All you need to know are the starting points of each section. And the number of horizontal lines of pixels you wish to have. Then use an incrementer and compare operators to determine the number of lines you wish to color.

- FLAG_WIDTH == 48 pixels
- FLAG_HEIGHT == 32 pixels
- NUMBER_OF_SECTIONS == 3  (green-white-green)
- SECTION_WIDTH == 16 pixels (64 bits)
- 1ST_STARTING_POINT == 0 pixels
- 2ND_STARTING_POINT == 17 pixels  (68 bits)
- 3RD_STARTING_POINT == 33 pixels  (132 bits)
*/
  mov r0, #.red
  mov r1, #.PixelScreen
  mov r2, #0
  add r4, r2, #6144   // section_height (32 linesOfPixels * 192 bits per lineOfPixels)
nextLine: add r3, r2, #64  // section_width (16 pixels * 4 bits per pixel)
nextPixel: str r0, [r1+r2]
  add r2, r2, #4  // location of next pixel
  cmp r2, r3  // compare to see if a lineOfPixels has been completed
  blt nextPixel
  add r2, r2, #192  // start of a new line of pixels
  cmp r2, r4  // compare to see if a sectionOfPixels has been completed
  blt nextLine
halt

/*
8TH ITERATION <EFFICIENCY>:
- STOP ALL THIS TOO MANY GEOMETRIC CALCULATIONS!!! All you need to know are the starting points of each section. And the number of horizontal lines of pixels you wish to have. Then use an incrementer and compare operators to determine the number of lines you wish to color.

- FLAG_WIDTH == 48 pixels
- FLAG_HEIGHT == 32 pixels
- NUMBER_OF_SECTIONS == 3  (green-white-green)
- SECTION_WIDTH == 16 pixels (64 bits)
- 1ST_STARTING_POINT == 0 pixels
- 2ND_STARTING_POINT == 17 pixels  (68 bits) || 16 pixels (64 bits)
- 3RD_STARTING_POINT == 33 pixels  (132 bits) || 32 pixels (128 bits)
*/
  mov r0, #.red
  mov r1, #.PixelScreen
  mov r5, #0  // section counter initialized to zero
  mov r2, #0  // 1st starting point
  add r4, r2, #6144   // section_height (32 linesOfPixels * 192 bits per lineOfPixels)
nextLine: add r3, r2, #64  // section_width (16 pixels * 4 bits per pixel)
nextPixel: str r0, [r1+r2]
  add r2, r2, #4  // location of next pixel
  cmp r2, r3  // compare to see if a lineOfPixels has been completed
  blt nextPixel
  add r2, r2, #192  // start of a new line of pixels
  cmp r2, r4  // compare to see if a sectionOfPixels has been completed
  blt nextLine
  add r5, r5, #1
  cmp r5, #2
  bgt endProg
  beq thirdSection
  blt secondSection
secondSection: mov r0, #.black
  mov r2, #64
  b nextLine
thirdSection: mov r0, #.green
  mov r2, #128
  b nextLine
endProg: halt


/*
9TH ITERATION [ EFFICIENCY, NIGERIA FLAG PROPER ]:
- STOP ALL THIS TOO MANY GEOMETRIC CALCULATIONS!!! All you need to know are the starting points of each section. And the number of horizontal lines of pixels you wish to have. Then use an incrementer and compare operators to determine the number of lines you wish to color.
- FLAG_WIDTH == 48 pixels
- FLAG_HEIGHT == 32 pixels
- NUMBER_OF_SECTIONS == 3  (green-white-green)
- SECTION_WIDTH == 16 pixels (64 bits)
- 1ST_STARTING_POINT == 0 pixels
- 2ND_STARTING_POINT == 17 pixels  (68 bits) || 16 pixels (64 bits)
- 3RD_STARTING_POINT == 33 pixels  (132 bits) || 32 pixels (128 bits)
*/
  mov r0, #.green  // color for the 1st section
  mov r1, #.PixelScreen
  mov r5, #0  // section counter initialized to zero
  mov r2, #0  // 1st starting point
  add r4, r2, #6144   // section_height (32 linesOfPixels * 192 bits per lineOfPixels)
nextLine: add r3, r2, #64  // section_width (16 pixels * 4 bits per pixel)
nextPixel: str r0, [r1+r2]
  add r2, r2, #4  // location of next pixel
  cmp r2, r3  // compare to see if a lineOfPixels has been completed
  blt nextPixel
  add r2, r2, #192  // start of a new line of pixels
  cmp r2, r4  // compare to see if a sectionOfPixels has been completed
  blt nextLine
  add r5, r5, #1
  cmp r5, #2
  bgt endProg
  beq thirdSection
  blt secondSection
secondSection: mov r0, #.white
  mov r2, #64
  b nextLine
thirdSection: mov r0, #.green
  mov r2, #128
  b nextLine
endProg: halt

/*
10TH ITERATION [ EFFICIENCY, NIGERIA FLAG PROPER, OFFSET ]:
- FLAG_WIDTH == 48 pixels
- FLAG_HEIGHT == 32 pixels
- NUMBER_OF_SECTIONS == 3  (green-white-green)
- SECTION_WIDTH == 16 pixels (64 bits)
- 1ST_STARTING_POINT == 0 pixels
- 2ND_STARTING_POINT == 17 pixels  (68 bits) || 16 pixels (64 bits)
- 3RD_STARTING_POINT == 33 pixels  (132 bits) || 32 pixels (128 bits)
- HORIZONTAL_OFFSET (of UPPER_LEFT_CORNER) == 8 pixels
- VERTICAL_OFFSET (of UPPER_LEFT_CORNER) == 4 pixels
- 1ST_OFFSET_STARTING_POINT == (11 linesOfPixels * 256 bitsPerLineOfPixel) + (8 pixels * 4 bitsPerPixel) == 2848 bits
- 2ND_OFFSET_STARTING_POINT == (16 pixels * 4 bitsPerPixel) + 2848 bits == 2912 bits
- 3RD_OFFSET_STARTING_POINT == (16 pixels * 4 bitsPerPixel) + 2912 bit == 2976 bits
*/
  mov r0, #.green  // color for the 1st section
  mov r1, #.PixelScreen
  mov r5, #0  // section counter initialized to zero
  mov r2, #2848  // 1st starting point
  add r4, r2, #6144   // section_height (32 linesOfPixels * 192 bits per lineOfPixels)
nextLine: add r3, r2, #64  // section_width (16 pixels * 4 bits per pixel)
nextPixel: str r0, [r1+r2]
  add r2, r2, #4  // location of next pixel
  cmp r2, r3  // compare to see if a lineOfPixels has been completed
  blt nextPixel
  add r2, r2, #192  // start of a new line of pixels
  cmp r2, r4  // compare to see if a sectionOfPixels has been completed
  blt nextLine
  add r5, r5, #1
  cmp r5, #2
  bgt endProg
  beq thirdSection
  blt secondSection
secondSection: mov r0, #.white
  mov r2, #2912
  b nextLine
thirdSection: mov r0, #.green
  mov r2, #2976
  b nextLine
endProg: halt
