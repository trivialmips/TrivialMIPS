`include "cpu_defs.svh"

module branch(
	input  rst,
	input  PipelineData_t data_id,
	input  [7:0]      fpu_fcc,

	output Bit_t      is_branch,
	output Bit_t      jump,
	output InstAddr_t jump_to
);

InstAddr_t pc;
Inst_t inst;
Word_t reg1, reg2;
assign pc = data_id.pc;
assign inst = data_id.inst;
assign reg1 = data_id.reg1;
assign reg2 = data_id.reg2;

logic [5:0] opcode;
logic [25:0] instr_index;
logic [15:0] offset;

assign opcode = inst[31:26];
assign instr_index = inst[25:0];
assign offset = inst[15:0];

InstAddr_t pc_plus4, pc_plus8;
InstAddr_t default_jump_j, default_jump_i;
assign pc_plus4     = pc + 32'd4;
assign pc_plus8     = pc + 32'd8;
assign default_jump_i = pc_plus4 + { {14{offset[15]}}, offset, 2'b0 };
assign default_jump_j = { pc_plus4[31:28], instr_index, 2'b0 };

Bit_t reg_equal;
assign reg_equal = (reg1 == reg2);

always_comb
begin
	if(rst)
	begin
		is_branch = 1'b0;
		jump      = 1'b0;
		jump_to   = `ZERO_WORD;
	end else begin
		case(opcode)
			6'b000000: // SPECIAL
			begin
				// JR (001000), JALR (001001)
				is_branch = (inst[5:1] == 5'b00100);
				jump      = is_branch;
				jump_to   = reg1;  // TODO: raise 'Address Error' when not aligned
			end
			6'b000001: // REGIMM
			begin
				/* In this case, only four jump instructions,
				 * BLTZ (00000), BGEZ (00001), BLTZAL (10000), BGEZAL(10001)
				 * the instructions are determined by inst[20:16].
				 * Whether to jump can be determined by only the sign bit */
				is_branch = (inst[19:17] == 3'b0);
				jump = (reg1[31] ^ inst[16]) & is_branch;
				jump_to = default_jump_i;
			end
			// BEQ (000100), BNE (000101)
			//    6'b000100: jump = (reg1 == reg2);
			//    6'b000101: jump = (reg1 != reg2);
			// BLEZ (000110), BGTZ (000111),
			// Note that in these two cases, reg2 = `ZERO_WORD
			//    6'b000110: jump = (reg1[31] || (reg1 == `ZERO_WORD));
			//    6'b000111: jump = (~reg1[31] && (reg1 != `ZERO_WORD));
			6'b000100, 6'b000101, 6'b000110, 6'b000111: begin
				is_branch = 1'b1;
				jump = ((reg1[31] & opcode[1]) | reg_equal) ^ opcode[0];
				jump_to = default_jump_i;
			end
			6'b000010, 6'b000011: begin // J, JAL
				is_branch = 1'b1;
				jump      = 1'b1;
				jump_to   = default_jump_j;
			end
			6'b010001: begin // COP1
				if(inst[25:21] == 5'b01000 && ~inst[17])
				begin
					is_branch = 1'b1;
					jump      = (fpu_fcc[inst[20:18]] == inst[16]);
					jump_to   = default_jump_i;
				end else begin
					is_branch = 1'b0;
					jump      = 1'b0;
					jump_to   = `ZERO_WORD;
				end
			end
			default: begin
				is_branch = 1'b0;
				jump      = 1'b0;
				jump_to   = `ZERO_WORD;
			end
		endcase
	end
end

endmodule
