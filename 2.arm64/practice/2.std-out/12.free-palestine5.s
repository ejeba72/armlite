; Free Palestine! May our Palestinian brothers be emancipated from the Israelites. And may our Jewish brothers reconcile with our Palestinian brothers. And may all of humanity live in love, harmony and peace. Amen.
; 2023.nov.12 sun 1725mf

.global _main
.align 4

; ascii code for "Free Palestine!\n"
; \n = 0x0a
; F = 0x46
; r = 0x72
; e = 0x65
; e = 0x65
; space = 0x20
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

; total number of bytes: 16 bytes

_main:
  mov x8, #0x460a
  movk x8, #0x6572, lsl 16
  movk x8, #0x2065, lsl 32
  movk x8, #0x6150, lsl 48
  mov x9, #0x656c
  movk x9, #0x7473, lsl 16
  movk x9, #0x6e69, lsl 32
  movk x9, #0x2165, lsl 48
  stp x8, x9, [sp, #-16]!

  mov x2, #1    ; initialize x2 to 1
loop:
  add x2, x2, #1
  mov x0, #1    ; stdout
  mov x1, sp
  mov x16, #4
  svc #0xffff
  cmp x2, #16
  blt loop

  mov x0, #0
  mov x16, #1
