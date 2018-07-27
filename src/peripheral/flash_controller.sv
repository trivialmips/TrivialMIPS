`include "common_defs.svh"

module flash_controller(
    Bus_if.slave    data_bus,
    Flash_if.master flash
);

    // read requires 75ns, write requires 60ns
    // it is safe to wait for 3 cycles both, when bus_clk is at 40MHz or slower
    `define WAIT_CYCLES 4 

    assign flash.vpen = 1'b0; // enable write protection
    assign flash.byte_n = 1'b1; // use 16-bit mode instead byte mode
    assign flash.rp_n = 1'b1; // a reset cause 150 ns delay!

    wire clk, clk_bus, rst;
    assign clk = data_bus.clk.base_2x;
    assign clk_bus = data_bus.clk.base;
    assign rst = data_bus.clk.rst;

    typedef enum {
        STATE_INIT, STATE_RESET,
        STATE_WRITE_BYTE_[`WAIT_CYCLES],
        STATE_READ_BYTE_0_[`WAIT_CYCLES],
        STATE_READ_BYTE_1_[`WAIT_CYCLES]
    } FlashState_t;

    FlashState_t currentState;

    Word_t data_read;

    FlashChipAddress_t chip_base_address;
    assign chip_base_address = FlashChipAddress_t'(data_bus.address << 2);

    HalfWord_t data_to_write;

    logic write_flash;
    assign flash.data = write_flash ? data_to_write : `HIGHZ_HWORD;
    assign data_bus.data_rd = data_read;

    // only 16-bit write is supported
    logic write_upper_half;
    assign write_upper_half = ~(|data_bus.mask[1:0]);

`define GEN_WAIT_STATE(NAME, A, B) NAME``_``A: begin \
    currentState <= NAME``_``B; \
end \

`define GEN_WAIT_STATES(NAME) `GEN_WAIT_STATE(NAME, 0, 1)\
`GEN_WAIT_STATE(NAME, 1, 2) \
`GEN_WAIT_STATE(NAME, 2, 3) \

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            currentState <= STATE_RESET;
            write_flash <= `ZERO_BIT;
            data_read <= `ZERO_WORD;
            flash.ce_n <= 1'b1;
            flash.we_n <= 1'b1;
            flash.oe_n <= 1'b1;
            data_bus.stall <= `ZERO_BIT;
        end else begin
            if (clk_bus == ~`BUS_CLK_POSEDGE) begin // falling edge of clk_bus
                unique case (currentState)
                    STATE_RESET: begin
                        // put flash in read mode
                        flash.ce_n <= 1'b0;
                        flash.we_n <= 1'b0;
                        flash.oe_n <= 1'b1;
                        write_flash <= 1'b1;
                        data_to_write <= `FLASH_OP_READ;
                        flash.address <= 0;
                        // write into one address is enough
                        currentState <= STATE_WRITE_BYTE_0;
                    end

                    STATE_INIT: begin
                        flash.ce_n <= 1'b1;
                        flash.we_n <= 1'b1;
                        flash.oe_n <= 1'b1;
                        write_flash <= `ZERO_BIT;
                        if (data_bus.read) begin
                            data_bus.stall <= 1'b1;
                            flash.ce_n <= 1'b0;
                            flash.oe_n <= 1'b0;
                            flash.address <= chip_base_address;
                            currentState <= STATE_READ_BYTE_0_0;
                        end
                        else if (data_bus.write) begin
                            data_bus.stall <= 1'b1;
                            flash.ce_n <= 1'b0;
                            flash.we_n <= 1'b0;
                            flash.address <= write_upper_half ? chip_base_address + 2'h2 : chip_base_address;
                            currentState <= STATE_WRITE_BYTE_0_0;
                            write_flash <= 1'b1;
                            data_to_write <= write_upper_half ? data_bus.data_wr[16 +: 16] : data_bus.data_wr[0 +: 16];
                        end
                    end

                    `GEN_WAIT_STATES(STATE_WRITE_BYTE)

                    STATE_WRITE_BYTE_3: begin
                        data_bus.stall <= `ZERO_BIT;
                        flash.ce_n <= 1'b1;
                        flash.we_n <= 1'b1;
                        flash.oe_n <= 1'b1;
                        currentState <= STATE_INIT;
                    end

                    `GEN_WAIT_STATES(STATE_READ_BYTE_0)

                    STATE_READ_BYTE_0_3: begin
                        data_read[15:0] <= flash.data;
                        flash.address <= chip_base_address + 2'h2;
                        currentState <= STATE_READ_BYTE_1_0;
                    end
                    
                    `GEN_WAIT_STATES(STATE_READ_BYTE_1)

                    STATE_READ_BYTE_1_3: begin
                        data_bus.stall <= `ZERO_BIT;
                        data_read[31:16] <= flash.data;
                        flash.ce_n <= 1'b1;
                        flash.we_n <= 1'b1;
                        flash.oe_n <= 1'b1;
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