// file name: inst_delay_slot_def.h

/* 68
 * BEQ_DS
 */
#define BEQ_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
1001:; \
    addiu s2, s2, 0x2222; \
    beq t1, t2, 4000f; \
    addiu s0, s0, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    b 4000f; \
    nop; \
2000:; \
    beq t0, t1, 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
2001:; \
    beq t0, t2, 1001b; \
    addu s0, s0, t2; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1001b; \
    nop; \
    addu zero, zero, zero; \
3000:; \
    addu s2, t1, t2; \
    b 2001b; \
    nop; \
4000:; \
    addu s2, s0, s2; \
    nop

/* 69
 * BNE_DS
 */
#define BNE_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
1001:; \
    addiu s2, s2, 0x2222; \
    bne t1, t2, 4000f; \
    addiu s0, s0, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    bne t0, t1, 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
2001:; \
    bne t0, t2, 1001b; \
    addu s0, s0, t2; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1001b; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    addu s2, t1, t2; \
    b 2001b; \
    nop; \
4000:; \
    addu s2, s0, s2; \
    nop

/* 70
 * BGEZ_DS
 */
#define BGEZ_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
1001:; \
    addiu s2, s2, 0x2222; \
    bgez t2, 4000f; \
    addiu s0, s0, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    bgez t0, 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
2001:; \
    bgez t2, 1001b; \
    addu s0, s0, t2; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1001b; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    addu s2, t1, t2; \
    b 2001b; \
    nop; \
4000:; \
    addu s2, s0, s2; \
    nop

/* 71
 * BGTZ_DS
 */
#define BGTZ_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
1001:; \
    addiu s2, s2, 0x2222; \
    bgtz t2, 4000f; \
    addiu s0, s0, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
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
2000:; \
    bgtz t0, 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
2001:; \
    bgtz t2, 1001b; \
    addu s0, s0, t2; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1001b; \
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
    addu s2, t1, t2; \
    b 2001b; \
    nop; \
4000:; \
    addu s2, s0, s2; \
    nop

/* 72
 * BLEZ_DS
 */
#define BLEZ_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    blez t0, 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
1001:; \
    addiu s2, s2, 0x2222; \
    blez t2, 4000f; \
    addiu s0, s0, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
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
2000:; \
    blez t0, 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
2001:; \
    blez t2, 1001b; \
    addu s0, s0, t2; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1001b; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    addu s2, t1, t2; \
    b 2001b; \
    nop; \
4000:; \
    addu s2, s0, s2; \
    nop

/* 73
 * BLTZ_DS
 */
#define BLTZ_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
1001:; \
    addiu s2, s2, 0x2222; \
    bltz t2, 4000f; \
    addiu s0, s0, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    bltz t0, 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
2001:; \
    bltz t2, 1001b; \
    addu s0, s0, t2; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1001b; \
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
3000:; \
    addu s2, t1, t2; \
    b 2001b; \
    nop; \
4000:; \
    addu s2, s0, s2; \
    nop

/* 74
 * BLTZAL_DS
 */
#define BLTZAL_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
1001:; \
    addiu s2, s2, 0x2222; \
    bltzal t2, 4000f; \
    addiu s0, s0, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    b 4000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    bltzal t0, 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
2001:; \
    bltzal t2, 1001b; \
    addu s0, s0, t2; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1001b; \
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
    addu s2, t1, t2; \
    b 2001b; \
    nop; \
4000:; \
    addu s2, s0, s2; \
    nop

/* 75
 * BGEZAL_DS
 */
#define BGEZAL_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
1001:; \
    addiu s2, s2, 0x2222; \
    bgezal t2, 4000f; \
    addiu s0, s0, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
    addiu s2, s2, 1; \
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
2000:; \
    bgezal t0, 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
2001:; \
    bgezal t2, 1001b; \
    addu s0, s0, t2; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1001b; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    addu s2, t1, t2; \
    b 2001b; \
    nop; \
4000:; \
    addu s2, s0, s2; \
    nop

/* 76
 * J_DS
 */
#define J_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    j 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    j 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
3000:; \
    addu s2, t1, t2; \
    addu s2, s0, s2; \
    nop

/* 77
 * JAL_DS
 */
#define JAL_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    jal 3000f; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
2000:; \
    jal 1000b; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
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
    addu s2, t1, t2; \
    addu s2, s0, s2; \
    nop

/* 78
 * JR_DS
 */
#define JR_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    la t5, 3000f; \
    jr t5; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
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
    la t5, 1000b; \
    jr t5; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
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
3000:; \
    addu s2, t1, t2; \
    addu s2, s0, s2; \
    nop

/* 79
 * JALR_DS
 */
#define JALR_DS \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x12345678; \
    li t1, 0x12345678; \
    li t2, 0x87654321; \
    b 2000f; \
    nop; \
1000:; \
    addiu s0, s0, 0x1111; \
    la t5, 3000f; \
    jalr t5; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    addiu s0, s0, 1; \
    b 3000f; \
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
    la t5, 1000b; \
    jalr t5; \
    addu s0, t0, t1; \
    addiu s0, s0, -1; \
    addiu s0, s0, -1; \
    b 1000b; \
    nop; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
    addu zero, zero, zero; \
3000:; \
    addu s2, t1, t2; \
    addu s2, s0, s2; \
    nop

/* 80
 * BEQ_EX_DS_F_T_ADDI
 */
#define BEQ_EX_DS_F_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_ADDI
 */
#define BEQ_EX_DS_F_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_ADDI
 */
#define BEQ_EX_DS_B_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_ADDI
 */
#define BEQ_EX_DS_B_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_ADD
 */
#define BEQ_EX_DS_F_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_ADD
 */
#define BEQ_EX_DS_F_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_ADD
 */
#define BEQ_EX_DS_B_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_ADD
 */
#define BEQ_EX_DS_B_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_SUB
 */
#define BEQ_EX_DS_F_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_SUB
 */
#define BEQ_EX_DS_F_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_SUB
 */
#define BEQ_EX_DS_B_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_SUB
 */
#define BEQ_EX_DS_B_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_LH
 */
#define BEQ_EX_DS_F_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_LH
 */
#define BEQ_EX_DS_F_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_LH
 */
#define BEQ_EX_DS_B_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_LH
 */
#define BEQ_EX_DS_B_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_LHU
 */
#define BEQ_EX_DS_F_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_LHU
 */
#define BEQ_EX_DS_F_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_LHU
 */
#define BEQ_EX_DS_B_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_LHU
 */
#define BEQ_EX_DS_B_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_LW
 */
#define BEQ_EX_DS_F_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_LW
 */
#define BEQ_EX_DS_F_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_LW
 */
#define BEQ_EX_DS_B_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_LW
 */
#define BEQ_EX_DS_B_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_SH
 */
#define BEQ_EX_DS_F_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_SH
 */
#define BEQ_EX_DS_F_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_SH
 */
#define BEQ_EX_DS_B_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_SH
 */
#define BEQ_EX_DS_B_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_SW
 */
#define BEQ_EX_DS_F_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_SW
 */
#define BEQ_EX_DS_F_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_SW
 */
#define BEQ_EX_DS_B_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_SW
 */
#define BEQ_EX_DS_B_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_RI
 */
#define BEQ_EX_DS_F_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_RI
 */
#define BEQ_EX_DS_F_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_RI
 */
#define BEQ_EX_DS_B_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_RI
 */
#define BEQ_EX_DS_B_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_SYSCALL
 */
#define BEQ_EX_DS_F_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_SYSCALL
 */
#define BEQ_EX_DS_F_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_SYSCALL
 */
#define BEQ_EX_DS_B_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_SYSCALL
 */
#define BEQ_EX_DS_B_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_T_BREAK
 */
#define BEQ_EX_DS_F_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_F_NT_BREAK
 */
#define BEQ_EX_DS_F_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_T_BREAK
 */
#define BEQ_EX_DS_B_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t1, t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 80
 * BEQ_EX_DS_B_NT_BREAK
 */
#define BEQ_EX_DS_B_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    beq t2, t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_ADDI
 */
#define BNE_EX_DS_F_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_ADDI
 */
#define BNE_EX_DS_F_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_ADDI
 */
#define BNE_EX_DS_B_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_ADDI
 */
#define BNE_EX_DS_B_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_ADD
 */
#define BNE_EX_DS_F_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_ADD
 */
#define BNE_EX_DS_F_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_ADD
 */
#define BNE_EX_DS_B_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_ADD
 */
#define BNE_EX_DS_B_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_SUB
 */
