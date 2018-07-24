`include "common_defs.svh"

module usb_controller(
    Bus_if.slave    data_bus,
    USB_if.master   usb
);

    // read requires 55ns, write requires 90ns
    // it is safe to wait for 3 cycles both, when bus_clk is at 40MHz or slower
    `define WAIT_CYCLES 4 

    `REGISTER_IRQ(USB, usb.intrq, data_bus.interrupt)

    assign usb.rst_n = 1'b1;
    assign usb.dack_n = 1'b1; // in host mode, disable DMA ack

    wire clk, clk_bus, rst;
    assign clk = data_bus.clk.base_2x;
    assign clk_bus = data_bus.clk.base;
    assign rst = data_bus.clk.rst;

    typedef enum {
        STATE_INIT,
        STATE_WRITE_BYTE_0_[`WAIT_CYCLES],
        STATE_READ_BYTE_0_[`WAIT_CYCLES],
        STATE_CS_INACTIVE[`WAIT_CYCLES]
    } UsbState_t;

    UsbState_t currentState;

    Byte_t data_read;

    Byte_t data_to_write;

    logic write_usb;
    assign usb.data = write_usb ? data_to_write : `HIGHZ_BYTE;
    assign data_bus.data_rd = data_read;

`define GEN_WAIT_STATE(NAME, A, B) NAME``_``A: begin \
    currentState <= NAME``_``B; \
end \

`define GEN_WAIT_STATES(NAME) `GEN_WAIT_STATE(NAME, 0, 1)\
`GEN_WAIT_STATE(NAME, 1, 2) \
`GEN_WAIT_STATE(NAME, 2, 3) \

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            currentState <= STATE_INIT;
            write_usb <= `ZERO_BIT;
            data_read <= `ZERO_WORD;
            data_bus.stall <= `ZERO_BIT;
        end else begin
            if (clk_bus == ~`BUS_CLK_POSEDGE) begin // falling edge of clk_bus
                unique case (currentState)

                    STATE_INIT: begin
                        usb.cs_n <= 1'b1;
                        usb.wr_n <= 1'b1;
                        usb.rd_n <= 1'b1;
                        write_usb <= `ZERO_BIT;
                        usb.a0 <= data_bus.address[0];
                        if (data_bus.read) begin
                            data_bus.stall <= 1'b1;
                            usb.cs_n <= 1'b0;
                            usb.rd_n <= 1'b0;
                            currentState <= STATE_READ_BYTE_0;
                        end
                        else if (data_bus.write) begin
                            data_bus.stall <= 1'b1;
                            usb.cs_n <= 1'b0;
                            usb.wr_n <= 1'b0;
                            currentState <= STATE_WRITE_BYTE_0;
                            write_usb <= 1'b1;
                            data_to_write <= data_bus.data_wr[0 +: 8];
                        end
                    end

                    `GEN_WAIT_STATE(STATE_WRITE_BYTE)

                    STATE_WRITE_BYTE_3: begin
                        usb.cs_n <= 1'b1;
                        usb.wr_n <= 1'b1;
                        // for hold time requirement
                        // write_usb <= `ZERO_BIT;
                        currentState <= STATE_CS_INACTIVE_0;
                    end


                    `GEN_WAIT_STATES(STATE_READ_BYTE)

                    STATE_READ_BYTE_3: begin
                        usb.cs_n <= 1'b1;
                        usb.rd_n <= 1'b1;
                        data_read[0 +: 8] <= usb.data;
                        currentState <= STATE_CS_INACTIVE_0;
                    end


                    // the data sheet requires 85 ms between to CS active periods
                    `GEN_WAIT_STATES(STATE_CS_INACTIVE)

                    STATE_CS_INACTIVE_3: begin
                        write_usb <= `ZERO_BIT;
                        data_bus.stall <= `ZERO_BIT;
                        currentState <= STATE_INIT;
                    end

                    default: currentState <= STATE_INIT;
                endcase
            end
        end
    end

`undef GEN_WAIT_STATE
`undef GEN_WAIT_STATES

endmodule