# Tests

This folder contains the tests for `TrivialMIPS`.

* `behav_model` contains the behavioural model of SRAM and Flash chips, used in simulation.
* `cpu` folder contains the testbench for CPU itself only, it should be used with its subfolder `testcase`, which contains programs written in assembly, and used by `fake_inst_bus` to feed to the CPU.
* `peripheral` folder contains the testbench for peripheral controllers and buses, we mock the r/w request on the bus and observe the actions that controllers make.
* `thinpad` folder contains the testbench for the whole SoC, it runs like the real board! Its subfolder `mem_init` contains the initial content of SRAM and flash used in simulation.
