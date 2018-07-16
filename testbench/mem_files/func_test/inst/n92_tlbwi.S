#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <asm/context.h>
#include <inst_test.h>

### refers to testcase No.55

LEAF(n92_tlbwi_test)
    .set noreorder
    li  a0, 0x5c
###test inst
    li s2, 0x0000
    li k0, 0x0010
test_phase1_start:
    mtc0 s2, c0_index
    lui v0, 0xefe8
    ori v0, 0xdc03
    sll t1, s2, 0x10
    li s0, 0xf124
    add s0, t1, s0
    lui a3, 0xabcd
    ori a3, 0xef81
    sw a3, 0(s0)
    nop
    nop
    nop
    nop
    nop
    lui t0, 0xed12
    ori t0, 0x5678
    bne v1, t0, inst_error
    nop
    li s0, 0xf124
    lw t0, 0(s0)
    lui s0, 0xabcd
    ori s0, 0xef81
    bne s0, t0, inst_error
    nop
    addiu s2, 0x0001
    bne k0, s2, test_phase1_start
    nop
    li v0, 0x0000
    li k0, 0x0010
    nop
    li v1, 0x0000
test_phase2_start:
    li s0, 0xf124
    sll t1, v0, 0x10
    add s0, t1, s0
    lw t1, 0(s0)
    lui a3, 0xabcd
    ori a3, 0xef81
    bne t1, a3, inst_error
    nop
    addiu v0, 0x0001
    li t1, 0x0000
    bne t1, v1, inst_error
    nop
    bne v0, k0, test_phase2_start
    nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    sw s3, 0($23)
    sw a0, 0(s1)
    jr ra
    nop
END(n92_tlbwi_test)
