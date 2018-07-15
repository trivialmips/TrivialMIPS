// file name: inst_delay_slot_test.h
#include <inst_delay_slot_def.h>

/* 68
 * TEST_BEQ_DS
 */
#define TEST_BEQ_DS \
    BEQ_DS; \
    li s4, 0x4567bce0; \
    bne s4, s2, inst_error; \
    nop

/* 69
 * TEST_BNE_DS
 */
#define TEST_BNE_DS \
    BNE_DS; \
    li s4, 0x4567bce0; \
    bne s4, s2, inst_error; \
    nop

/* 70
 * TEST_BGEZ_DS
 */
#define TEST_BGEZ_DS \
    BGEZ_DS; \
    li s4, 0x4567bce0; \
    bne s4, s2, inst_error; \
    nop

/* 71
 * TEST_BGTZ_DS
 */
#define TEST_BGTZ_DS \
    BGTZ_DS; \
    li s4, 0x4567bce0; \
    bne s4, s2, inst_error; \
    nop

/* 72
 * TEST_BLEZ_DS
 */
#define TEST_BLEZ_DS \
    BLEZ_DS; \
    li s4, 0x4567bce0; \
    bne s4, s2, inst_error; \
    nop

/* 73
 * TEST_BLTZ_DS
 */
#define TEST_BLTZ_DS \
    BLTZ_DS; \
    li s4, 0x4567bce0; \
    bne s4, s2, inst_error; \
    nop

/* 74
 * TEST_BLTZAL_DS
 */
#define TEST_BLTZAL_DS \
    addu t4, zero, $31; \
    BLTZAL_DS; \
    addu $31, t4, zero; \
    li s4, 0x4567bce0; \
    bne s4, s2, inst_error; \
    nop

/* 75
 * TEST_BGEZAL_DS
 */
#define TEST_BGEZAL_DS \
    addu t4, zero, $31; \
    BGEZAL_DS; \
    addu $31, t4, zero; \
    li s4, 0x4567bce0; \
    bne s4, s2, inst_error; \
    nop

/* 76
 * TEST_J_DS
 */
#define TEST_J_DS \
    J_DS; \
    li s4, 0xbe02579b; \
    bne s4, s2, inst_error; \
    nop

/* 77
 * TEST_JAL_DS
 */
#define TEST_JAL_DS \
    addu t4, zero, $31; \
    JAL_DS; \
    addu $31, t4, zero; \
    li s4, 0xbe02579b; \
    bne s4, s2, inst_error; \
    nop

/* 78
 * TEST_JR_DS
 */
#define TEST_JR_DS \
    JR_DS; \
    li s4, 0xbe02579b; \
    bne s4, s2, inst_error; \
    nop

/* 79
 * TEST_JALR_DS
 */
#define TEST_JALR_DS \
    addu t4, zero, $31; \
    JALR_DS; \
    addu $31, t4, zero; \
    li s4, 0xbe02579b; \
    bne s4, s2, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_ADDI
 */
#define TEST_BEQ_EX_DS_EX_ADDI \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_ADD
 */
#define TEST_BEQ_EX_DS_EX_ADD \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_SUB
 */
#define TEST_BEQ_EX_DS_EX_SUB \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_LH
 */
#define TEST_BEQ_EX_DS_EX_LH \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_LHU
 */
#define TEST_BEQ_EX_DS_EX_LHU \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_LW
 */
#define TEST_BEQ_EX_DS_EX_LW \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_SH
 */
#define TEST_BEQ_EX_DS_EX_SH \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_SW
 */
#define TEST_BEQ_EX_DS_EX_SW \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_RI
 */
#define TEST_BEQ_EX_DS_EX_RI \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_SYSCALL
 */
#define TEST_BEQ_EX_DS_EX_SYSCALL \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 80
 * TEST_BEQ_EX_DS_EX_BREAK
 */
#define TEST_BEQ_EX_DS_EX_BREAK \
    li v0, 0x09; \
    BEQ_EX_DS_F_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_F_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BEQ_EX_DS_B_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_ADDI
 */
#define TEST_BNE_EX_DS_EX_ADDI \
    li v0, 0x09; \
    BNE_EX_DS_F_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_ADD
 */
#define TEST_BNE_EX_DS_EX_ADD \
    li v0, 0x09; \
    BNE_EX_DS_F_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_SUB
 */
#define TEST_BNE_EX_DS_EX_SUB \
    li v0, 0x09; \
    BNE_EX_DS_F_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_LH
 */
#define TEST_BNE_EX_DS_EX_LH \
    li v0, 0x09; \
    BNE_EX_DS_F_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_LHU
 */