#define BNE_EX_DS_F_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_SUB
 */
#define BNE_EX_DS_F_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_SUB
 */
#define BNE_EX_DS_B_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_SUB
 */
#define BNE_EX_DS_B_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_LH
 */
#define BNE_EX_DS_F_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_LH
 */
#define BNE_EX_DS_F_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_LH
 */
#define BNE_EX_DS_B_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_LH
 */
#define BNE_EX_DS_B_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_LHU
 */
#define BNE_EX_DS_F_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_LHU
 */
#define BNE_EX_DS_F_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_LHU
 */
#define BNE_EX_DS_B_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_LHU
 */
#define BNE_EX_DS_B_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_LW
 */
#define BNE_EX_DS_F_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_LW
 */
#define BNE_EX_DS_F_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_LW
 */
#define BNE_EX_DS_B_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_LW
 */
#define BNE_EX_DS_B_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_SH
 */
#define BNE_EX_DS_F_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_SH
 */
#define BNE_EX_DS_F_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_SH
 */
#define BNE_EX_DS_B_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_SH
 */
#define BNE_EX_DS_B_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_SW
 */
#define BNE_EX_DS_F_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_SW
 */
#define BNE_EX_DS_F_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_SW
 */
#define BNE_EX_DS_B_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_SW
 */
#define BNE_EX_DS_B_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_RI
 */
#define BNE_EX_DS_F_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_RI
 */
#define BNE_EX_DS_F_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_RI
 */
#define BNE_EX_DS_B_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_RI
 */
#define BNE_EX_DS_B_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_SYSCALL
 */
#define BNE_EX_DS_F_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_SYSCALL
 */
#define BNE_EX_DS_F_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_SYSCALL
 */
#define BNE_EX_DS_B_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_SYSCALL
 */
#define BNE_EX_DS_B_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_NT_BREAK
 */
#define BNE_EX_DS_F_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_F_T_BREAK
 */
#define BNE_EX_DS_F_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_NT_BREAK
 */
#define BNE_EX_DS_B_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t1, t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 81
 * BNE_EX_DS_B_T_BREAK
 */
#define BNE_EX_DS_B_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bne t2, t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_ADDI
 */
#define BGEZ_EX_DS_F_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_ADDI
 */
#define BGEZ_EX_DS_F_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_ADDI
 */
#define BGEZ_EX_DS_B_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_ADDI
 */
#define BGEZ_EX_DS_B_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_ADD
 */
#define BGEZ_EX_DS_F_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_ADD
 */
#define BGEZ_EX_DS_F_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_ADD
 */
#define BGEZ_EX_DS_B_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_ADD
 */
#define BGEZ_EX_DS_B_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_SUB
 */
#define BGEZ_EX_DS_F_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_SUB
 */
#define BGEZ_EX_DS_F_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_SUB
 */
#define BGEZ_EX_DS_B_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_SUB
 */
#define BGEZ_EX_DS_B_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_LH
 */
#define BGEZ_EX_DS_F_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_LH
 */
#define BGEZ_EX_DS_F_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_LH
 */
#define BGEZ_EX_DS_B_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_LH
 */
#define BGEZ_EX_DS_B_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_LHU
 */
#define BGEZ_EX_DS_F_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_LHU
 */
#define BGEZ_EX_DS_F_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_LHU
 */
#define BGEZ_EX_DS_B_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_LHU
 */
#define BGEZ_EX_DS_B_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_LW
 */
#define BGEZ_EX_DS_F_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_LW
 */
#define BGEZ_EX_DS_F_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_LW
 */
#define BGEZ_EX_DS_B_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_LW
 */
#define BGEZ_EX_DS_B_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_SH
 */
#define BGEZ_EX_DS_F_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_SH
 */
#define BGEZ_EX_DS_F_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_SH
 */
#define BGEZ_EX_DS_B_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_SH
 */
#define BGEZ_EX_DS_B_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_SW
 */
#define BGEZ_EX_DS_F_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_SW
 */
#define BGEZ_EX_DS_F_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_SW
 */
#define BGEZ_EX_DS_B_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_SW
 */
#define BGEZ_EX_DS_B_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_RI
 */
#define BGEZ_EX_DS_F_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_RI
 */
#define BGEZ_EX_DS_F_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_RI
 */
