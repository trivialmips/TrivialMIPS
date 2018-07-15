`include "common_defs.svh"

module timer_controller(
    Bus_if.slave data_bus
);

    wire clk_bus, clk_10M, rst;
    assign clk_bus = data_bus.clk.base;
    assign clk_10M = data_bus.clk._10M;
    assign rst = data_bus.clk.rst;

    Word_t timer, timer_reg[0:1];
    Word_t cycle_count;

    assign data_bus.stall = `ZERO_BIT;

    always_comb begin
        if (rst || ~data_bus.read) begin
            data_bus.data_rd = `ZERO_WORD;
        end else begin
            if (data_bus.address[0] == 1'b0) begin
                data_bus.data_rd = timer_reg[1];
            end else begin
                data_bus.data_rd = cycle_count;
            end
        end
    end

    // cross clock domian synchronization
    always_ff @(posedge clk_bus or posedge rst) begin
        if (rst) begin
            timer_reg[0] <= `ZERO_WORD;
            timer_reg[1] <= `ZERO_WORD;
        end else begin
            timer_reg[0] <= timer;
            timer_reg[1] <= timer_reg[0];
        end
    end

    always_ff @(posedge clk_bus or posedge rst) begin
        if (rst) begin
            cycle_count <= `ZERO_WORD;
        end else begin
            cycle_count <= cycle_count + 1'b1;
        end
    end


    logic data_bus_write_reg[0:1];
    Word_t timer_new_reg[0:1];

    // cross clock domian synchronization
    always_ff @(posedge clk_10M or posedge rst) begin
        if (rst) begin
            data_bus_write_reg[0] <= `ZERO_BIT;
            data_bus_write_reg[1] <= `ZERO_BIT;
            timer_new_reg[0] <= `ZERO_WORD;
            timer_new_reg[1] <= `ZERO_WORD;
        end else begin
            data_bus_write_reg[0] <= data_bus_write_reg[1];
            data_bus_write_reg[1] <= data_bus.write;
            timer_new_reg[0] <= timer_new_reg[1];
            timer_new_reg[1] <= data_bus.data_wr;
        end
    end

    // downscale from 10MHz to 1MHz (not in simulation)
    HalfWord_t prescaler;

    always @(posedge clk_10M or posedge rst) begin
        if (rst) begin
            timer <= `ZERO_WORD;
            prescaler <= `ZERO_HWORD;
        end else begin
            prescaler <= (prescaler < 16'd9) ? prescaler + 1'b1 : `ZERO_HWORD;
`ifdef XILINX_SIMULATOR
            timer <= timer + 1'b1;
`else
            timer <= timer + (prescaler == 16'd9);
`endif
            // write new timer data
            if (data_bus_write_reg[0]) begin
                timer <= timer_new_reg[0];
                prescaler <= `ZERO_HWORD;
            end
        end
    end


endmodule