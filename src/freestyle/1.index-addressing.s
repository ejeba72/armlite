// 2023.jul.8 sat 2144hr
// indexed addressing

mov r0, #.green
mov r1, #.PixelScreen
mov r2, #0
green: str r0, [r1+r2]
add r2, r2, #4  // with the intent to color the next pixel, so move 4-bytes (ie a word)
cmp r2, #65
blt green
halt


// NOTE: the last pixel is 4*64*48 == 12288 bits
mov r0, #.green
mov r1, #.PixelScreen
mov r2, #0
green: str r0, [r1+r2]
add r2, r2, #4  // with the intent to color the next pixel, so move 4-bytes (ie a word)
cmp r2, #12288  // the full screen
blt green
halt

// Nigerian flag
/*
DIMENSIONS:
- length: should be 3/4 of the width of the screen = 3/4*64 = 48 pixels
- height: should be 2/3 of the height of the screen = 2/3*48 = 32 pixels
- However, I would like the flag to be at the center of the screen.
- starting position: let origin be #.PixelScreen. Flag starting point is 8 pixels east of origin and 4 pixels south of origin (I will just use east or south hence forth, instead of east of origin and such).
- green-white-green sections: 1/3*48 = 16 pixels for each section
*/
mov r0, #.green
mov r1, #.PixelScreen
mov r3, #800  // (64pixels * 4bits * 3lines) + (8pixels * 4bits) = 768 + 32
mov r2, r3  // the first pixel of the first line   ???of the first section?
nextLine: add r3, r3, #256
nextPixel: str r0, [r1+r2]
add r2, r2, #4 // update the value of the pixel incrementer
cmp r2, r3
blt nextPixel
cmp r3, #865  // starting position of the second section (ie the white section);
blt nextLine
halt


// cmp r2, #865  // ?the pixel where the 1st line of the 1st section ends? (864, but i added 1 bit to it as a kind of 'tolerance' for the blt operations, as I am not sure exactly...)