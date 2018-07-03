`include "cpu_defs.svh"

module branch(
	input  rst,
	input  InstAddr_t pc,
	input  Inst_t     inst,
	input  Word_t     reg1,
	input  Word_t     reg2,

	output Bit_t      is_branch,
	output Bit_t      jump,
	output InstAddr_t jump_to
);

logic [5:0] opcode;
logic [25:0] instr_index;

assign opcode = inst[31:26];
assign instr_index = inst[25:0];

InstAddr_t pc_plus4, pc_plus8;
InstAddr_t default_jump;
assign pc_plus4     = pc + 32'd4;
assign pc_plus8     = pc + 32'd8;
assign default_jump = { pc_plus4[31:28], instr_index, 2'b0 };

always_comb
begin
	if(rst)
	begin
		is_branch = 1'b0;
		jump      = 1'b0;
		jump_to   = `ZERO_WORD;
	end else begin
		case(opcode)
			6'b000010,       // J
			6'b000011: begin // JAL
				is_branch = 1'b1;
				jump      = 1'b1;
				jump_to   = default_jump;
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
