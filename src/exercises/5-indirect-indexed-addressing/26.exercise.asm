; 2023.jul.8 sat 2113hr
; Indirect andor indexed addressing

; indirect addressing ==> [r0]
; indexed addressing ==> [r0 + r1]

mov r0, #.PixelScreen
mov r1, #.green
str r1, [r0]
halt

; The line of code 'str r1, [r0]' is the very essence of indirect addressing. [r0] means that the value in register zero is actually an address in memory. As for indexed addressing, the idea is to do this [r0+r1], instead of this, 'add r2, r0, r1' and then [r2]. I know my explaination of indexing is inadequate. But I don't have the time to flesh it out.

mov r0, #.red
mov r0, .Pixel0
halt



mov r0, #.green
mov r1, #.PixelScreen
mov r2, #0
add r3, r1, r2
str r0, [r3]
halt