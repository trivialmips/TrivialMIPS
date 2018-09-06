update_compile_order -fileset sources_1
upgrade_ip [get_ips]

create_ip_run [get_ips top_clk_wiz]
create_ip_run [get_ips blk_mem_graphics]
create_ip_run [get_ips fifo_uart_tx]
create_ip_run [get_ips fifo_uart_rx]
create_ip_run [get_ips blk_mem_bootrom]

launch_runs -quiet -jobs 2 top_clk_wiz_synth_1 blk_mem_graphics_synth_1 fifo_uart_tx_synth_1 fifo_uart_rx_synth_1 blk_mem_bootrom_synth_1

wait_on_run top_clk_wiz_synth_1
wait_on_run blk_mem_graphics_synth_1
wait_on_run fifo_uart_tx_synth_1
wait_on_run fifo_uart_rx_synth_1
wait_on_run blk_mem_bootrom_synth_1

reset_run impl_1
reset_run synth_1
launch_runs -jobs 2 impl_1 -to_step write_bitstream
wait_on_run impl_1

exit