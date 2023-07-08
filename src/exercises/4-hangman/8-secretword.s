; 1936hr mon may15 2023

mov r0, #setter
str r0, .WriteString
mov r0, #secretword
str r0, .ReadSecret
hlt
setter: .aciz 'Setter: Enter word.\n'
secretword: