// file name: inst_def.h

/* 1
 * ADD(v0, v1)
 */
#define ADD(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    add s0, t0, t1

/* 2
 * ADDI(v0, v1)
 */
#define ADDI(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    addi s0, t0, v1

/* 3
 * ADDU(v0, v1)
 */
#define ADDU(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    addu s0, t0, t1

/* 4
 * ADDIU(v0, v1)
 */
#define ADDIU(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    addiu s0, t0, v1

/* 5
 * SUB(v0, v1)
 */
#define SUB(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    sub s0, t0, t1

/* 6
 * SUBU(v0, v1)
 */
#define SUBU(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    subu s0, t0, t1

/* 7
 * SLT(v0, v1)
 */
#define SLT(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    slt s0, t0, t1

/* 8
 * SLTI(v0, v1)
 */
#define SLTI(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    slti s0, t0, v1

/* 9
 * SLTU(v0, v1)
 */
#define SLTU(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    sltu s0, t0, t1

/* 10
 * SLTIU(v0, v1)
 */
#define SLTIU(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    sltiu s0, t0, v1

/* 11
 * DIV(v0, v1)
 */
#define DIV(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    div zero, t0, t1

/* 12
 * DIVU(v0, v1)
 */
#define DIVU(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    divu zero, t0, t1

/* 13
 * MULT(v0, v1)
 */
#define MULT(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    mult t0, t1

/* 14
 * MULTU(v0, v1)
 */
#define MULTU(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    multu t0, t1

/* 15
 * AND(v0, v1)
 */
#define AND(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    and s0, t0, t1

/* 16
 * ANDI(v0, v1)
 */
#define ANDI(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    andi s0, t0, v1

/* 17
 * LUI(v0)
 */
#define LUI(v0) \
    lui t0, v0

/* 18
 * NOR(v0, v1)
 */
#define NOR(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    nor s0, t0, t1

/* 19
 * OR(v0, v1)
 */
#define OR(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    or s0, t0, t1

/* 20
 * ORI(v0, v1)
 */
#define ORI(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    ori s0, t0, v1

/* 21
 * XOR(v0, v1)
 */
#define XOR(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    xor s0, t0, t1

/* 22
 * XORI(v0, v1)
 */
#define XORI(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    xori s0, t0, v1

/* 23
 * SLL(v0, v1)
 */
#define SLL(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    sll s0, t0, v1

/* 24
 * SLLV(v0, v1)
 */
#define SLLV(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    sllv s0, t0, t1

/* 25
 * SRA(v0, v1)
 */
#define SRA(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    sra s0, t0, v1

/* 26
 * SRAV(v0, v1)
 */
#define SRAV(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    srav s0, t0, t1

/* 27
 * SRL(v0, v1)
 */
#define SRL(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    srl s0, t0, v1

/* 28
 * SRLV(v0, v1)
 */
#define SRLV(v0, v1) \
    li t0, v0; \
    li t1, v1; \
    srlv s0, t0, t1

/* 29
 * BEQ(v0, v1, back_flag, front_flag)
 */
#define BEQ(v0, v1, back_flag, front_flag) \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
    beq t1, t0, 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    li t0, v0; \
    li t1, v1; \
    beq t0, t1, 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    nop

/* 30
 * BNE(v0, v1, back_flag, front_flag)
 */
#define BNE(v0, v1, back_flag, front_flag) \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
    bne t1, t0, 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    li t0, v0; \
    li t1, v1; \
    bne t0, t1, 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    nop

/* 31
 * BGEZ(v0, back_flag, front_flag)
 */
#define BGEZ(v0, back_flag, front_flag) \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
    bgez t0, 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    li t0, v0; \
    bgez t0, 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    nop

/* 32
 * BGTZ(v0, back_flag, front_flag)
 */
#define BGTZ(v0, back_flag, front_flag) \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
    bgtz t0, 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    li t0, v0; \
    bgtz t0, 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    nop

/* 33
 * BLEZ(v0, back_flag, front_flag)
 */
#define BLEZ(v0, back_flag, front_flag) \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
    blez t0, 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    li t0, v0; \
    blez t0, 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    nop

/* 34
 * BLTZ(v0, back_flag, front_flag)
 */
#define BLTZ(v0, back_flag, front_flag) \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
    bltz t0, 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    li t0, v0; \
    bltz t0, 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    nop

/* 35
 * BLTZAL(v0, back_flag, front_flag)
 */
