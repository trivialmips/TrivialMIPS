`ifndef CPU_DEFS_SVH
`define CPU_DEFS_SVH

// project configuration
`default_nettype wire
`timescale 1ns / 1ps

// data formats
typedef logic           Bit_t;
typedef logic [7:0]     Byte_t;
typedef logic [15:0]    HalfWord_t;
typedef logic [31:0]    Word_t;
typedef logic [63:0]    DoubleWord_t;

`define ZERO_BYTE       8'h0;
`define ZERO_HWORD      16'h0;
`define ZERO_WORD       32'h0;
`define ZERO_DWORD      64'h0;

// instructions
`define INST_WIDTH      32
`define INST_ADDR_WIDTH 32
typedef Word_t                         Inst_t;
typedef logic [`INST_ADDR_WIDTH - 1:0] InstAddr_t;

// register
`define REG_NUM        32
`define REG_ADDR_WIDTH 5
`define REG_DATA_WIDTH 32
typedef logic [`REG_ADDR_WIDTH - 1:0] RegAddr_t;

// memory
typedef Word_t  MemAddr_t;

// bus
typedef struct packed {
	Word_t addr, data;
	logic [3:0] sel;
	logic we, stb, cyc;
} WishboneReq_t;

typedef struct packed {
	Word_t data;
	logic ack;
} WishboneRes_t;

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
	/* The order of the following registers is important.
	 * DO NOT change them. New registers must be added 
	 * BEFORE this comment */
	Word_t 
	// primary 32 registers (sel = 0)
	 desave,    error_epc,  tag_hi,     tag_lo,    
	 cache_err, err_ctl,    perf_cnt,   depc,      
	 debug,     reserved22, reserved21, reserved20,
	 watch_hi,  watch_lo,   ll_addr,    config0,   
	 prid,      epc,        cause,      status,    
	 compare,   entry_hi,   count,      bad_vaddr, 
	 reserved7, wired,      page_mask,  context_,  
	 entry_lo1, entry_lo0,  random,     index;
} CP0Regs_t;

`define CP0_REG_COUNT  5'd9
`define CP0_REG_COMPARE  5'd11

// exception
typedef struct packed {
	Bit_t occur;
	Bit_t delayslot;
	logic [4:0] code;
} ExceptInfo_t;

typedef struct packed {
	Bit_t flush;
	logic [4:0] code;
	InstAddr_t ret_pc, jump_pc;
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
	OP_MFC0, OP_MTC0,
	OP_INVALID
} Oper_t;

`endif
