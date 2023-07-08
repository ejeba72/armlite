; 0706hr sun may14 2023

; Uses of registers:
; r0 -- miscellenous uses

    mov r0, setter
    str r0, .WriteString
    mov r0, secretword
    str r0, .ReadSecret
    hlt


setter: .asciz 'Set the word to be guessed:\n'
secretword: