; Free Palestine! May our Palestinian brothers be emancipated from the Israelites. And may our Jewish brothers reconcile with our Palestinian brothers. And may all of humanity live in love, harmony and peace. Amen.
; 2023.nov.12 sun 1621mf

.global _main
.align 4

; ascii code for "Free Palestine!\n"
; F = 0x46
; r = 0x72
; e = 0x65
; e = 0x65
; backspace = 0x08
; P = 0x50
; a = 0x61
; l = 0x6c
; e = 0x65
; s = 0x73
; t = 0x74
; i = 0x69
; n = 0x6e
; e = 0x65
; ! = 0x21
; \n = 0x0a

; total number of bytes: 16 bytes

_main:
  mov x8, #0x0a21
  movk x8, #0x656e, lsl 16 
  movk x8, #0x6974, lsl 32
  movk x8, #0x7365, lsl 48
  mov x9, #0x6c61
  movk x9, #0x5008, lsl 16
  movk x9, #0x6565, lsl 32
  movk x9, #0x7246, lsl 48

  stp x8, x9, [sp, #-16]!

  mov x0, #1    ; stdout
  mov x1, sp
  mov x2, #16
  mov x16, #4
  svc #0xffff

  mov x0, #0
  mov x16, #1
  svc #0xffff
