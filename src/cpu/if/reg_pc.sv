`include "cpu_defs.svh"

module reg_pc(
	input  clk, rst,
	input  Bit_t       hold_pc,
	input  Bit_t       inst2_taken,
	input  Bit_t       jump,
	input  InstAddr_t  jump_to,
	input  ExceptReq_t except_req,
	output Bit_t       ce,
	output Bit_t       is_ahead,
	output Bit_t       is_hard_reset,
	output InstAddr_t  pc
);

always @(posedge clk)
begin
	if(rst == 1'b1)
	begin
		ce <= 1'b0;
	end else begin
		ce <= 1'b1;
	end
end

enum logic [1:0] {
	ST_HARD_SET, ST_MATCH, ST_AHEAD
} cur_status, next_status;

assign is_ahead = (cur_status == ST_AHEAD || next_status == ST_AHEAD);
assign is_hard_reset = (cur_status == ST_HARD_SET);

always_comb
begin
	if(hold_pc)
	begin
		next_status = cur_status;
	end else if(ce == 1'b0 || except_req.flush || jump) begin
		next_status = ST_HARD_SET;
	end else begin
		case(cur_status)
			ST_HARD_SET: next_status = ST_MATCH;
			ST_MATCH: next_status = inst2_taken ? ST_MATCH : ST_AHEAD;
			ST_AHEAD: next_status = ST_AHEAD;
			default: next_status = ST_HARD_SET;
		endcase
	end
end

always @(posedge clk)
begin
	if(rst)
	begin
		cur_status <= ST_HARD_SET;
	end else begin
		cur_status <= next_status;
	end
end

always @(posedge clk)
begin
	if (ce == 1'b0)
	begin
		pc <= `PC_RESET_VECTOR;
	end else if(except_req.flush) begin
		pc <= except_req.jump_pc;
	end else if(~hold_pc) begin
		if(jump)
		begin
			pc <= jump_to;
		end else if(cur_status == ST_HARD_SET || inst2_taken) begin
			pc <= pc + 32'h8;
		end else begin
			pc <= pc + 32'h4;
		end
	end
end

endmodule
