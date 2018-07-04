`include "cpu_defs.svh"

module except(
	input  rst,
	input  InstAddr_t    pc,
	input  ExceptInfo_t  except,
	output ExceptReq_t   except_req,
	output RegWriteReq_t cp0_reg_wr
);

assign cp0_reg_wr.we = 1'b0;

endmodule