#define TEST_BNE_EX_DS_EX_LHU \
    li v0, 0x09; \
    BNE_EX_DS_F_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_LW
 */
#define TEST_BNE_EX_DS_EX_LW \
    li v0, 0x09; \
    BNE_EX_DS_F_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_SH
 */
#define TEST_BNE_EX_DS_EX_SH \
    li v0, 0x09; \
    BNE_EX_DS_F_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_SW
 */
#define TEST_BNE_EX_DS_EX_SW \
    li v0, 0x09; \
    BNE_EX_DS_F_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_RI
 */
#define TEST_BNE_EX_DS_EX_RI \
    li v0, 0x09; \
    BNE_EX_DS_F_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_SYSCALL
 */
#define TEST_BNE_EX_DS_EX_SYSCALL \
    li v0, 0x09; \
    BNE_EX_DS_F_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 81
 * TEST_BNE_EX_DS_EX_BREAK
 */
#define TEST_BNE_EX_DS_EX_BREAK \
    li v0, 0x09; \
    BNE_EX_DS_F_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_F_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BNE_EX_DS_B_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_ADDI
 */
#define TEST_BGEZ_EX_DS_EX_ADDI \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_ADD
 */
#define TEST_BGEZ_EX_DS_EX_ADD \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_SUB
 */
#define TEST_BGEZ_EX_DS_EX_SUB \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_LH
 */
#define TEST_BGEZ_EX_DS_EX_LH \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_LHU
 */
#define TEST_BGEZ_EX_DS_EX_LHU \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_LW
 */
#define TEST_BGEZ_EX_DS_EX_LW \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_SH
 */
#define TEST_BGEZ_EX_DS_EX_SH \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_SW
 */
#define TEST_BGEZ_EX_DS_EX_SW \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_RI
 */
#define TEST_BGEZ_EX_DS_EX_RI \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_SYSCALL
 */
#define TEST_BGEZ_EX_DS_EX_SYSCALL \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 82
 * TEST_BGEZ_EX_DS_EX_BREAK
 */
#define TEST_BGEZ_EX_DS_EX_BREAK \
    li v0, 0x09; \
    BGEZ_EX_DS_F_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_F_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZ_EX_DS_B_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_ADDI
 */
#define TEST_BGTZ_EX_DS_EX_ADDI \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_ADD
 */
#define TEST_BGTZ_EX_DS_EX_ADD \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_SUB
 */
#define TEST_BGTZ_EX_DS_EX_SUB \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_LH
 */
#define TEST_BGTZ_EX_DS_EX_LH \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_LHU
 */
#define TEST_BGTZ_EX_DS_EX_LHU \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_LW
 */
#define TEST_BGTZ_EX_DS_EX_LW \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_SH
 */
#define TEST_BGTZ_EX_DS_EX_SH \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_SW
 */
#define TEST_BGTZ_EX_DS_EX_SW \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_RI
 */
#define TEST_BGTZ_EX_DS_EX_RI \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_SYSCALL
 */
#define TEST_BGTZ_EX_DS_EX_SYSCALL \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 83
 * TEST_BGTZ_EX_DS_EX_BREAK
 */
#define TEST_BGTZ_EX_DS_EX_BREAK \
    li v0, 0x09; \
    BGTZ_EX_DS_F_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_F_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGTZ_EX_DS_B_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_ADDI
 */
#define TEST_BLEZ_EX_DS_EX_ADDI \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_ADD
 */
#define TEST_BLEZ_EX_DS_EX_ADD \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_SUB
 */
#define TEST_BLEZ_EX_DS_EX_SUB \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_LH
 */
#define TEST_BLEZ_EX_DS_EX_LH \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_LHU
 */
#define TEST_BLEZ_EX_DS_EX_LHU \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_LW
 */
#define TEST_BLEZ_EX_DS_EX_LW \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_SH
 */
#define TEST_BLEZ_EX_DS_EX_SH \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_SW
 */
#define TEST_BLEZ_EX_DS_EX_SW \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_RI
 */
#define TEST_BLEZ_EX_DS_EX_RI \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_SYSCALL
 */
#define TEST_BLEZ_EX_DS_EX_SYSCALL \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 84
 * TEST_BLEZ_EX_DS_EX_BREAK
 */
#define TEST_BLEZ_EX_DS_EX_BREAK \
    li v0, 0x09; \
    BLEZ_EX_DS_F_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_F_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLEZ_EX_DS_B_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_ADDI
 */
#define TEST_BLTZ_EX_DS_EX_ADDI \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_ADD
 */
