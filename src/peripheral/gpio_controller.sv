`include "common_defs.svh"

module gpio_controller(
    Bus_if.slave   data_bus,
    GPIO_if.master gpio
);

    wire clk, clk_bus, rst;
    assign clk_bus = data_bus.clk.base;
    assign clk = data_bus.clk.base_2x;
    assign rst = data_bus.clk.rst;

    Word_t raw_data_display;

    logic decode;
    assign decode = ~rst ? raw_data_display[31] : 0'b0;

    logic [3:0] lower_to_decoded, upper_to_decoded;
    SegmentDisplay_t lower_decoded, upper_decoded;

    led_decoder decoder_lower(
        .hex(raw_data_display[3:0]),
        .segments(lower_decoded)
    );

    led_decoder decoder_higher(
        .hex(raw_data_display[7:4]),
        .segments(upper_decoded)
    );

    assign gpio.dpy0 = decode ? lower_decoded : raw_data_display[7:0];
    assign gpio.dpy1 = decode ? upper_decoded : raw_data_display[16:8];

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_bus.data_rd <= `ZERO_WORD;
            gpio.leds <= `ZERO_HWORD;
            raw_data_display <= `ZERO_WORD;
        end else begin
            if (clk_bus == 1'b0) begin
                if (data_bus.read) begin
                    if (data_bus.address[1:0] == 2'h0) begin
                        data_bus.data_rd <= `ZERO_WORD;
                    end else begin
                        data_bus.data_rd <= gpio.dip_sw;
                    end
                end else if (data_bus.write) begin
                    unique case (data_bus.address[1:0])
                        2'h1: begin
                            raw_data_display <= data_bus.data_wr;
                        end
                        2'h2: begin
                            gpio.leds <= data_bus.data_wr[$bits(gpio.leds) - 1 : 0];
                        end
                    endcase
                end
            end
        end

    end

endmodule