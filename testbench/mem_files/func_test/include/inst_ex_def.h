// file name: inst_ex_def.h

/* 58
 * ADD_EX(v_s0, v0, v1)
 */
#define ADD_EX(v_s0, v0, v1) \
    li s0, v_s0; \
    li t0, v0; \
    li t1, v1; \
    add s0, t0, t1

/* 59
 * ADDI_EX(v_s0, v0, v1)
 */
#define ADDI_EX(v_s0, v0, v1) \
    li s0, v_s0; \
    li t0, v0; \
    li t1, v1; \
    addi s0, t0, v1

/* 60
 * SUB_EX(v_s0, v0, v1)
 */
#define SUB_EX(v_s0, v0, v1) \
    li s0, v_s0; \
    li t0, v0; \
    li t1, v1; \
    sub s0, t0, t1

/* 61
 * LH_EX(v_s0, data, base_addr, offset, offset_align)
 */
#define LH_EX(v_s0, data, base_addr, offset, offset_align) \
    li s0, v_s0; \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset_align(t0); \
    lh s0, offset(t0); \
    mfc0 s5, c0_badvaddr

/* 62
 * LHU_EX(v_s0, data, base_addr, offset, offset_align)
 */
#define LHU_EX(v_s0, data, base_addr, offset, offset_align) \
    li s0, v_s0; \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset_align(t0); \
    lhu s0, offset(t0); \
    mfc0 s5, c0_badvaddr

/* 63
 * LW_EX(v_s0, data, base_addr, offset, offset_align)
 */
#define LW_EX(v_s0, data, base_addr, offset, offset_align) \
    li s0, v_s0; \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset_align(t0); \
    lw s0, offset(t0); \
    mfc0 s5, c0_badvaddr

/* 64
 * SH_EX(v_s0, data_init, data, base_addr, offset, offset_align)
 */
#define SH_EX(v_s0, data_init, data, base_addr, offset, offset_align) \
    li s0, v_s0; \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    li t5, data_init; \
    sw t5, offset_align(t0); \
    sh t1, offset(t0); \
    lw s0, offset_align(t0); \
    mfc0 s5, c0_badvaddr

/* 65
 * SW_EX(v_s0, data_init, data, base_addr, offset, offset_align)
 */
#define SW_EX(v_s0, data_init, data, base_addr, offset, offset_align) \
    li s0, v_s0; \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    li t5, data_init; \
    sw t5, offset_align(t0); \
    sw t1, offset(t0); \
    lw s0, offset_align(t0); \
    mfc0 s5, c0_badvaddr

/* 66
 * ERET_EX(unalign_pc)
 */
#define ERET_EX(unalign_pc) \
    li v0, 0x7; \
    li t0, unalign_pc; \
    la k1, 1234f; \
    mtc0 t0, c0_epc; \
1234:; \
    .set mips32; \
    eret; \
    .set mips1; \
    mfc0 s0, c0_badvaddr

/* 67
 * RESERVED_INSTRUCTION_EX(reserved_instruction)
 */
#define RESERVED_INSTRUCTION_EX(reserved_instruction) \
    .word reserved_instruction
