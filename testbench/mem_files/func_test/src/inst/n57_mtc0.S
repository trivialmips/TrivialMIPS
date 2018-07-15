#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <machine.h>
#include <ns16550.h>
#include <asm/context.h>
#include <inst_test.h>

LEAF(n57_mtc0_test)
    .set noreorder
    lui  a0, 0x3900
    li  v0, 0x0
###test inst
    li t0, 0xbfc0ffff
#test badvaddr
#   mfc0 t1, c0_badvaddr
#   mtc0 t0, c0_badvaddr
#   mfc0 s0, c0_badvaddr
#   mtc0 t1, c0_badvaddr
#   bne t0, s0, inst_error
#   nop
#test status
    mfc0 t1, c0_status
    mtc0 t1, c0_status
#test cause
    mfc0 t1, c0_cause
    mtc0 t1, c0_cause
#test epc
    mfc0 t1, c0_epc
    mtc0 t0, c0_epc
    mfc0 s0, c0_epc
    mtc0 t1, c0_epc
    bne t0, s0, inst_error
    nop
###detect exception
    bne v0, zero, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output a0|s3
inst_error:  
    or t0, a0, s3 
    sw t0, 0(s1)
    jr ra
    nop
END(n57_mtc0_test)
