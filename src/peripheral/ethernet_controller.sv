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

    assign data_bus.stall = `ZERO_BIT;
    assign ethernet.pwrst_n = 1'b1;

    logic write;
    HalfWord_t data_to_write;
    assign ethernet.sd = write ? data_to_write : `HIGHZ_HWORD;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_bus.data_rd <= `ZERO_WORD;
            ethernet.cmd <= `ZERO_BIT;
            ethernet.cs_n <= 1'b1;
            ethernet.iow_n <= 1'b1;
            ethernet.ior_n <= 1'b1;
            write <= `ZERO_BIT;
            data_to_write <= `ZERO_HWORD;
        end else begin
            ethernet.cmd <= data_bus.address[0];
            ethernet.cs_n <= 1'b1;
            ethernet.iow_n <= 1'b1;
            ethernet.ior_n <= 1'b1;
            write <= `ZERO_BIT;

            if (bus_clk == `BUS_CLK_POSEDGE) begin
                if (data_bus.read) begin
                    data_bus.data_rd <= ethernet.sd;
                end else if (data_bus.write) begin
                    // datasheet requires data hold time, so we keep data
                    ethernet.cs_n <= 1'b0;
                    write <= 1'b1;
                end
            end else begin
                if (data_bus.write) begin
                    ethernet.cs_n <= 1'b0;
                    ethernet.iow_n <= 1'b0;
                    data_to_write <= HalfWord_t'(data_bus.data_wr);
                    write <= 1'b1;
                end else if (data_bus.read) begin
                    ethernet.cs_n <= 1'b0;
                    ethernet.ior_n <= 1'b0;
                end
            end
        end
    end

endmodule