#define TEST_BLTZ_EX_DS_EX_ADD \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_SUB
 */
#define TEST_BLTZ_EX_DS_EX_SUB \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_LH
 */
#define TEST_BLTZ_EX_DS_EX_LH \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_LHU
 */
#define TEST_BLTZ_EX_DS_EX_LHU \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_LW
 */
#define TEST_BLTZ_EX_DS_EX_LW \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_SH
 */
#define TEST_BLTZ_EX_DS_EX_SH \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_SW
 */
#define TEST_BLTZ_EX_DS_EX_SW \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_RI
 */
#define TEST_BLTZ_EX_DS_EX_RI \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_SYSCALL
 */
#define TEST_BLTZ_EX_DS_EX_SYSCALL \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 85
 * TEST_BLTZ_EX_DS_EX_BREAK
 */
#define TEST_BLTZ_EX_DS_EX_BREAK \
    li v0, 0x09; \
    BLTZ_EX_DS_F_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_F_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_T_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZ_EX_DS_B_NT_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_ADDI
 */
#define TEST_BLTZAL_EX_DS_EX_ADDI \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_ADD
 */
#define TEST_BLTZAL_EX_DS_EX_ADD \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_SUB
 */
#define TEST_BLTZAL_EX_DS_EX_SUB \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_LH
 */
#define TEST_BLTZAL_EX_DS_EX_LH \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_LHU
 */
#define TEST_BLTZAL_EX_DS_EX_LHU \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_LW
 */
#define TEST_BLTZAL_EX_DS_EX_LW \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_SH
 */
#define TEST_BLTZAL_EX_DS_EX_SH \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_SW
 */
#define TEST_BLTZAL_EX_DS_EX_SW \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_RI
 */
#define TEST_BLTZAL_EX_DS_EX_RI \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_SYSCALL
 */
#define TEST_BLTZAL_EX_DS_EX_SYSCALL \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 86
 * TEST_BLTZAL_EX_DS_EX_BREAK
 */
#define TEST_BLTZAL_EX_DS_EX_BREAK \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_T_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_F_NT_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_T_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BLTZAL_EX_DS_B_NT_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_ADDI
 */
#define TEST_BGEZAL_EX_DS_EX_ADDI \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_ADD
 */
#define TEST_BGEZAL_EX_DS_EX_ADD \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_SUB
 */
#define TEST_BGEZAL_EX_DS_EX_SUB \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_LH
 */
#define TEST_BGEZAL_EX_DS_EX_LH \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_LHU
 */
#define TEST_BGEZAL_EX_DS_EX_LHU \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_LW
 */
#define TEST_BGEZAL_EX_DS_EX_LW \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_SH
 */
#define TEST_BGEZAL_EX_DS_EX_SH \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_SW
 */
#define TEST_BGEZAL_EX_DS_EX_SW \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_RI
 */
#define TEST_BGEZAL_EX_DS_EX_RI \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_SYSCALL
 */
#define TEST_BGEZAL_EX_DS_EX_SYSCALL \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 87
 * TEST_BGEZAL_EX_DS_EX_BREAK
 */
#define TEST_BGEZAL_EX_DS_EX_BREAK \
    addu t4, zero, $31; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_T_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_F_NT_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_T_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    BGEZAL_EX_DS_B_NT_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_ADDI
 */
#define TEST_J_EX_DS_EX_ADDI \
    li v0, 0x09; \
    J_EX_DS_F_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_ADD
 */
#define TEST_J_EX_DS_EX_ADD \
    li v0, 0x09; \
    J_EX_DS_F_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_SUB
 */
#define TEST_J_EX_DS_EX_SUB \
    li v0, 0x09; \
    J_EX_DS_F_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_LH
 */
#define TEST_J_EX_DS_EX_LH \
    li v0, 0x09; \
    J_EX_DS_F_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_LHU
 */
#define TEST_J_EX_DS_EX_LHU \
    li v0, 0x09; \
    J_EX_DS_F_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_LW
 */
#define TEST_J_EX_DS_EX_LW \
    li v0, 0x09; \
    J_EX_DS_F_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_SH
 */
#define TEST_J_EX_DS_EX_SH \
    li v0, 0x09; \
    J_EX_DS_F_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_SW
 */
#define TEST_J_EX_DS_EX_SW \
    li v0, 0x09; \
    J_EX_DS_F_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_RI
 */
#define TEST_J_EX_DS_EX_RI \
    li v0, 0x09; \
    J_EX_DS_F_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_SYSCALL
 */
