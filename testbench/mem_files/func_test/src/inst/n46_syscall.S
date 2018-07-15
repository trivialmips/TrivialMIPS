#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <machine.h>
#include <ns16550.h>
#include <asm/context.h>
#include <inst_test.h>

LEAF(n46_syscall_test)
    .set noreorder
    lui  a0, 0x2E00
    li  v0, 0x01
###test inst
    .globl syscall_pc
syscall_pc:
    syscall
###detect exception
    li s0, 0x00ff0000
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
END(n46_syscall_test)
