#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <asm/context.h>
#include <inst_test.h>

LEAF(n45_break_test)
    .set noreorder
    li  a0, 0x2D
    li  v0, 0x02
###test inst
    .globl break_pc
break_pc:
    break
###detect exception
    li s0, 0xff000000
    bne v0, s0, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    sw s3, 0($23)
    sw a0, 0(s1)
    jr ra
    nop
END(n45_break_test)
