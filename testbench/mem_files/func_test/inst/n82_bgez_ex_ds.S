#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <asm/context.h>
#include <inst_delay_slot_test.h>

###LEAF(n82_bgez_ex_ds_test)
    .globl n82_bgez_ex_ds_test
n82_bgez_ex_ds_test:
    .set noreorder
    li  a0, 0x52
#    li  v0, 0x09
###test inst
    TEST_BGEZ_EX_DS_EX_ADDI
    TEST_BGEZ_EX_DS_EX_ADD
    TEST_BGEZ_EX_DS_EX_SUB
    TEST_BGEZ_EX_DS_EX_LH
    TEST_BGEZ_EX_DS_EX_LHU
    TEST_BGEZ_EX_DS_EX_LW
    TEST_BGEZ_EX_DS_EX_SH
    TEST_BGEZ_EX_DS_EX_SW
    TEST_BGEZ_EX_DS_EX_RI
    TEST_BGEZ_EX_DS_EX_SYSCALL
    TEST_BGEZ_EX_DS_EX_BREAK
###detect exception
#   lui s0, 0x4444
#   bne v0, s0, inst_error
#   nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    sw s3, 0($23)
    sw a0, 0(s1)
    jr ra
    nop
####END(n82_bgez_ex_ds_test)