#define BGEZ_EX_DS_B_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_RI
 */
#define BGEZ_EX_DS_B_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_SYSCALL
 */
#define BGEZ_EX_DS_F_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_SYSCALL
 */
#define BGEZ_EX_DS_F_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_SYSCALL
 */
#define BGEZ_EX_DS_B_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_SYSCALL
 */
#define BGEZ_EX_DS_B_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_T_BREAK
 */
#define BGEZ_EX_DS_F_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_F_NT_BREAK
 */
#define BGEZ_EX_DS_F_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_T_BREAK
 */
#define BGEZ_EX_DS_B_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 82
 * BGEZ_EX_DS_B_NT_BREAK
 */
#define BGEZ_EX_DS_B_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgez t2, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_ADDI
 */
#define BGTZ_EX_DS_F_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_ADDI
 */
#define BGTZ_EX_DS_F_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_ADDI
 */
#define BGTZ_EX_DS_B_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_ADDI
 */
#define BGTZ_EX_DS_B_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_ADD
 */
#define BGTZ_EX_DS_F_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_ADD
 */
#define BGTZ_EX_DS_F_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_ADD
 */
#define BGTZ_EX_DS_B_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_ADD
 */
#define BGTZ_EX_DS_B_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_SUB
 */
#define BGTZ_EX_DS_F_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_SUB
 */
#define BGTZ_EX_DS_F_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_SUB
 */
#define BGTZ_EX_DS_B_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_SUB
 */
#define BGTZ_EX_DS_B_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_LH
 */
#define BGTZ_EX_DS_F_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_LH
 */
#define BGTZ_EX_DS_F_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_LH
 */
#define BGTZ_EX_DS_B_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_LH
 */
#define BGTZ_EX_DS_B_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_LHU
 */
#define BGTZ_EX_DS_F_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_LHU
 */
#define BGTZ_EX_DS_F_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_LHU
 */
#define BGTZ_EX_DS_B_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_LHU
 */
#define BGTZ_EX_DS_B_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_LW
 */
#define BGTZ_EX_DS_F_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_LW
 */
#define BGTZ_EX_DS_F_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_LW
 */
#define BGTZ_EX_DS_B_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_LW
 */
#define BGTZ_EX_DS_B_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_SH
 */
#define BGTZ_EX_DS_F_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_SH
 */
#define BGTZ_EX_DS_F_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_SH
 */
#define BGTZ_EX_DS_B_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_SH
 */
#define BGTZ_EX_DS_B_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_SW
 */
#define BGTZ_EX_DS_F_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_SW
 */
#define BGTZ_EX_DS_F_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_SW
 */
#define BGTZ_EX_DS_B_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_SW
 */
#define BGTZ_EX_DS_B_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_RI
 */
#define BGTZ_EX_DS_F_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_RI
 */
#define BGTZ_EX_DS_F_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_RI
 */
#define BGTZ_EX_DS_B_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_RI
 */
#define BGTZ_EX_DS_B_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_SYSCALL
 */
#define BGTZ_EX_DS_F_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_SYSCALL
 */
#define BGTZ_EX_DS_F_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_SYSCALL
 */
#define BGTZ_EX_DS_B_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_SYSCALL
 */
#define BGTZ_EX_DS_B_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_T_BREAK
 */
#define BGTZ_EX_DS_F_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_F_NT_BREAK
 */
#define BGTZ_EX_DS_F_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_T_BREAK
 */
#define BGTZ_EX_DS_B_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 83
 * BGTZ_EX_DS_B_NT_BREAK
 */
#define BGTZ_EX_DS_B_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgtz t2, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_ADDI
 */
#define BLEZ_EX_DS_F_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_ADDI
 */
#define BLEZ_EX_DS_F_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_ADDI
 */
#define BLEZ_EX_DS_B_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_ADDI
 */
#define BLEZ_EX_DS_B_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_ADD
 */
#define BLEZ_EX_DS_F_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_ADD
 */
#define BLEZ_EX_DS_F_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_ADD
 */
#define BLEZ_EX_DS_B_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_ADD
 */
#define BLEZ_EX_DS_B_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_SUB
 */
#define BLEZ_EX_DS_F_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_SUB
 */
#define BLEZ_EX_DS_F_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_SUB
 */
#define BLEZ_EX_DS_B_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_SUB
 */
#define BLEZ_EX_DS_B_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_LH
 */
#define BLEZ_EX_DS_F_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_LH
 */
#define BLEZ_EX_DS_F_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_LH
 */
#define BLEZ_EX_DS_B_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_LH
 */
#define BLEZ_EX_DS_B_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_LHU
 */
#define BLEZ_EX_DS_F_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_LHU
 */
#define BLEZ_EX_DS_F_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_LHU
 */
#define BLEZ_EX_DS_B_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_LHU
 */
#define BLEZ_EX_DS_B_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_LW
 */
#define BLEZ_EX_DS_F_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_LW
 */
#define BLEZ_EX_DS_F_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_LW
 */
#define BLEZ_EX_DS_B_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_LW
 */
#define BLEZ_EX_DS_B_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_SH
 */
#define BLEZ_EX_DS_F_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_SH
 */
#define BLEZ_EX_DS_F_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_SH
 */
#define BLEZ_EX_DS_B_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_SH
 */
#define BLEZ_EX_DS_B_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_SW
 */
#define BLEZ_EX_DS_F_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_SW
 */
#define BLEZ_EX_DS_F_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_SW
 */
#define BLEZ_EX_DS_B_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_SW
 */
#define BLEZ_EX_DS_B_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_RI
 */
#define BLEZ_EX_DS_F_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_RI
 */
#define BLEZ_EX_DS_F_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_RI
 */
#define BLEZ_EX_DS_B_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_RI
 */
#define BLEZ_EX_DS_B_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_SYSCALL
 */
#define BLEZ_EX_DS_F_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_SYSCALL
 */
#define BLEZ_EX_DS_F_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_SYSCALL
 */
#define BLEZ_EX_DS_B_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_SYSCALL
 */
#define BLEZ_EX_DS_B_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_NT_BREAK
 */
#define BLEZ_EX_DS_F_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_F_T_BREAK
 */
#define BLEZ_EX_DS_F_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_NT_BREAK
 */
#define BLEZ_EX_DS_B_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 84
 * BLEZ_EX_DS_B_T_BREAK
 */
#define BLEZ_EX_DS_B_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    blez t2, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_ADDI
 */
#define BLTZ_EX_DS_F_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_ADDI
 */
#define BLTZ_EX_DS_F_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_ADDI
 */
#define BLTZ_EX_DS_B_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_ADDI
 */
#define BLTZ_EX_DS_B_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_ADD
 */
#define BLTZ_EX_DS_F_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_ADD
 */
#define BLTZ_EX_DS_F_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_ADD
 */
#define BLTZ_EX_DS_B_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_ADD
 */
#define BLTZ_EX_DS_B_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_SUB
 */
#define BLTZ_EX_DS_F_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_SUB
 */
#define BLTZ_EX_DS_F_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_SUB
 */
#define BLTZ_EX_DS_B_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_SUB
 */
#define BLTZ_EX_DS_B_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_LH
 */
#define BLTZ_EX_DS_F_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_LH
 */
#define BLTZ_EX_DS_F_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_LH
 */
#define BLTZ_EX_DS_B_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_LH
 */
#define BLTZ_EX_DS_B_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_LHU
 */
#define BLTZ_EX_DS_F_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_LHU
 */
#define BLTZ_EX_DS_F_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_LHU
 */
#define BLTZ_EX_DS_B_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_LHU
 */
#define BLTZ_EX_DS_B_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_LW
 */
#define BLTZ_EX_DS_F_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_LW
 */
#define BLTZ_EX_DS_F_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_LW
 */
#define BLTZ_EX_DS_B_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_LW
 */
#define BLTZ_EX_DS_B_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_SH
 */
#define BLTZ_EX_DS_F_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_SH
 */
#define BLTZ_EX_DS_F_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_SH
 */
#define BLTZ_EX_DS_B_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_SH
 */
#define BLTZ_EX_DS_B_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_SW
 */
#define BLTZ_EX_DS_F_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_SW
 */
#define BLTZ_EX_DS_F_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_SW
 */
#define BLTZ_EX_DS_B_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_SW
 */
#define BLTZ_EX_DS_B_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_RI
 */
#define BLTZ_EX_DS_F_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_RI
 */
#define BLTZ_EX_DS_F_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_RI
 */
#define BLTZ_EX_DS_B_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_RI
 */
