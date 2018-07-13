`include "common_defs.svh"

module uart_controller(
    Bus_if.slave   data_bus,
    UART_if.master uart
);

    parameter IRQ_NUMBER = 0;

    localparam ClkFrequency = 60_000_000;
    localparam Baud = 115200;

    logic interrupt;
    assign data_bus.interrupt[IRQ_NUMBER] = interrupt;
    assign data_bus.interrupt[5:1] = 1'b0;


    wire clk, clk_bus, rst;
    assign clk = data_bus.clk.base_2x;
    assign clk_bus = data_bus.clk.base;
    assign rst = data_bus.clk.rst;


    // transmitter
    logic tx_fifo_full, tx_fifo_empty, tx_fifo_read, tx_fifo_write;
    Byte_t tx_fifo_out, tx_fifo_in;

    fifo_uart_tx transmitter_fifo(
        .clk,
        .rst,
        .din(tx_fifo_in),
        .wr_en(tx_fifo_write),
        .rd_en(tx_fifo_read),
        .dout(tx_fifo_out),
        .full(tx_fifo_full),
        .empty(tx_fifo_empty)
    );

    logic tx_start, tx_busy;

    uart_transmitter #(
        .ClkFrequency(ClkFrequency),
        .Baud(Baud)
    ) transmitter(
        .clk,
        .TxD_start(tx_start),
        .TxD_data(tx_fifo_out),
        .TxD(uart.txd),
        .TxD_busy(tx_busy)
    );

    typedef enum {
        STATE_INIT, STATE_SEND, STATE_WAIT
    } FifoConsumerState_t;

    FifoConsumerState_t currentState;

    assign tx_fifo_read = (currentState == STATE_INIT) && (!tx_fifo_empty);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            tx_start <= `ZERO_BIT;
            currentState <= STATE_INIT;
        end else begin
            tx_start <= `ZERO_BIT;
            case (currentState)
                STATE_INIT: begin
                    if (!tx_fifo_empty) begin
                        currentState <= STATE_SEND;
                        tx_start <= 1'b1;
                    end
                end
                STATE_SEND: begin
                    currentState <= STATE_WAIT;
                end
                STATE_WAIT: begin
                    if (!tx_busy) begin
                        currentState <= STATE_INIT;
                    end
                end
            endcase
        end
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            tx_fifo_write <= `ZERO_BIT;
        end else begin
            tx_fifo_write <= `ZERO_BIT;
            if(clk_bus == 1'b1) begin // falling edge of clk_bus
                if (data_bus.write && data_bus.address[0] == 1'b1 && !tx_fifo_full) begin
                    tx_fifo_in <= Byte_t'(data_bus.data_wr);
                    tx_fifo_write <= 1'b1;
                end
            end
        end
    end


    // receiver
    Byte_t rx_fifo_in, rx_fifo_out;
    logic rx_fifo_write, rx_fifo_empty, rx_fifo_read;

    assign interrupt = ~rx_fifo_empty;

    uart_receiver #(
        .ClkFrequency(ClkFrequency),
        .Baud(Baud)
    ) receiver (
        .clk,
        .RxD(uart.rxd),
        .RxD_data_ready(rx_fifo_write),
        .RxD_clear(rst),
        .RxD_data(rx_fifo_in),
        .RxD_idle(),
        .RxD_endofpacket()
    );


    fifo_uart_rx receiver_fifo(
        .clk,
        .srst(rst),
        .din(rx_fifo_in),
        .wr_en(rx_fifo_write),
        .rd_en(rx_fifo_read),
        .dout(rx_fifo_out),
        .full(),
        .empty(rx_fifo_empty)
    );


    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_bus.data_rd <= `ZERO_WORD;
            rx_fifo_read <= `ZERO_BIT;
        end else begin
            rx_fifo_read <= `ZERO_BIT;
            if (clk_bus == 1'b1) begin // falling edge of clk_bus
                if (data_bus.read && data_bus.address[0] == 1'b1 && !rx_fifo_empty) begin
                    data_bus.data_rd <= rx_fifo_out;
                    rx_fifo_read <= 1'b1;
                end else if (data_bus.read && data_bus.address[0] == 1'b0) begin
                    data_bus.data_rd <= {30'b0, ~rx_fifo_empty, ~tx_fifo_full};
                end
            end
        end
    end

endmodule
