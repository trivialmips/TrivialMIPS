`ifndef CPU_DEFS_SVH
`define CPU_DEFS_SVH


/*
	This header defines data structures and constants used in CPU internally
*/

`include "common_defs.svh"


// register access
typedef struct packed {
	Bit_t     we;
	RegAddr_t waddr;
	Word_t    wdata;
} RegWriteReq_t;

typedef struct packed {
	Bit_t        we;
	DoubleWord_t hilo;
} HiloWriteReq_t;

// memory access
typedef struct packed {
	// READ  if ce = 1 and we = 0
	// WRITE if ce = 1 and we = 1
	Bit_t       ce;
	Bit_t       we;
	logic [3:0] sel;
	MemAddr_t   addr;
	Word_t      wdata;
} MemAccessReq_t;

// stall
typedef struct packed {
	Bit_t hold_pc;
	Bit_t stall_if; 
	Bit_t stall_id;
	Bit_t stall_ex;
	Bit_t stall_mem;
	Bit_t stall_wb;  // not used
} Stall_t;

// CP0 registers
typedef struct packed {
	logic cu3, cu2, cu1, cu0;
	logic rp, fr, re, mx;
	logic px, bev, ts, sr;
	logic nmi, zero;
	logic [1:0] impl;
	logic [7:0] im;
	logic kx, sx, ux, um;
	logic r0, erl, exl, ie;
} CP0StatusReg_t;

typedef struct packed {
	logic bd, zero30;
	logic [1:0] ce;
	logic [3:0] zero27_24;
	logic iv, wp;
	logic [5:0] zero21_16;
	logic [7:0] ip;
	logic zero7;
	logic [4:0] exc_code;
	logic [1:0] zero1_0;
} CP0CauseReg_t;

typedef struct packed {
	/* The order of the following registers is important.
	 * DO NOT change them. New registers must be added 
	 * BEFORE this comment */
	/* primary 32 registers (sel = 0) */
	Word_t 
	 desave,    error_epc,  tag_hi,     tag_lo,    
	 cache_err, err_ctl,    perf_cnt,   depc,      
	 debug,     reserved22, reserved21, reserved20,
	 watch_hi,  watch_lo,   ll_addr,    config0,   
	 prid,      epc;
	CP0CauseReg_t  cause;
	CP0StatusReg_t status;
	Word_t
	 compare,   entry_hi,   count,      bad_vaddr, 
	 reserved7, wired,      page_mask,  context_,  
	 entry_lo1, entry_lo0,  random,     index;
} CP0Regs_t;

`define CP0_REG_COUNT    5'd9
`define CP0_REG_COMPARE  5'd11
`define CP0_REG_STATUS   5'd12
`define CP0_REG_CAUSE    5'd13

// exception
typedef struct packed {
	Bit_t occur, eret;
	logic [4:0] code;
} ExceptInfo_t;

typedef struct packed {
	Bit_t flush, delayslot, eret;
	logic [4:0] code;
	InstAddr_t cur_pc, jump_pc;
} ExceptReq_t;

/* cause register exc_code field */
`define EXCCODE_TR  5'h0d  // trap exception

// operation
typedef enum {
	OP_NOP,
	OP_MTHI, OP_MTLO, OP_MFHI, OP_MFLO,
	OP_ORI,
	OP_MADDU,
	OP_J, OP_JAL,
	OP_LW, OP_SW,
	OP_MFC0, OP_MTC0, OP_ERET,
	OP_TEQI,
	OP_INVALID
} Oper_t;

`endif
