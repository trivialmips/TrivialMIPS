#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <asm/context.h>
#include <inst_test.h>

### refers to testcase No.55

LEAF(n93_tlbwr_test)
    .set noreorder
    li  a0, 0x5d
###test inst
test_gbit_start:
    lui v0, 0xffe8
    ori v0, 0xdc03
    lui s2, 0x0011
    ori s2, 0xe124
    lui s0, 0x0011
    ori s0, 0xe000 ##entry hi
    lui a3, 0x1234
    ori a3, 0x5867
    li k0, 0x0001  ##label tlbwr_allbit
    li t0, 0x4000 ##entry lo0
    li t1, 0x4000 ##entry lo1
    sw a3, 0(s2)
    nop
    nop
    nop
    nop
    nop
    lui t0, 0xed08
    ori t0, 0xdc16
    bne v1, t0, inst_error
    nop
    lui s2, 0x0011
    ori s2, 0xf124
    lw t0, 0(s2)
    lui a3, 0x1234
    ori a3, 0x5867
    bne a3, t0, inst_error
    nop
    li  s2, 0x80100124 #bypass TLB
    lw t0, 0(s2)
    bne a3, t0, inst_error
    nop
test_asid_match:
    lui v0, 0xffe8
    ori v0, 0xdc03
    lui s2, 0x0012
    ori s2, s2, 0xe124
    li k0, 0x0003  #label tlbwr_asid
    lui s0, 0x0012
    ori s0, 0xe0dc ##entry hi: 0x0012e0dc
    lui a3, 0xe235
    ori a3, 0xe8f7
    li t0, 0x4006 ##entry lo0
    li t1, 0x4006 ##entry lo1
    sw a3, 0(s2) ##access 0x0012e124
    nop
    nop
    nop
    nop
    nop
    lui t0, 0xed08
    ori t0, 0xdc18
    bne v1, t0, inst_error
    nop
    lui s0, 0x0013
    ori s0, 0xe0dc ##entry hi: 0x0013e0dc
    mtc0 s0, c0_entryhi #set current ASID
    lui s2, 0x0013
    ori s2, 0xf124
    li t0, 0x4006 ##entry lo0
    li t1, 0x4006 ##entry lo1
    lw t0, 0(s2) ##access 0x0013f124
    lui a3, 0xe235
    ori a3, 0xe8f7
    bne a3, t0, inst_error
    nop
test_asid_2:
    lui v0, 0xffe8
    ori v0, 0xdc03
    lui s2, 0x0014
    ori s2, s2, 0xe124
    li k0, 0x0003  #label tlbwr_asid
    lui s0, 0x0014
    ori s0, 0xe0dc ##entry hi: 0x0014e0dc
    lui a3, 0xbd86
    ori a3, 0x13ac
    li t0, 0x4006 ##entry lo0
    li t1, 0x4000 ##entry lo1
    sw a3, 0(s2)
    nop
    nop
    nop
    nop
    nop
    lui t0, 0xed08
    ori t0, 0xdc18
    bne v1, t0, inst_error
    nop
    lui s2, 0x0015
    ori s2, 0xf124
    lui s0, 0x0015
    ori s0, 0xe0dc ##entry hi: 0x0015e0dc
    li t0, 0x4000 ##entry lo0
    li t1, 0x4002 ##entry lo1
    li k0, 0x0003  #label tlbwr_asid
    lw a3, 0(s2)
    lui a3, 0xed08
    ori a3, 0xdc18
    bne a3, v1, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    sw s3, 0($23)
    sw a0, 0(s1)
    jr ra
    nop
END(n93_tlbwr_test)