#define BLTZAL(v0, back_flag, front_flag) \
    addu s5, zero, $31; \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
1001:; \
    bltzal t0, 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    li t0, v0; \
2001:; \
    bltzal t0, 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    addu s4, zero, $31; \
    addu $31, zero, s5; \
    la s5, 1001b; \
    la s6, 2001b

/* 36
 * BGEZAL(v0, back_flag, front_flag)
 */
#define BGEZAL(v0, back_flag, front_flag) \
    addu s5, zero, $31; \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
1001:; \
    bgezal t0, 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    li t0, v0; \
2001:; \
    bgezal t0, 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    addu s4, zero, $31; \
    addu $31, zero, s5; \
    la s5, 1001b; \
    la s6, 2001b

/* 37
 * J(back_flag, front_flag)
 */
#define J(back_flag, front_flag) \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
    j 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    j 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    nop

/* 38
 * JAL(back_flag, front_flag)
 */
#define JAL(back_flag, front_flag) \
    addu s6, zero, $31; \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
1001:; \
    jal 3000f; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    jal 1000b; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    addu s4, zero, $31; \
    addu $31, zero, s6; \
    la s5, 1001b

/* 39
 * JR(back_flag, front_flag)
 */
#define JR(back_flag, front_flag) \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    li s2, 0x0; \
    la t0, 1000f; \
    la t1, 3000f; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
    jr t1; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    jr t0; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    nop

/* 40
 * JALR(back_flag, front_flag)
 */
#define JALR(back_flag, front_flag) \
    addu s6, zero, $31; \
    li t4, back_flag; \
    li t5, front_flag; \
    li s0, 0x0; \
    la t0, 1000f; \
    la t1, 3000f; \
    li s2, 0x0; \
    b 2000f; \
    nop; \
1000:; \
    li s0, back_flag; \
1001:; \
    jalr t1; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    jalr t0; \
    nop; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    li s2, front_flag; \
4000:; \
    addu s4, zero, $31; \
    addu $31, zero, s6; \
    la s5, 1001b

/* 41
 * MFHI(v0)
 */
#define MFHI(v0) \
    li t0, v0; \
    mthi t0; \
    mfhi s0

/* 42
 * MFLO(v0)
 */
#define MFLO(v0) \
    li t0, v0; \
    mtlo t0; \
    mflo s0

/* 43
 * MTHI(v0)
 */
#define MTHI(v0) \
    li t0, v0; \
    mthi t0; \
    mfhi s0

/* 44
 * MTLO(v0)
 */
#define MTLO(v0) \
    li t0, v0; \
    mtlo t0; \
    mflo s0

/* 47
 * LB(data, base_addr, offset, offset_align)
 */
#define LB(data, base_addr, offset, offset_align) \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset_align(t0); \
    lb s0, offset(t0)

/* 48
 * LBU(data, base_addr, offset, offset_align)
 */
#define LBU(data, base_addr, offset, offset_align) \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset_align(t0); \
    lbu s0, offset(t0)

/* 49
 * LH(data, base_addr, offset, offset_align)
 */
#define LH(data, base_addr, offset, offset_align) \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset_align(t0); \
    lh s0, offset(t0)

/* 50
 * LHU(data, base_addr, offset, offset_align)
 */
#define LHU(data, base_addr, offset, offset_align) \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset_align(t0); \
    lhu s0, offset(t0)

/* 51
 * LW(data, base_addr, offset, offset_align)
 */
#define LW(data, base_addr, offset, offset_align) \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset_align(t0); \
    lw s0, offset(t0)

/* 52
 * SB(data_init, data, base_addr, offset, offset_align)
 */
#define SB(data_init, data, base_addr, offset, offset_align) \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    li t5, data_init; \
    sw t5, offset_align(t0); \
    sb t1, offset(t0); \
    lw s0, offset_align(t0)

/* 53
 * SH(data_init, data, base_addr, offset, offset_align)
 */
#define SH(data_init, data, base_addr, offset, offset_align) \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    li t5, data_init; \
    sw t5, offset_align(t0); \
    sh t1, offset(t0); \
    lw s0, offset_align(t0)

/* 54
 * SW(data, base_addr, offset, offset_align)
 */
#define SW(data, base_addr, offset, offset_align) \
    li t1, data; \
    li t0, base_addr; \
    li t2, offset; \
    li t4, offset_align; \
    sw t1, offset(t0); \
    lw s0, offset_align(t0)
