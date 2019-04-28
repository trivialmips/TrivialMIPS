`include "cpu_defs.svh"

module ex_ext(
	input  [31:0] inst,
	input  [31:0] in,
	output [31:0] out
);

logic [4:0] lsb;
logic [31:0] ret;
assign out = ret;
assign lsb = inst[10:6];

always_comb
begin
	ret = 32'b0;
	case(inst[15:11])
		5'd0: ret = in[lsb +: 1];
		5'd1: ret = in[lsb +: 2];
		5'd2: ret = in[lsb +: 3];
		5'd3: ret = in[lsb +: 4];
		5'd4: ret = in[lsb +: 5];
		5'd5: ret = in[lsb +: 6];
		5'd6: ret = in[lsb +: 7];
		5'd7: ret = in[lsb +: 8];
		5'd8: ret = in[lsb +: 9];
		5'd9: ret = in[lsb +: 10];
		5'd10: ret = in[lsb +: 11];
		5'd11: ret = in[lsb +: 12];
		5'd12: ret = in[lsb +: 13];
		5'd13: ret = in[lsb +: 14];
		5'd14: ret = in[lsb +: 15];
		5'd15: ret = in[lsb +: 16];
		5'd16: ret = in[lsb +: 17];
		5'd17: ret = in[lsb +: 18];
		5'd18: ret = in[lsb +: 19];
		5'd19: ret = in[lsb +: 20];
		5'd20: ret = in[lsb +: 21];
		5'd21: ret = in[lsb +: 22];
		5'd22: ret = in[lsb +: 23];
		5'd23: ret = in[lsb +: 24];
		5'd24: ret = in[lsb +: 25];
		5'd25: ret = in[lsb +: 26];
		5'd26: ret = in[lsb +: 27];
		5'd27: ret = in[lsb +: 28];
		5'd28: ret = in[lsb +: 29];
		5'd29: ret = in[lsb +: 30];
		5'd30: ret = in[lsb +: 31];
		default: ret = 32'b0;
	endcase
end
endmodule

module ex_ins(
	input  [31:0] inst,
	input  [31:0] in1,
	input  [31:0] in2,
	output [31:0] out
);

logic [4:0] lsb;
logic [4:0] size;
logic [31:0] ret;
assign out = ret;
assign lsb = inst[10:6];
assign size = inst[15:11] - lsb;

always_comb
begin
	ret = in2;
	case(size)
		5'd0: ret[lsb] = in1[0];
		5'd1: ret[lsb +: 2] = in1[1:0];
		5'd2: ret[lsb +: 3] = in1[2:0];
		5'd3: ret[lsb +: 4] = in1[3:0];
		5'd4: ret[lsb +: 5] = in1[4:0];
		5'd5: ret[lsb +: 6] = in1[5:0];
		5'd6: ret[lsb +: 7] = in1[6:0];
		5'd7: ret[lsb +: 8] = in1[7:0];
		5'd8: ret[lsb +: 9] = in1[8:0];
		5'd9: ret[lsb +: 10] = in1[9:0];
		5'd10: ret[lsb +: 11] = in1[10:0];
		5'd11: ret[lsb +: 12] = in1[11:0];
		5'd12: ret[lsb +: 13] = in1[12:0];
		5'd13: ret[lsb +: 14] = in1[13:0];
		5'd14: ret[lsb +: 15] = in1[14:0];
		5'd15: ret[lsb +: 16] = in1[15:0];
		5'd16: ret[lsb +: 17] = in1[16:0];
		5'd17: ret[lsb +: 18] = in1[17:0];
		5'd18: ret[lsb +: 19] = in1[18:0];
		5'd19: ret[lsb +: 20] = in1[19:0];
		5'd20: ret[lsb +: 21] = in1[20:0];
		5'd21: ret[lsb +: 22] = in1[21:0];
		5'd22: ret[lsb +: 23] = in1[22:0];
		5'd23: ret[lsb +: 24] = in1[23:0];
		5'd24: ret[lsb +: 25] = in1[24:0];
		5'd25: ret[lsb +: 26] = in1[25:0];
		5'd26: ret[lsb +: 27] = in1[26:0];
		5'd27: ret[lsb +: 28] = in1[27:0];
		5'd28: ret[lsb +: 29] = in1[28:0];
		5'd29: ret[lsb +: 30] = in1[29:0];
		5'd30: ret[lsb +: 31] = in1[30:0];
		default: ret = in1;
	endcase
end
endmodule
