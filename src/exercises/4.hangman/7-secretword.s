; 1114hr mon may5 2023

mov r0, #setter
str r0, .Writestring
ldr r0, secretword
str r0, .ReadSecret

setter: asciz 'Enter secretword:'
secretword: