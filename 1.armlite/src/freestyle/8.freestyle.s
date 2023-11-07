// 2023.aug.23 wed 1740mf
// This is me practicing read and write operations in armlite.

  mov r0, #writeAnyThing
  str r0, .ReadString
  mov r0, #0x0040
  hlt
writeAnyThing:
