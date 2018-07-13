`include "common_defs.svh"

module flash_controller(
    Bus_if.slave    data_bus,
    Flash_if.master flash
);

    localparam WAIT_CYCLES = 3;

    assign flash.vpen = 1'b1; // enable write protect
    assign flash.byte_n = 1'b1; // use 16-bit mode instead byte mode
    assign flash.rp_n = 1'b0; // a reset cause 150 ns delay!

    wire clk, clk_bus, rst;
    assign clk = data_bus.clk.base_2x;
    assign clk_bus = data_bus.clk.base;
    assign rst = data_bus.clk.rst;

    typedef enum {
        STATE_INIT,
        STATE_WRITE_BYTE_0_[WAIT_CYCLES],
        STATE_WRITE_BYTE_1_[WAIT_CYCLES],
        STATE_READ_BYTE_0_[WAIT_CYCLES],
        STATE_READ_BYTE_1_[WAIT_CYCLES]
    } FlashState_t;

    FlashState_t currentState;

    Word_t data_read;

    HalfWord_t data_to_write;
    logic write_flash;
    assign flash.data = write_flash ? data_to_write : `HIGHZ_WORD;
    assign data_bus.read = data_read;


    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            currentState <= STATE_INIT;
            write_flash <= `ZERO_BIT;
            data_to_write <= `ZERO_HWORD;
            data_read <= `ZERO_WORD;
            flash.ce_n <= 1'b1;
            flash.we_n <= 1'b1;
            flash.oe_n <= 1'b1;
        end else begin
            if (clk_bus == 1'b1) begin // falling edge of clk_bus
                case (currentState)
                    STATE_INIT: begin
                        flash.ce_n <= 1'b1;
                        flash.we_n <= 1'b1;
                        flash.oe_n <= 1'b1;
                        if (data_bus.read) begin
                            write_flash <= 1'b1;
                            data_bus.stall <= 1'b1;
                            flash.ce_n <= 1'b0;
                            flash.we_n <= 1'b0;
                            flash.address <= {data_bus.address, 2'b0};
                            data_to_write <= `FLASH_OP_READ;
                            currentState <= STATE_WRITE_BYTE_0_0;
                        end
                    end
                    STATE_WRITE_BYTE_0_0: begin
                        currentState <= STATE_WRITE_BYTE_0_1;
                    end
                    STATE_WRITE_BYTE_0_1: begin
                        currentState <= STATE_WRITE_BYTE_0_2;
                    end
                    STATE_WRITE_BYTE_0_2: begin
                        write_flash <= 1'b0;
                        flash.we_n <= 1'b1;
                        flash.oe_n <= 1'b0;
                        currentState <= STATE_READ_BYTE_0_0;
                    end
                    STATE_READ_BYTE_0_0: begin
                        currentState <= STATE_READ_BYTE_0_1;
                    end
                    STATE_READ_BYTE_0_1: begin
                        currentState <= STATE_READ_BYTE_0_2;
                    end
                    STATE_READ_BYTE_0_2: begin
                        data_read[15:0] <= flash.data;
                        write_flash <= 1'b1;
                        flash.we_n <= 1'b0;
                        flash.oe_n <= 1'b1;
                        flash.address <= {data_bus.address, 2'b10};
                        data_to_write <= `FLASH_OP_READ;
                        currentState <= STATE_WRITE_BYTE_1_0;
                    end
                    STATE_WRITE_BYTE_1_0: begin
                        currentState <= STATE_WRITE_BYTE_1_1;
                    end
                    STATE_WRITE_BYTE_1_1: begin
                        currentState <= STATE_WRITE_BYTE_1_2;
                    end
                    STATE_WRITE_BYTE_1_2: begin
                        write_flash <= 1'b0;
                        flash.we_n <= 1'b1;
                        flash.oe_n <= 1'b0;
                        currentState <= STATE_READ_BYTE_1_0;
                    end
                    STATE_READ_BYTE_1_0: begin
                        currentState <= STATE_READ_BYTE_1_1;
                    end
                    STATE_READ_BYTE_1_1: begin
                        currentState <= STATE_READ_BYTE_1_2;
                    end
                    STATE_READ_BYTE_1_2: begin
                        data_bus.stall <= `ZERO_BIT;
                        data_read[31:16] <= flash.data;
                        flash.ce_n <= 1'b1;
                        flash.we_n <= 1'b1;
                        flash.oe_n <= 1'b1;
                        currentState <= STATE_INIT;
                    end
                endcase
            end
        end
    end

endmodule