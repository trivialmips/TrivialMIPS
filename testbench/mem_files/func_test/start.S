#/*	$Id: start.S,v 1.1.1.1 2006/09/14 01:59:08 root Exp $ */

/*
 * Copyright (c) 2001 Opsycon AB  (www.opsycon.se)
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by Opsycon AB, Sweden.
 * 4. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 */

#ifndef _KERNEL
#define _KERNEL
#endif

#ifdef SIM
#define WAIT_COUNT 00000001
#else
    #ifndef TEST_DELAY_RAM
    #define WAIT_COUNT 11000000
    #else
    #define WAIT_COUNT 05000000
    #endif
#endif

#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <asm/context.h>

#define LED_ADDR                0xA6000008
#define NUM_ADDR                0xA6000004

    .section .text
	.set	noreorder
	.globl	_start
	.globl	start
	.globl	__main
#   .set noat
_start:
start:
    la  a2,ebase_entry
    mtc0  a2, c0_ebase  /* set base address of the exception vectors */
	mtc0	zero, c0_status /* set BEV=0 */
	mtc0	zero, c0_cause
	# la	sp, _stack
	# la	gp, _gp
    ori a3,zero,0x0000
    mtlo a3
    ori t8,zero,0x0000
    mthi t8

	j	locate			/* Get current execute address */
	nop

    .section .text.ebase
ebase_entry:
/*
 *  TLB Refill exception handle, at CP0_Ebase + 0x0
 */
.org 0x0
    lui v1, 0xffe8
    ori v1, 0xdc03
    beq v0, v1, tlbwr_ex
    nop
    lui v1, 0xefe8
    ori v1, 0xdc03
    beq v0, v1, tlbwi_ex
    nop

/*
 *  other exception handle, at CP0_Ebase + 0x180
 */
.org 0x180
    li  v1, 0x01 # syscall
    beq v0, v1, syscall_ex
    nop
    li  v1, 0x02 # break
    beq v0, v1, break_ex
    nop
    li  v1, 0x03 # eret
    beq v0, v1, eret_ex
    nop
    li  v1, 0x04 # overflow
    beq v0, v1, overflow_ex
    nop
    li  v1, 0x05 # adel(load)
    beq v0, v1, adel_load_ex
    nop
    li  v1, 0x06 # ades
    beq v0, v1, ades_ex
    nop
    li  v1, 0x07 # adel(inst fetch)
    beq v0, v1, adel_if_ex
    nop
    li  v1, 0x08 # reserved inst
    beq v0, v1, reserved_inst_ex
    nop
    li  v1, 0x09 # delay slot
    beq v0, v1, delay_slot_ex
    nop
    b other_ex
    nop
syscall_ex:
    addu  v0, zero, zero
    mfc0 k0, c0_epc
    la   k1, syscall_pc
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2
    li   k1, 0x20 # 010_00
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02
    li   k1, 0x02
    bne  k0, k1, other_ex
    nop
    lui  v0, 0x00ff
    b other_ex
    nop
break_ex:
    addu  v0, zero, zero
    mfc0 k0, c0_epc
    la   k1, break_pc
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2
    li   k1, 0x24 # 010_0100
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li   k1, 0x02 # exl = 1
    bne  k0, k1, other_ex
    nop
    lui  v0, 0xff00
    b other_ex
    nop
eret_ex:
    la  k0, eret_ret_pc
    mtc0 k0, c0_epc
    lui  v0, 0x0f0f
    b other_ex
    nop
overflow_ex:
    addu v0, zero, zero
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x30 # 011_0000
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, other_ex
    nop
    lui v0, 0x1234
    b other_ex
    nop
adel_load_ex:
    addu v0, zero, zero
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x10 # 001_0000
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, other_ex
    nop
    lui v0, 0x5678
    b other_ex
    nop
ades_ex:
    addu v0, zero, zero
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x14 # 001_0100
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, other_ex
    nop
    lui v0, 0x1111
    b other_ex
    nop
adel_if_ex:
    addu v0, zero, zero
    mtc0 k1, c0_epc
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x10 # 001_0000
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, other_ex
    nop
    lui v0, 0x2222
    b other_ex
    nop
reserved_inst_ex:
    addu v0, zero, zero
    mfc0 k0, c0_cause
    andi k0, k0, 0x7c # 6..2 exc code
    li   k1, 0x28 # 010_1000
    bne  k0, k1, other_ex
    nop
    mfc0 k0, c0_status
    andi k0, k0, 0x02 # exl
    li k1, 0x02 # exl = 1
    bne k0, k1, other_ex
    nop
    lui v0, 0x3333
    b other_ex
    nop
delay_slot_ex:
    addu v0, zero, zero
    mfc0 k0, c0_cause
    lui k1, 0x8000
    and k0, k0, k1
    bne k0, k1, other_ex
    nop
    lui v0, 0x4444
other_ex:
    mfc0 k0,c0_cause
    mfc0 v1,c0_epc
    lui k1,0x8000
    addiu v1,v1,0x4
    and k0,k0,k1
    beq k0,zero, 1f
    nop
    addiu v1,v1,0x4
1:
    mtc0  v1,c0_epc
    bne v0, zero, ex_ret
    nop
    lui v0, 0xffff
ex_ret:
    .set mips32
    eret
    .set mips1
    nop
    nop
    nop
tlbwr_ex:
    li v1, 0x1
    beq k0, v1, tlbwr_allbit
    nop
    li v1, 0x3
    beq k0, v1, tlbwr_asid
    nop
    addiu t0, 0x0001
    addiu t1, 0x0001
    addiu k0, 0x0001
    j tlbwr_return
    nop
tlbwr_allbit:
    ori t0, 0x7
    ori t1, 0x7
    j tlbwr_return
    nop
tlbwr_asid:
    j tlbwr_return
    nop
tlbwr_return:
    mtc0 s0, c0_entryhi
    mtc0 t0, c0_entrylo0
    mtc0 t1, c0_entrylo1
    tlbwr
    lui v1, 0xed08
    ori v1, 0xdc15
    add v1, v1, k0
    .set mips32
    eret
    .set mips1
tlbwi_ex:
    mfc0 v1, c0_badvaddr
    lui a1, 0xffff
    ori a1, 0xe000
    and v1, a1, v1
    mtc0 v1, c0_entryhi
    li v1, 0x4007
    mtc0 v1, c0_entrylo0
    li v1, 0x4007
    mtc0 v1, c0_entrylo1
    tlbwi
    lui v1, 0xed12
    ori v1, 0x5678
    .set mips32
    eret
    .set mips1
    nop

    .section .text
locate:
	.set noreorder

    li t1, 0x0000ffff
    li $23, LED_ADDR
    sw t1, 0($23)

    li s1, NUM_ADDR
    lui s3, 0
    sw s3, 0(s1)
inst_test:
    jal n1_add_test   #add
    nop
    jal wait_1s
    nop
    jal n2_addi_test  #addi
    nop
    jal wait_1s
    nop
    jal n3_addu_test  #addu
    nop
    jal wait_1s
    nop
    jal n4_addiu_test    #addiu
    nop
    jal wait_1s
    nop
    jal n5_sub_test      #sub
    nop
    jal wait_1s
    nop
    jal n6_subu_test     #subu
    nop
    jal wait_1s
    nop
    jal n7_slt_test      #slt
    nop
    jal wait_1s
    nop
    jal n8_slti_test     #slti
    nop
    jal wait_1s
    nop
    jal n9_sltu_test     #sltu
    nop
    jal wait_1s
    nop
    jal n10_sltiu_test   #sltiu
    nop
    jal wait_1s
    nop
    jal n11_div_test     #div
    nop
    jal wait_1s
    nop
    jal n12_divu_test    #divu
    nop
    jal wait_1s
    nop
    jal n13_mult_test    #mult
    nop
    jal wait_1s
    nop
    jal n14_multu_test   #multu
    nop
    jal wait_1s
    nop
    jal n15_and_test     #and
    nop
    jal wait_1s
    nop
    jal n16_andi_test    #andi
    nop
    jal wait_1s
    nop
    jal n17_lui_test     #lui
    nop
    jal wait_1s
    nop
    jal n18_nor_test     #nor
    nop
    jal wait_1s
    nop
    jal n19_or_test      #or
    nop
    jal wait_1s
    nop
    jal n20_ori_test     #ori
    nop
    jal wait_1s
    nop
    jal n21_xor_test     #xor
    nop
    jal wait_1s
    nop
    jal n22_xori_test    #xori
    nop
    jal wait_1s
    nop
    jal n23_sll_test     #sll
    nop
    jal wait_1s
    nop
    jal n24_sllv_test    #sllv
    nop
    jal wait_1s
    nop
    jal n25_sra_test     #sra
    nop
    jal wait_1s
    nop
    jal n26_srav_test    #srav
    nop
    jal wait_1s
    nop
    jal n27_srl_test     #srl
    nop
    jal wait_1s
    nop
    jal n28_srlv_test    #srlv
    nop
    jal wait_1s
    nop
    jal n29_beq_test     #beq
    nop
    jal wait_1s
    nop
    jal n30_bne_test     #bne
    nop
    jal wait_1s
    nop
    jal n31_bgez_test    #bgez
    nop
    jal wait_1s
    nop
    jal n32_bgtz_test    #bgtz
    nop
    jal wait_1s
    nop
    jal n33_blez_test    #blez
    nop
    jal wait_1s
    nop
    jal n34_bltz_test    #bltz
    nop
    jal wait_1s
    nop
    jal n35_bltzal_test   #bltzal
    nop
    jal wait_1s
    nop
    jal n36_bgezal_test  #bgezal
    nop
    jal wait_1s
    nop
    jal n37_j_test       #j
    nop
    jal wait_1s
    nop
    jal n38_jal_test     #jal
    nop
    jal wait_1s
    nop
    jal n39_jr_test      #jr
    nop
    jal wait_1s
    nop
    jal n40_jalr_test    #jalr
    nop
    jal wait_1s
    nop
    jal n41_mfhi_test    #mfhi
    nop
    jal wait_1s
    nop
    jal n42_mflo_test    #mflo
    nop
    jal wait_1s
    nop
    jal n43_mthi_test    #mthi
    nop
    jal wait_1s
    nop
    jal n44_mtlo_test    #mtlo
    nop
    jal wait_1s
    nop
    jal n45_break_test   #break
    nop
    jal wait_1s
    nop
    jal n46_syscall_test #syscall
    nop
    jal wait_1s
    nop
    jal n47_lb_test      #lb
    nop
    jal wait_1s
    nop
    jal n48_lbu_test     #lbu
    nop
    jal wait_1s
    nop
    jal n49_lh_test      #lh
    nop
    jal wait_1s
    nop
    jal n50_lhu_test     #lhu
    nop
    jal wait_1s
    nop
    jal n51_lw_test      #lw
    nop
    jal wait_1s
    nop
    jal n52_sb_test      #sb
    nop
    jal wait_1s
    nop
    jal n53_sh_test      #sh
    nop
    jal wait_1s
    nop
    jal n54_sw_test      #sw
    nop
    jal wait_1s
    nop
    jal n55_eret_test    #eret
    nop
    jal wait_1s
    nop
    jal n56_mfc0_test    #mfc0
    nop
    jal wait_1s
    nop
    jal n57_mtc0_test    #mtc0
    nop
    jal wait_1s
    nop
 #ex
    la v0, n58_add_ex_test    #add_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n59_addi_ex_test    #addi_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n60_sub_ex_test    #sub_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n61_lh_ex_test    #lh_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n62_lhu_ex_test    #lhu_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n63_lw_ex_test    #lw_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n64_sh_ex_test    #sh_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n65_sw_ex_test    #sw_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n66_eret_ex_test    #adel_if_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n67_reserved_instruction_ex_test    #ri_ex
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n68_beq_ds_test     #beq_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n69_bne_ds_test     #bne_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n70_bgez_ds_test    #bgez_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n71_bgtz_ds_test    #bgtz_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n72_blez_ds_test    #blez_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n73_bltz_ds_test    #bltz_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n74_bltzal_ds_test   #bltzal_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n75_bgezal_ds_test  #bgezal_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n76_j_ds_test       #j_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n77_jal_ds_test     #jal_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n78_jr_ds_test      #jr_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n79_jalr_ds_test    #jalr_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n80_beq_ex_ds_test     #beq_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n81_bne_ex_ds_test     #bne_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n82_bgez_ex_ds_test    #bgez_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n83_bgtz_ex_ds_test    #bgtz_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n84_blez_ex_ds_test    #blez_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n85_bltz_ex_ds_test    #bltz_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n86_bltzal_ex_ds_test   #bltzal_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n87_bgezal_ex_ds_test  #bgezal_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n88_j_ex_ds_test       #j_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n89_jal_ex_ds_test     #jal_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n90_jr_ex_ds_test      #jr_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n91_jalr_ex_ds_test    #jalr_ds
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n92_tlbwi_test    #tlbwi_test
    jalr v0
    nop
    jal wait_1s
    nop
    la v0, n93_tlbwr_test    #tlbwr_test
    jalr v0
    nop
    jal wait_1s
    nop


test_end:
    li  a0, 0x5d
    beq a0, s3, 1f
    nop

    b  2f
    nop
1:

    li t0, LED_ADDR
    sw zero, 0(t0)

2:  b 2b
    nop

wait_1s:
#    li t0, 11000000
    li t0, WAIT_COUNT
1:
    addiu t0, -1
    bne t0,zero, 1b
    nop
    jr ra
    nop
