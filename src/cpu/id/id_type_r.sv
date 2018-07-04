`include "cpu_defs.svh"

module id_type_r(
	input  [5:0]     opcode,
	input  Inst_t    inst,
	output RegAddr_t reg_raddr1,
	output RegAddr_t reg_raddr2,
	output RegAddr_t reg_waddr,
	output Bit_t     reg_we,
	output Oper_t    op
);

logic [4:0] sa;
logic [5:0] funct;
RegAddr_t rs, rd, rt;

assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];
assign sa = inst[10:6];
assign funct = inst[5:0];

always_comb
begin
	reg_raddr1 = rs;
	reg_raddr2 = rt;
	reg_waddr  = rd;
	reg_we     = 1'b1;
	case(opcode)
		6'b000000: // SPECIAL
		begin 
			reg_we = ~inst[0];
			case(inst[5:0])
			6'b010000: op = OP_MFHI;
			6'b010001: op = OP_MTHI;
			6'b010010: op = OP_MFLO;
			6'b010011: op = OP_MTLO;
			default: op = OP_INVALID;
			endcase
		end
		6'b011100: // SPECIAL2
		begin 
			reg_we = 1'b0;
			case(inst[5:0])
			6'b000001: op = OP_MADDU;
			default: op = OP_INVALID;
			endcase
		end
		6'b010000:  // COP0
		begin
			case(inst[25:21])
			5'b00000:
			begin
				op = OP_MFC0;
				reg_we     = 1'b1;
				reg_waddr  = rt;
				reg_raddr1 = 5'b0;
				reg_raddr2 = 5'b0;
			end
			5'b00100: 
			begin
				op = OP_MTC0;
				reg_we     = 1'b0;
				reg_raddr1 = 5'b0;
			end
			default: op = OP_INVALID;
			endcase
		end
		default: op = OP_INVALID;
	endcase
end

endmodule
