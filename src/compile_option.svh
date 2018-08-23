`ifndef COMPILE_OPTION_SVH
`define COMPILE_OPTION_SVH

/*
    Options to control functional parts to be compiled
*/

`define ENABLE_CPU_FPU                  1
`define ENABLE_PERIPHERAL_ETHERNET      1
`define ENABLE_PERIPHERAL_FLASH         1
`define ENABLE_PERIPHERAL_GPIO          1
`define ENABLE_PERIPHERAL_GRAPHICS      1
`define ENABLE_PERIPHERAL_TIMER         1
`define ENABLE_PERIPHERAL_UART          1
`define ENABLE_PERIPHERAL_USB           1

`define GENERATE_DUMMY_CONTROLLER(NAME) dummy_controller \
     dummy_``NAME``_controller_instance( \
        .data_bus(NAME``if.slave) \
    );

`endif