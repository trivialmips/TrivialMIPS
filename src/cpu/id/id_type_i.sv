`include "cpu_defs.svh"

module id_type_i(
	input  [5:0]     opcode,
	input  Inst_t    inst,
	output Oper_t    op,
	output RegAddr_t reg_raddr1,
	output RegAddr_t reg_raddr2,
	output RegAddr_t reg_waddr,
	output Bit_t     reg_we,
	output Bit_t     unsigned_imm
);

assign unsigned_imm = (opcode == 6'b001101);

RegAddr_t rs, rt;
assign rs = inst[25:21];
assign rt = inst[20:16];

always_comb
begin
	reg_raddr1 = rs;
	reg_raddr2 = 5'b0;
	reg_waddr  = rt;
	reg_we     = 1'b1;
	case(opcode)
		6'b000001: // REGIMM
		begin
			reg_we = 1'b0;
			case(inst[20:16])
			5'b01100: op = OP_TEQI;
			default: op = OP_INVALID;
			endcase
		end
		6'b001101: op = OP_ORI;
		6'b101011: 
		begin
			op = OP_SW;
			reg_we = 1'b0;
			reg_raddr1 = 5'b0;
			reg_raddr2 = rt;
		end
		6'b100011: op = OP_LW;
		default: op = OP_INVALID;
	endcase
end

endmodule
