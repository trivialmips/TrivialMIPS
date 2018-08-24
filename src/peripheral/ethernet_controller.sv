`include "common_defs.svh"

module ethernet_controller(
    Bus_if.slave data_bus,
    Ethernet_if.master ethernet
);

    wire bus_clk, clk, rst;
    assign bus_clk = data_bus.clk.base;
    assign clk = data_bus.clk.base_2x;
    assign rst = data_bus.clk.rst;

    `REGISTER_IRQ(ETHERNET, ethernet.intr, data_bus.interrupt)

    assign ethernet.pwrst_n = ~rst;
    // cmd is 1 when using data, vise versa
    assign ethernet.cmd = data_bus.address[0];

    logic write;
    HalfWord_t data_to_write;
    assign ethernet.sd = write ? data_to_write : `HIGHZ_HWORD;

    // it is safe to wait for 4 cycles after read / write, when bus_clk is at 40MHz or slower
    `define WAIT_CYCLES 5

    typedef enum {
        STATE_RESET,
        STATE_IDLE,
        STATE_WRITE,
        STATE_READ,
        STATE_WAIT_[`WAIT_CYCLES]
    } EthernetState_t;

    `undef WAIT_CYCLES

    EthernetState_t currentState;

`define GEN_WAIT_STATE(NAME, A, B) NAME``_``A: begin \
    currentState <= NAME``_``B; \
end \

`define GEN_WAIT_STATES(NAME) `GEN_WAIT_STATE(NAME, 0, 1)\
`GEN_WAIT_STATE(NAME, 1, 2) \
`GEN_WAIT_STATE(NAME, 2, 3) \
`GEN_WAIT_STATE(NAME, 3, 4)

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            currentState <= STATE_RESET;
        end else begin

            write <= 1'b0;
            ethernet.cs_n <= 1'b1;
            ethernet.iow_n <= 1'b1;
            ethernet.ior_n <= 1'b1;

            unique case (currentState)

                STATE_RESET: begin
                    data_to_write <= `ZERO_HWORD;
                    data_bus.data_rd <= `ZERO_WORD;
                    currentState <= STATE_IDLE;
                end

                STATE_IDLE: begin
                    if (bus_clk == ~`BUS_CLK_POSEDGE) begin
                        data_bus.stall <= data_bus.write | data_bus.read;
                        if (data_bus.write) begin
                            ethernet.cs_n <= 1'b0;
                            ethernet.iow_n <= 1'b0;
                            data_to_write <= HalfWord_t'(data_bus.data_wr);
                            write <= 1'b1;
                            currentState <= STATE_WRITE;
                        end else if (data_bus.read) begin
                            ethernet.cs_n <= 1'b0;
                            ethernet.ior_n <= 1'b0;
                            currentState <= STATE_READ;
                        end
                    end
                end

                STATE_READ: begin
                    currentState <= STATE_WAIT_0;
                    data_bus.data_rd <= {`ZERO_HWORD, ethernet.sd};
                    ethernet.cs_n <= 1'b0;
                end

                STATE_WRITE: begin
                    currentState <= STATE_WAIT_0;
                    ethernet.cs_n <= 1'b0;
                    write <= 1'b1;
                end

                `GEN_WAIT_STATES(STATE_WAIT)

                STATE_WAIT_4: begin
                    currentState <= STATE_IDLE;
                    data_bus.stall <= 1'b0;
                end

                default: begin
                    currentState <= STATE_RESET;
                end

            endcase

        end
    end

`undef GEN_WAIT_STATE
`undef GEN_WAIT_STATES

endmodule