#define TEST_J_EX_DS_EX_SYSCALL \
    li v0, 0x09; \
    J_EX_DS_F_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 88
 * TEST_J_EX_DS_EX_BREAK
 */
#define TEST_J_EX_DS_EX_BREAK \
    li v0, 0x09; \
    J_EX_DS_F_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    J_EX_DS_B_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_ADDI
 */
#define TEST_JAL_EX_DS_EX_ADDI \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_ADD
 */
#define TEST_JAL_EX_DS_EX_ADD \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_SUB
 */
#define TEST_JAL_EX_DS_EX_SUB \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_LH
 */
#define TEST_JAL_EX_DS_EX_LH \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_LHU
 */
#define TEST_JAL_EX_DS_EX_LHU \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_LW
 */
#define TEST_JAL_EX_DS_EX_LW \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_SH
 */
#define TEST_JAL_EX_DS_EX_SH \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_SW
 */
#define TEST_JAL_EX_DS_EX_SW \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_RI
 */
#define TEST_JAL_EX_DS_EX_RI \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_SYSCALL
 */
#define TEST_JAL_EX_DS_EX_SYSCALL \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 89
 * TEST_JAL_EX_DS_EX_BREAK
 */
#define TEST_JAL_EX_DS_EX_BREAK \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JAL_EX_DS_F_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JAL_EX_DS_B_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_ADDI
 */
#define TEST_JR_EX_DS_EX_ADDI \
    li v0, 0x09; \
    JR_EX_DS_F_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_ADDI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_ADD
 */
#define TEST_JR_EX_DS_EX_ADD \
    li v0, 0x09; \
    JR_EX_DS_F_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_ADD; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_SUB
 */
#define TEST_JR_EX_DS_EX_SUB \
    li v0, 0x09; \
    JR_EX_DS_F_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_SUB; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_LH
 */
#define TEST_JR_EX_DS_EX_LH \
    li v0, 0x09; \
    JR_EX_DS_F_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_LH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_LHU
 */
#define TEST_JR_EX_DS_EX_LHU \
    li v0, 0x09; \
    JR_EX_DS_F_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_LHU; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_LW
 */
#define TEST_JR_EX_DS_EX_LW \
    li v0, 0x09; \
    JR_EX_DS_F_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_LW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_SH
 */
#define TEST_JR_EX_DS_EX_SH \
    li v0, 0x09; \
    JR_EX_DS_F_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_SH; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_SW
 */
#define TEST_JR_EX_DS_EX_SW \
    li v0, 0x09; \
    JR_EX_DS_F_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_SW; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_RI
 */
#define TEST_JR_EX_DS_EX_RI \
    li v0, 0x09; \
    JR_EX_DS_F_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_RI; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_SYSCALL
 */
#define TEST_JR_EX_DS_EX_SYSCALL \
    li v0, 0x09; \
    JR_EX_DS_F_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_SYSCALL; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 90
 * TEST_JR_EX_DS_EX_BREAK
 */
#define TEST_JR_EX_DS_EX_BREAK \
    li v0, 0x09; \
    JR_EX_DS_F_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JR_EX_DS_B_BREAK; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_ADDI
 */
#define TEST_JALR_EX_DS_EX_ADDI \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_ADDI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_ADD
 */
#define TEST_JALR_EX_DS_EX_ADD \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_ADD; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_SUB
 */
#define TEST_JALR_EX_DS_EX_SUB \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_SUB; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_LH
 */
#define TEST_JALR_EX_DS_EX_LH \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_LH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_LHU
 */
#define TEST_JALR_EX_DS_EX_LHU \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_LHU; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_LW
 */
#define TEST_JALR_EX_DS_EX_LW \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_LW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_SH
 */
#define TEST_JALR_EX_DS_EX_SH \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_SH; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_SW
 */
#define TEST_JALR_EX_DS_EX_SW \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_SW; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_RI
 */
#define TEST_JALR_EX_DS_EX_RI \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_RI; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_SYSCALL
 */
#define TEST_JALR_EX_DS_EX_SYSCALL \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_SYSCALL; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop

/* 91
 * TEST_JALR_EX_DS_EX_BREAK
 */
#define TEST_JALR_EX_DS_EX_BREAK \
    addu t4, zero, $31; \
    li v0, 0x09; \
    JALR_EX_DS_F_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop; \
    li v0, 0x09; \
    JALR_EX_DS_B_BREAK; \
    addu $31, t4, zero; \
    li s4, 0x00001117; \
    bne s4, s2, inst_error; \
    nop; \
    lui s4, 0x4444; \
    bne s4, v0, inst_error; \
    nop
