// file name: inst_ex_test.h
#include <inst_ex_def.h>

/* 58
 * TEST_ADD_EX(v_s0, vs, vt, vd)
 */
#define TEST_ADD_EX(v_s0, vs, vt, vd) \
    li v0, 0x04; \
    ADD_EX(v_s0, vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x1234; \
    bne v0, s2, inst_error; \
    nop

/* 59
 * TEST_ADDI_EX(v_s0, vs, vt, vd)
 */
#define TEST_ADDI_EX(v_s0, vs, vt, vd) \
    li v0, 0x04; \
    ADDI_EX(v_s0, vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x1234; \
    bne v0, s2, inst_error; \
    nop

/* 60
 * TEST_SUB_EX(v_s0, vs, vt, vd)
 */
#define TEST_SUB_EX(v_s0, vs, vt, vd) \
    li v0, 0x04; \
    SUB_EX(v_s0, vs, vt); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x1234; \
    bne v0, s2, inst_error; \
    nop

/* 61
 * TEST_LH_EX(v_s0, data, base_addr, offset, offset_align, vd, badvaddr)
 */
#define TEST_LH_EX(v_s0, data, base_addr, offset, offset_align, vd, badvaddr) \
    li v0, 0x05; \
    LH_EX(v_s0, data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x5678; \
    bne v0, s2, inst_error; \
    nop; \
    li s6, badvaddr; \
    bne s5, s6, inst_error; \
    nop

/* 62
 * TEST_LHU_EX(v_s0, data, base_addr, offset, offset_align, vd, badvaddr)
 */
#define TEST_LHU_EX(v_s0, data, base_addr, offset, offset_align, vd, badvaddr) \
    li v0, 0x05; \
    LHU_EX(v_s0, data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x5678; \
    bne v0, s2, inst_error; \
    nop; \
    li s6, badvaddr; \
    bne s5, s6, inst_error; \
    nop

/* 63
 * TEST_LW_EX(v_s0, data, base_addr, offset, offset_align, vd, badvaddr)
 */
#define TEST_LW_EX(v_s0, data, base_addr, offset, offset_align, vd, badvaddr) \
    li v0, 0x05; \
    LW_EX(v_s0, data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x5678; \
    bne v0, s2, inst_error; \
    nop; \
    li s6, badvaddr; \
    bne s5, s6, inst_error; \
    nop

/* 64
 * TEST_SH_EX(v_s0, data_init, data, base_addr, offset, offset_align, vd, badvaddr)
 */
#define TEST_SH_EX(v_s0, data_init, data, base_addr, offset, offset_align, vd, badvaddr) \
    li v0, 0x06; \
    SH_EX(v_s0, data_init, data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x1111; \
    bne v0, s2, inst_error; \
    nop; \
    li s6, badvaddr; \
    bne s5, s6, inst_error; \
    nop

/* 65
 * TEST_SW_EX(v_s0, data_init, data, base_addr, offset, offset_align, vd, badvaddr)
 */
#define TEST_SW_EX(v_s0, data_init, data, base_addr, offset, offset_align, vd, badvaddr) \
    li v0, 0x06; \
    SW_EX(v_s0, data_init, data, base_addr, offset, offset_align); \
    li s2, vd; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x1111; \
    bne v0, s2, inst_error; \
    nop; \
    li s6, badvaddr; \
    bne s5, s6, inst_error; \
    nop

/* 66
 * TEST_ERET_EX(unalign_pc, c0_badvaddr_ref)
 */
#define TEST_ERET_EX(unalign_pc, c0_badvaddr_ref) \
    li v0, 0x07; \
    ERET_EX(unalign_pc); \
    li s2, c0_badvaddr_ref; \
    bne s0, s2, inst_error; \
    nop; \
    lui s2, 0x2222; \
    bne v0, s2, inst_error; \
    nop

/* 67
 * TEST_RESERVED_INSTRUCTION_EX(reserved_instruction)
 */
#define TEST_RESERVED_INSTRUCTION_EX(reserved_instruction) \
    li v0, 0x08; \
    RESERVED_INSTRUCTION_EX(reserved_instruction); \
    lui s2, 0x3333; \
    bne v0, s2, inst_error; \
    nop
