#!/bin/bash

# check CPU simulation

grep "\[Done\]" TrivialMIPS.sim/sim_cpu/behav/xsim/simulate.log 2&>1 >/dev/null

if [ $? -eq 0 ]; then
    echo "CPU simulation succeeded."
else
    echo "CPU simulation failed. Please check log for more information."
    exit 1
fi