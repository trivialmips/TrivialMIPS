#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <machine.h>
#include <ns16550.h>
#include <asm/context.h>
#include <inst_test.h>

LEAF(n55_eret_test)
    .set noreorder
    lui  a0, 0x3700
    li  v0, 0x03
###test inst
    li t0, 0x7fffffff
    addi t0, t0, 0x7fff #overflow ex
    lui v0, 0x1234
    lui v0, 0x8765
    lui v0, 0x5678
    .globl eret_ret_pc
eret_ret_pc:
    lui v0, 0x4321
###detect exception
    lui s0, 0x0f0f
    bne v0, s0, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    or t0, a0, s3 
    sw t0, 0(s1)
    jr ra
    nop
END(n55_eret_test)
