// 2023.aug.25 fri 2012mf
// simple program to practe.g. subroutine. BTW, I like my basic, low-level, step-by-step approach (e.g. using mov and b, instead of bl and ret, in order to deepen my understanding of what is going on under the hood. One of the things I have come to learn thus far, is that, assembly language has layers of abstractions even when it is regarded to have one-to-one correspondence with binary code. A possible implication of this is that machine code or binary code may also have layers of abstraction.
// Notwithstanding, my goal is to unmask the layers of abstraction, whenever I can, in order to deepen my understanding of the fundamental concepts.

  mov r0, #first
  mov lr, pc
  b echo
  mov r0, #second
  mov lr, pc
  b echo
  mov r0, #third
  mov lr, pc
  b echo
  mov r0, #fourth
  mov lr, pc
  b echo
  hlt

echo:
  str r0, .WriteString
  mov pc, lr

first: .asciz 'first line.\n'
second: .asciz 'second line.\n'
third: .asciz 'third line.\n'
fourth: .asciz 'fourth line.\n'
