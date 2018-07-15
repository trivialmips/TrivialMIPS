#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <machine.h>
#include <ns16550.h>
#include <asm/context.h>
#include <inst_delay_slot_test.h>

###LEAF(n77_jal_ds_test)
    .data
    .globl n77_jal_ds_test
n77_jal_ds_test:
    .set noreorder
    lui  a0, 0x4D00
    li  v0, 0x00
###test inst
    TEST_JAL_DS
###detect exception
    bne v0, zero, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    or t0, a0, s3 
    sw t0, 0(s1)
    jr ra
    nop
####END(n77_jal_ds_test)
