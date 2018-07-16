#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <asm/context.h>
#include <inst_delay_slot_test.h>

###LEAF(n87_bgezal_ex_ds_test)
    .globl n87_bgezal_ex_ds_test
n87_bgezal_ex_ds_test:
    .set noreorder
    li  a0, 0x57
#    li  v0, 0x09
###test inst
    TEST_BGEZAL_EX_DS_EX_ADDI
    TEST_BGEZAL_EX_DS_EX_ADD
    TEST_BGEZAL_EX_DS_EX_SUB
    TEST_BGEZAL_EX_DS_EX_LH
    TEST_BGEZAL_EX_DS_EX_LHU
    TEST_BGEZAL_EX_DS_EX_LW
    TEST_BGEZAL_EX_DS_EX_SH
    TEST_BGEZAL_EX_DS_EX_SW
    TEST_BGEZAL_EX_DS_EX_RI
    TEST_BGEZAL_EX_DS_EX_SYSCALL
    TEST_BGEZAL_EX_DS_EX_BREAK
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
####END(n87_bgezal_ex_ds_test)
