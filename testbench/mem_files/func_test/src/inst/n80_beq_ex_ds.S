#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <machine.h>
#include <ns16550.h>
#include <asm/context.h>
#include <inst_delay_slot_test.h>

###LEAF(n80_beq_ex_ds_test)
    .data
    .globl n80_beq_ex_ds_test
n80_beq_ex_ds_test:
    .set noreorder
    lui  a0, 0x5000
#    li  v0, 0x09
###test inst
    TEST_BEQ_EX_DS_EX_ADDI
    TEST_BEQ_EX_DS_EX_ADD
    TEST_BEQ_EX_DS_EX_SUB
    TEST_BEQ_EX_DS_EX_LH
    TEST_BEQ_EX_DS_EX_LHU
    TEST_BEQ_EX_DS_EX_LW
    TEST_BEQ_EX_DS_EX_SH
    TEST_BEQ_EX_DS_EX_SW
    TEST_BEQ_EX_DS_EX_RI
    TEST_BEQ_EX_DS_EX_SYSCALL
    TEST_BEQ_EX_DS_EX_BREAK
###detect exception
#   lui s0, 0x4444
#   bne v0, s0, inst_error
#   nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    or t0, a0, s3 
    sw t0, 0(s1)
    jr ra
    nop
####END(n80_beq_ex_ds_test)
