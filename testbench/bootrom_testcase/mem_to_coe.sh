#!/bin/bash

LINENUM0=$(wc -l $1 | cut -f 1 -d ' ')
LINENUM=$(echo "1+$LINENUM0" | bc)

echo ";DEPTH = $LINENUM;"
echo ";WIDTH = 32;"
echo "memory_initialization_radix=16;"
echo "memory_initialization_vector="
sed 's/$/,/' $1
echo "00000000;"
echo ""
