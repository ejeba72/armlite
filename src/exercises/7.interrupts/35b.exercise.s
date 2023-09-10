// 2023.sep.7 sep 1235mf

// Set up interrupts
  mov r0, #writeA
  str r0, .PinISR
  mov r0, #1
  str r0, .PinMask
  str r0, .InterruptRegister