#define BLTZ_EX_DS_B_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_SYSCALL
 */
#define BLTZ_EX_DS_F_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_SYSCALL
 */
#define BLTZ_EX_DS_F_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_SYSCALL
 */
#define BLTZ_EX_DS_B_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_SYSCALL
 */
#define BLTZ_EX_DS_B_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_NT_BREAK
 */
#define BLTZ_EX_DS_F_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_F_T_BREAK
 */
#define BLTZ_EX_DS_F_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_NT_BREAK
 */
#define BLTZ_EX_DS_B_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 85
 * BLTZ_EX_DS_B_T_BREAK
 */
#define BLTZ_EX_DS_B_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltz t2, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_ADDI
 */
#define BLTZAL_EX_DS_F_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_ADDI
 */
#define BLTZAL_EX_DS_F_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_ADDI
 */
#define BLTZAL_EX_DS_B_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_ADDI
 */
#define BLTZAL_EX_DS_B_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_ADD
 */
#define BLTZAL_EX_DS_F_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_ADD
 */
#define BLTZAL_EX_DS_F_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_ADD
 */
#define BLTZAL_EX_DS_B_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_ADD
 */
#define BLTZAL_EX_DS_B_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_SUB
 */
#define BLTZAL_EX_DS_F_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_SUB
 */
#define BLTZAL_EX_DS_F_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_SUB
 */
#define BLTZAL_EX_DS_B_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_SUB
 */
#define BLTZAL_EX_DS_B_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_LH
 */
#define BLTZAL_EX_DS_F_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_LH
 */
#define BLTZAL_EX_DS_F_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_LH
 */
#define BLTZAL_EX_DS_B_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_LH
 */
#define BLTZAL_EX_DS_B_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_LHU
 */
#define BLTZAL_EX_DS_F_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_LHU
 */
#define BLTZAL_EX_DS_F_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_LHU
 */
#define BLTZAL_EX_DS_B_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_LHU
 */
#define BLTZAL_EX_DS_B_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_LW
 */
#define BLTZAL_EX_DS_F_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_LW
 */
#define BLTZAL_EX_DS_F_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_LW
 */
#define BLTZAL_EX_DS_B_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_LW
 */
#define BLTZAL_EX_DS_B_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_SH
 */
#define BLTZAL_EX_DS_F_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_SH
 */
#define BLTZAL_EX_DS_F_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_SH
 */
#define BLTZAL_EX_DS_B_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_SH
 */
#define BLTZAL_EX_DS_B_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_SW
 */
#define BLTZAL_EX_DS_F_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_SW
 */
#define BLTZAL_EX_DS_F_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_SW
 */
#define BLTZAL_EX_DS_B_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_SW
 */
#define BLTZAL_EX_DS_B_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_RI
 */
#define BLTZAL_EX_DS_F_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_RI
 */
#define BLTZAL_EX_DS_F_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_RI
 */
#define BLTZAL_EX_DS_B_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_RI
 */
#define BLTZAL_EX_DS_B_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_SYSCALL
 */
#define BLTZAL_EX_DS_F_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_SYSCALL
 */
#define BLTZAL_EX_DS_F_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_SYSCALL
 */
#define BLTZAL_EX_DS_B_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_SYSCALL
 */
#define BLTZAL_EX_DS_B_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_NT_BREAK
 */
#define BLTZAL_EX_DS_F_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_F_T_BREAK
 */
#define BLTZAL_EX_DS_F_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_NT_BREAK
 */
#define BLTZAL_EX_DS_B_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 86
 * BLTZAL_EX_DS_B_T_BREAK
 */
#define BLTZAL_EX_DS_B_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bltzal t2, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_ADDI
 */
#define BGEZAL_EX_DS_F_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_ADDI
 */
#define BGEZAL_EX_DS_F_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_ADDI
 */
#define BGEZAL_EX_DS_B_T_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_ADDI
 */
#define BGEZAL_EX_DS_B_NT_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_ADD
 */
#define BGEZAL_EX_DS_F_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_ADD
 */
#define BGEZAL_EX_DS_F_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_ADD
 */
#define BGEZAL_EX_DS_B_T_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_ADD
 */
#define BGEZAL_EX_DS_B_NT_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_SUB
 */
#define BGEZAL_EX_DS_F_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_SUB
 */
