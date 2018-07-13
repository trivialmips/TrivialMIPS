# Tests

This folder contains the tests for `TrivialMIPS`.

* `behav_model` contains the behavioural model of SRAM and Flash chips, used in simulation.
* `cpu` folder contains the testbench for CPU itself only, it should be used with the folder `testcase`, which contains programs written in assembly, and used by `fake_inst_bus` to feed to the CPU.
* `peripheral` folder contains the testbench for peripheral controllers and buses, we mock the r/w request on the bus and observe the actions that controllers make.
* `thinpad` folder contains the testbench for the whole SoC, it runs like the real board!
* `testcase_mem` folder contains programs that are intened to be written to SRAM, whose entry point is `0x80000000`.
* `cpp_testcase` folder contains programs that are written in C/C++ and will be pre-initialized in bootrom, whose entry point is `0xBFC00000`.

## Endianness

> Endianness __MATTERS__! --Harry

The CPU itself is little-endian, that is, the most significant byte is the one with the highest address. As for initialization files, `coe` and `mem` files put MSB on the leftmost side, so `0x123456878` will still be `12345678` in these files. For little-endian binary memory files, it will be `0x78 0x56 0x34 0x12`, and `xxd` will show it as `78563412`. Because we use this result to generate `coe`/`mem` files, and we do not want to convert `78563412` to `12345678` back again, the compiler and linker should be set in Big Endian mode (`-EB`) when compiling from assembly or C/C++ code.

For generation of SRAM initialization files, we should also use Big Endian mode when compiling. The reason is that the converter from `mem` to `bin` we use does the following work on each line of the given file:

* read oneline (8 characters)
* interpret it as a 32-bit hex-encoded integer
* write it out in a 4-byte sequence

For example, if we use `-EB`, `0x12345678` will be converted to `12345678` in the `mem` file, and will be interpreted as `0x12345678`, written to the binary file in the form `0x78 0x56 0x34 0x12` ,which is exacly the Little-Endian representation of the original number.