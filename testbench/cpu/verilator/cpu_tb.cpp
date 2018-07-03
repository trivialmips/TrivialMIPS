#include <stdlib.h>
#include "testbench.h"
#include "verilated.h"

#include "Vcpu_tb.h"

int main(int argc, char **argv) {
	// Initialize Verilators variables
	Verilated::commandArgs(argc, argv);

	// Create an instance of our module under test
    auto *tb = new TESTBENCH<Vcpu_tb>;
    tb->opentrace("cpu_tb.vcd");

    tb->reset();

	// Tick the clock until we are done
	while(!tb->done()) {
        tb->tick();
	}
    
    delete tb;
    exit(EXIT_SUCCESS);
}