#define BGEZAL_EX_DS_F_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_SUB
 */
#define BGEZAL_EX_DS_B_T_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_SUB
 */
#define BGEZAL_EX_DS_B_NT_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_LH
 */
#define BGEZAL_EX_DS_F_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_LH
 */
#define BGEZAL_EX_DS_F_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_LH
 */
#define BGEZAL_EX_DS_B_T_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_LH
 */
#define BGEZAL_EX_DS_B_NT_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_LHU
 */
#define BGEZAL_EX_DS_F_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_LHU
 */
#define BGEZAL_EX_DS_F_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_LHU
 */
#define BGEZAL_EX_DS_B_T_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_LHU
 */
#define BGEZAL_EX_DS_B_NT_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_LW
 */
#define BGEZAL_EX_DS_F_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_LW
 */
#define BGEZAL_EX_DS_F_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_LW
 */
#define BGEZAL_EX_DS_B_T_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_LW
 */
#define BGEZAL_EX_DS_B_NT_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_SH
 */
#define BGEZAL_EX_DS_F_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_SH
 */
#define BGEZAL_EX_DS_F_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_SH
 */
#define BGEZAL_EX_DS_B_T_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_SH
 */
#define BGEZAL_EX_DS_B_NT_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_SW
 */
#define BGEZAL_EX_DS_F_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_SW
 */
#define BGEZAL_EX_DS_F_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_SW
 */
#define BGEZAL_EX_DS_B_T_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_SW
 */
#define BGEZAL_EX_DS_B_NT_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_RI
 */
#define BGEZAL_EX_DS_F_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_RI
 */
#define BGEZAL_EX_DS_F_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_RI
 */
#define BGEZAL_EX_DS_B_T_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_RI
 */
#define BGEZAL_EX_DS_B_NT_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_SYSCALL
 */
#define BGEZAL_EX_DS_F_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_SYSCALL
 */
#define BGEZAL_EX_DS_F_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_SYSCALL
 */
#define BGEZAL_EX_DS_B_T_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_SYSCALL
 */
#define BGEZAL_EX_DS_B_NT_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_T_BREAK
 */
#define BGEZAL_EX_DS_F_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_F_NT_BREAK
 */
#define BGEZAL_EX_DS_F_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_T_BREAK
 */
#define BGEZAL_EX_DS_B_T_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t0, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 87
 * BGEZAL_EX_DS_B_NT_BREAK
 */
#define BGEZAL_EX_DS_B_NT_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    bgezal t2, 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_ADDI
 */
#define J_EX_DS_F_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_ADDI
 */
#define J_EX_DS_B_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_ADD
 */
#define J_EX_DS_F_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_ADD
 */
#define J_EX_DS_B_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_SUB
 */
#define J_EX_DS_F_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_SUB
 */
#define J_EX_DS_B_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_LH
 */
#define J_EX_DS_F_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_LH
 */
#define J_EX_DS_B_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_LHU
 */
#define J_EX_DS_F_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_LHU
 */
#define J_EX_DS_B_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_LW
 */
#define J_EX_DS_F_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_LW
 */
#define J_EX_DS_B_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_SH
 */
#define J_EX_DS_F_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_SH
 */
#define J_EX_DS_B_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_SW
 */
#define J_EX_DS_F_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_SW
 */
#define J_EX_DS_B_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_RI
 */
#define J_EX_DS_F_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_RI
 */
#define J_EX_DS_B_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_SYSCALL
 */
#define J_EX_DS_F_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_SYSCALL
 */
#define J_EX_DS_B_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_F_BREAK
 */
#define J_EX_DS_F_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 88
 * J_EX_DS_B_BREAK
 */
#define J_EX_DS_B_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    j 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_ADDI
 */
#define JAL_EX_DS_F_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_ADDI
 */
#define JAL_EX_DS_B_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_ADD
 */
#define JAL_EX_DS_F_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_ADD
 */
#define JAL_EX_DS_B_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_SUB
 */
#define JAL_EX_DS_F_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_SUB
 */
#define JAL_EX_DS_B_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_LH
 */
#define JAL_EX_DS_F_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_LH
 */
#define JAL_EX_DS_B_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_LHU
 */
#define JAL_EX_DS_F_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_LHU
 */
#define JAL_EX_DS_B_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_LW
 */
#define JAL_EX_DS_F_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_LW
 */
#define JAL_EX_DS_B_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_SH
 */
#define JAL_EX_DS_F_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_SH
 */
#define JAL_EX_DS_B_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_SW
 */
#define JAL_EX_DS_F_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_SW
 */
#define JAL_EX_DS_B_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_RI
 */
#define JAL_EX_DS_F_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_RI
 */
#define JAL_EX_DS_B_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_SYSCALL
 */
#define JAL_EX_DS_F_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_SYSCALL
 */
#define JAL_EX_DS_B_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_F_BREAK
 */
#define JAL_EX_DS_F_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1f; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 89
 * JAL_EX_DS_B_BREAK
 */
#define JAL_EX_DS_B_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    jal 1b; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_ADDI
 */
#define JR_EX_DS_F_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_ADDI
 */
#define JR_EX_DS_B_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_ADD
 */
#define JR_EX_DS_F_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_ADD
 */
#define JR_EX_DS_B_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_SUB
 */
#define JR_EX_DS_F_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_SUB
 */
#define JR_EX_DS_B_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_LH
 */
#define JR_EX_DS_F_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_LH
 */
#define JR_EX_DS_B_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_LHU
 */
#define JR_EX_DS_F_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_LHU
 */
#define JR_EX_DS_B_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_LW
 */
#define JR_EX_DS_F_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_LW
 */
#define JR_EX_DS_B_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_SH
 */
#define JR_EX_DS_F_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_SH
 */
#define JR_EX_DS_B_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_SW
 */
#define JR_EX_DS_F_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_SW
 */
#define JR_EX_DS_B_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_RI
 */
#define JR_EX_DS_F_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_RI
 */
#define JR_EX_DS_B_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_SYSCALL
 */
#define JR_EX_DS_F_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_SYSCALL
 */
#define JR_EX_DS_B_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_F_BREAK
 */
#define JR_EX_DS_F_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jr t5; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 90
 * JR_EX_DS_B_BREAK
 */
#define JR_EX_DS_B_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jr t5; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_ADDI
 */
#define JALR_EX_DS_F_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_ADDI
 */
#define JALR_EX_DS_B_ADDI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    addi s4, t0, 0x7fff; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_ADD
 */
#define JALR_EX_DS_F_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_ADD
 */
#define JALR_EX_DS_B_ADD \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    add  s4, t0, t1; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_SUB
 */
#define JALR_EX_DS_F_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_SUB
 */
#define JALR_EX_DS_B_SUB \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    sub  s4, t0, t2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_LH
 */
#define JALR_EX_DS_F_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_LH
 */
#define JALR_EX_DS_B_LH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    lh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_LHU
 */
#define JALR_EX_DS_F_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_LHU
 */
#define JALR_EX_DS_B_LHU \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    lhu  s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_LW
 */
#define JALR_EX_DS_F_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_LW
 */
#define JALR_EX_DS_B_LW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    lw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_SH
 */
#define JALR_EX_DS_F_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_SH
 */
#define JALR_EX_DS_B_SH \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    sh   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_SW
 */
#define JALR_EX_DS_F_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_SW
 */
#define JALR_EX_DS_B_SW \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    sw   s4, 0x3(t2); \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_RI
 */
#define JALR_EX_DS_F_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_RI
 */
#define JALR_EX_DS_B_RI \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    .word 0x6f76e210; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_SYSCALL
 */
#define JALR_EX_DS_F_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_SYSCALL
 */
#define JALR_EX_DS_B_SYSCALL \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    syscall; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_F_BREAK
 */
#define JALR_EX_DS_F_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1f; \
    jalr t5; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2

/* 91
 * JALR_EX_DS_B_BREAK
 */
#define JALR_EX_DS_B_BREAK \
    .set noreorder; \
    addu s0, zero, zero; \
    addu s2, zero, zero; \
    li t0, 0x7fffffff; \
    li t1, 0x7fffffff; \
    li t2, 0x8002fff0; \
    sw t0, 0x0(t2); \
    b 2f; \
    nop; \
1:; \
    addiu s2, s2, 0x2222; \
    b 1f; \
    nop; \
2:; \
    addiu s0, s0, 0x1111; \
    la t5, 1b; \
    jalr t5; \
    break; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
    addiu s0, s0, 2; \
1:; \
    addu s2, s0, s2
