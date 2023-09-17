; 1902hr fri may12 2023

; Register uses:
; r0: multiple temporary uses
; r8: number of wrong guesses

    mov r8, #10
drawPic:
    cmp r8, #1
    blt endDraw
    mov r0, #0x000000
    str r0, .Pixel744   ; vertical pole
    str r0, .Pixel712
    str r0, .Pixel680
    str r0, .Pixel648
    str r0, .Pixel616
    str r0, .Pixel584
    str r0, .Pixel552
    str r0, .Pixel520
    str r0, .Pixel488
    str r0, .Pixel456
    str r0, .Pixel424
    str r0, .Pixel392
    cmp r8, #2
    blt endDraw
    str r0, .Pixel393   ; cross beam
    str r0, .Pixel394
    str r0, .Pixel395
    str r0, .Pixel396
    cmp r8, #3
    blt endDraw
; To-do list:
; Rope, head, body, left leg, right leg, left arm, right arm
endDraw:
    hlt