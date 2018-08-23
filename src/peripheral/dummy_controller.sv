`include "common_defs.svh"

module dummy_controller(
    Bus_if.slave data_bus
);

    assign data_bus.interrupt = 6'b0;
    assign data_bus.stall = 1'b0;
    assign data_bus.data_rd = `ZERO_WORD;

endmodule