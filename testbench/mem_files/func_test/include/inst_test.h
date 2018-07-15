// file name: inst_test.h
#include <inst_def.h>

/* 1
 * TEST_ADD(vs, vt, vd)
 */
#define TEST_ADD(vs, vt, vd) \
    ADD(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 2
 * TEST_ADDI(vs, vt, vd)
 */
#define TEST_ADDI(vs, vt, vd) \
    ADDI(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 3
 * TEST_ADDU(vs, vt, vd)
 */
#define TEST_ADDU(vs, vt, vd) \
    ADDU(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 4
 * TEST_ADDIU(vs, vt, vd)
 */
#define TEST_ADDIU(vs, vt, vd) \
    ADDIU(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 5
 * TEST_SUB(vs, vt, vd)
 */
#define TEST_SUB(vs, vt, vd) \
    SUB(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 6
 * TEST_SUBU(vs, vt, vd)
 */
#define TEST_SUBU(vs, vt, vd) \
    SUBU(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 7
 * TEST_SLT(vs, vt, vd)
 */
#define TEST_SLT(vs, vt, vd) \
    SLT(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 8
 * TEST_SLTI(vs, vt, vd)
 */
#define TEST_SLTI(vs, vt, vd) \
    SLTI(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 9
 * TEST_SLTU(vs, vt, vd)
 */
#define TEST_SLTU(vs, vt, vd) \
    SLTU(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 10
 * TEST_SLTIU(vs, vt, vd)
 */
#define TEST_SLTIU(vs, vt, vd) \
    SLTIU(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 11
 * TEST_DIV(vs, vt, lo, hi)
 */
#define TEST_DIV(vs, vt, lo, hi) \
    DIV(vs, vt); \
    mflo s0; \
    li s2, lo; \
    bne s0, s2, inst_error; \
    nop; \
    mfhi s0; \
    li s2, hi; \
    bne s0, s2, inst_error; \
    nop

/* 12
 * TEST_DIVU(vs, vt, lo, hi)
 */
#define TEST_DIVU(vs, vt, lo, hi) \
    DIVU(vs, vt); \
    mflo s0; \
    li s2, lo; \
    bne s0, s2, inst_error; \
    nop; \
    mfhi s0; \
    li s2, hi; \
    bne s0, s2, inst_error; \
    nop

/* 13
 * TEST_MULT(vs, vt, lo, hi)
 */
#define TEST_MULT(vs, vt, lo, hi) \
    MULT(vs, vt); \
    mflo s0; \
    li s2, lo; \
    bne s0, s2, inst_error; \
    nop; \
    mfhi s0; \
    li s2, hi; \
    bne s0, s2, inst_error; \
    nop

/* 14
 * TEST_MULTU(vs, vt, lo, hi)
 */
#define TEST_MULTU(vs, vt, lo, hi) \
    MULTU(vs, vt); \
    mflo s0; \
    li s2, lo; \
    bne s0, s2, inst_error; \
    nop; \
    mfhi s0; \
    li s2, hi; \
    bne s0, s2, inst_error; \
    nop

/* 15
 * TEST_AND(vs, vt, vd)
 */
#define TEST_AND(vs, vt, vd) \
    AND(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 16
 * TEST_ANDI(vs, vt, vd)
 */
#define TEST_ANDI(vs, vt, vd) \
    ANDI(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 17
 * TEST_LUI(imm, vt)
 */
#define TEST_LUI(imm, vt) \
    LUI(imm); \
    li s0, vt; \
    bne t0, s0, inst_error; \
    nop

/* 18
 * TEST_NOR(vs, vt, vd)
 */
#define TEST_NOR(vs, vt, vd) \
    NOR(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 19
 * TEST_OR(vs, vt, vd)
 */
#define TEST_OR(vs, vt, vd) \
    OR(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 20
 * TEST_ORI(vs, vt, vd)
 */
#define TEST_ORI(vs, vt, vd) \
    ORI(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 21
 * TEST_XOR(vs, vt, vd)
 */
#define TEST_XOR(vs, vt, vd) \
    XOR(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 22
 * TEST_XORI(vs, vt, vd)
 */
#define TEST_XORI(vs, vt, vd) \
    XORI(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 23
 * TEST_SLL(vs, vt, vd)
 */
#define TEST_SLL(vs, vt, vd) \
    SLL(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 24
 * TEST_SLLV(vs, vt, vd)
 */
#define TEST_SLLV(vs, vt, vd) \
    SLLV(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 25
 * TEST_SRA(vs, vt, vd)
 */
#define TEST_SRA(vs, vt, vd) \
    SRA(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 26
 * TEST_SRAV(vs, vt, vd)
 */
#define TEST_SRAV(vs, vt, vd) \
    SRAV(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 27
 * TEST_SRL(vs, vt, vd)
 */
#define TEST_SRL(vs, vt, vd) \
    SRL(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 28
 * TEST_SRLV(vs, vt, vd)
 */
#define TEST_SRLV(vs, vt, vd) \
    SRLV(vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 29
 * TEST_BEQ(vs0, vs1, back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_BEQ(vs0, vs1, back_flag, front_flag, b_flag_ref, f_flag_ref) \
    BEQ(vs0, vs1, back_flag, front_flag); \
    li s4, b_flag_ref; \
    bne s0, s4, inst_error; \
    nop; \
    li s5, f_flag_ref; \
    bne s2, s5, inst_error; \
    nop

/* 30
 * TEST_BNE(vs0, vs1, back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_BNE(vs0, vs1, back_flag, front_flag, b_flag_ref, f_flag_ref) \
    BNE(vs0, vs1, back_flag, front_flag); \
    li s4, b_flag_ref; \
    bne s0, s4, inst_error; \
    nop; \
    li s5, f_flag_ref; \
    bne s2, s5, inst_error; \
    nop

/* 31
 * TEST_BGEZ(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_BGEZ(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref) \
    BGEZ(vs0, back_flag, front_flag); \
    li s4, b_flag_ref; \
    bne s0, s4, inst_error; \
    nop; \
    li s5, f_flag_ref; \
    bne s2, s5, inst_error; \
    nop

/* 32
 * TEST_BGTZ(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_BGTZ(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref) \
    BGTZ(vs0, back_flag, front_flag); \
    li s4, b_flag_ref; \
    bne s0, s4, inst_error; \
    nop; \
    li s5, f_flag_ref; \
    bne s2, s5, inst_error; \
    nop

/* 33
 * TEST_BLEZ(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_BLEZ(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref) \
    BLEZ(vs0, back_flag, front_flag); \
    li s4, b_flag_ref; \
    bne s0, s4, inst_error; \
    nop; \
    li s5, f_flag_ref; \
    bne s2, s5, inst_error; \
    nop

/* 34
 * TEST_BLTZ(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_BLTZ(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref) \
    BLTZ(vs0, back_flag, front_flag); \
    li s4, b_flag_ref; \
    bne s0, s4, inst_error; \
    nop; \
    li s5, f_flag_ref; \
    bne s2, s5, inst_error; \
    nop

/* 35
 * TEST_BLTZAL(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref, pc_ref, pc_call1, pc_call2)
 */
#define TEST_BLTZAL(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref, pc_ref, pc_call1, pc_call2) \
    BLTZAL(vs0, back_flag, front_flag); \
    li t8, b_flag_ref; \
    bne s0, t8, inst_error; \
    nop; \
    li t8, f_flag_ref; \
    bne s2, t8, inst_error; \
    nop; \
    li t9, pc_ref; \
    li t8, pc_call1; \
    addiu t8, t8, 8; \
    beq t8, t9, 10000f; \
    nop; \
    li t8, pc_call2; \
    addiu t8, t8, 8; \
    beq t8, t9, 20000f; \
    nop; \
    b inst_error; \
    nop; \
10000:; \
    addiu s5, s5, 8; \
    bne s4, s5, inst_error; \
    nop; \
    b 30000f; \
    nop; \
20000:; \
    addiu s6, s6, 8; \
    bne s4, s6, inst_error; \
    nop; \
30000:; \
    nop

/* 36
 * TEST_BGEZAL(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref, pc_ref, pc_call1, pc_call2)
 */
#define TEST_BGEZAL(vs0, back_flag, front_flag, b_flag_ref, f_flag_ref, pc_ref, pc_call1, pc_call2) \
    BGEZAL(vs0, back_flag, front_flag); \
    li t8, b_flag_ref; \
    bne s0, t8, inst_error; \
    nop; \
    li t8, f_flag_ref; \
    bne s2, t8, inst_error; \
    nop; \
    li t9, pc_ref; \
    li t8, pc_call1; \
    addiu t8, t8, 8; \
    beq t8, t9, 10000f; \
    nop; \
    li t8, pc_call2; \
    addiu t8, t8, 8; \
    beq t8, t9, 20000f; \
    nop; \
    b inst_error; \
    nop; \
10000:; \
    addiu s5, s5, 8; \
    bne s4, s5, inst_error; \
    nop; \
    b 30000f; \
    nop; \
20000:; \
    addiu s6, s6, 8; \
    bne s4, s6, inst_error; \
    nop; \
30000:; \
    nop

/* 37
 * TEST_J(back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_J(back_flag, front_flag, b_flag_ref, f_flag_ref) \
    J(back_flag, front_flag); \
    li s4, b_flag_ref; \
    bne s0, s4, inst_error; \
    nop; \
    li s5, f_flag_ref; \
    bne s2, s5, inst_error; \
    nop

/* 38
 * TEST_JAL(back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_JAL(back_flag, front_flag, b_flag_ref, f_flag_ref) \
    JAL(back_flag, front_flag); \
    li t5, b_flag_ref; \
    bne s0, t5, inst_error; \
    nop; \
    li t4, f_flag_ref; \
    bne s2, t4, inst_error; \
    nop; \
    addiu s5, s5, 8; \
    bne s4, s5, inst_error; \
    nop

/* 39
 * TEST_JR(back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_JR(back_flag, front_flag, b_flag_ref, f_flag_ref) \
    JR(back_flag, front_flag); \
    li s4, b_flag_ref; \
    bne s0, s4, inst_error; \
    nop; \
    li s5, f_flag_ref; \
    bne s2, s5, inst_error; \
    nop

/* 40
 * TEST_JALR(back_flag, front_flag, b_flag_ref, f_flag_ref)
 */
#define TEST_JALR(back_flag, front_flag, b_flag_ref, f_flag_ref) \
    JALR(back_flag, front_flag); \
    li t5, b_flag_ref; \
    bne s0, t5, inst_error; \
    nop; \
    li t4, f_flag_ref; \
    bne s2, t4, inst_error; \
    nop; \
    addiu s5, s5, 8; \
    bne s4, s5, inst_error; \
    nop

/* 41
 * TEST_MFHI(vs, vd)
 */
#define TEST_MFHI(vs, vd) \
    MFHI(vs); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 42
 * TEST_MFLO(vs, vd)
 */
#define TEST_MFLO(vs, vd) \
    MFLO(vs); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 43
 * TEST_MTHI(vs, vd)
 */
#define TEST_MTHI(vs, vd) \
    MTHI(vs); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 44
 * TEST_MTLO(vs, vd)
 */
#define TEST_MTLO(vs, vd) \
    MTLO(vs); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 47
 * TEST_LB(data, base_addr, offset, offset_align, vd)
 */
#define TEST_LB(data, base_addr, offset, offset_align, vd) \
    LB(data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 48
 * TEST_LBU(data, base_addr, offset, offset_align, vd)
 */
#define TEST_LBU(data, base_addr, offset, offset_align, vd) \
    LBU(data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 49
 * TEST_LH(data, base_addr, offset, offset_align, vd)
 */
#define TEST_LH(data, base_addr, offset, offset_align, vd) \
    LH(data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 50
 * TEST_LHU(data, base_addr, offset, offset_align, vd)
 */
#define TEST_LHU(data, base_addr, offset, offset_align, vd) \
    LHU(data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 51
 * TEST_LW(data, base_addr, offset, offset_align, vd)
 */
#define TEST_LW(data, base_addr, offset, offset_align, vd) \
    LW(data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 52
 * TEST_SB(data_init, data, base_addr, offset, offset_align, vd)
 */
#define TEST_SB(data_init, data, base_addr, offset, offset_align, vd) \
    SB(data_init, data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 53
 * TEST_SH(data_init, data, base_addr, offset, offset_align, vd)
 */
#define TEST_SH(data_init, data, base_addr, offset, offset_align, vd) \
    SH(data_init, data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop

/* 54
 * TEST_SW(data, base_addr, offset, offset_align, vd)
 */
#define TEST_SW(data, base_addr, offset, offset_align, vd) \
    SW(data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop
