`ifndef CPU_DEFS_SVH
`define CPU_DEFS_SVH

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

typedef struct packed {
	Bit_t     we;
	RegAddr_t waddr;
	Word_t    wdata;
} RegWriteReq_t;

typedef struct packed {
	Bit_t        we;
	DoubleWord_t hilo;
} HiloWriteReq_t;

// stall
typedef struct packed {
	Bit_t hold_pc;
	Bit_t stall_if; 
	Bit_t stall_id;
	Bit_t stall_ex;
	Bit_t stall_mem;
	Bit_t stall_wb;  // not used
} Stall_t;

// operation
typedef enum {
	OP_NOP,
	OP_MTHI, OP_MTLO, OP_MFHI, OP_MFLO,
	OP_ORI,
	OP_J, OP_JAL,
	OP_INVALID
} Oper_t;

`endif
