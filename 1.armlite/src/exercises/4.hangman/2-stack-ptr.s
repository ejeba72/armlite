; 1536hr tue may9 2023
; 1st attempt
; mov r0, #7
; push {r0}
; mov r0, #3
; mov r1, r0
; pop {r0}
;2nd attempt
mov r1, #1
mov r2, #2
mov r3, #3
mov r4, #4
mov r5, #5
push {r1}
push {r2}
push {r3}
push {r4}
push {r5}
pop {r1}
pop {r2}
pop {r3}
pop {r4}
pop {r5}
hlt