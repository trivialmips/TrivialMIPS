mips-elf-gcc -c -ffreestanding -Wall -Werror -o test.o test.cpp -mips32 -O2
mips-elf-gcc -c -ffreestanding -Wall -Werror -o startup.o startup.s -mips32 -O2
mips-elf-ld -static -T linker.ld -nostdlib --nmagic -o test.elf test.o startup.o
mips-elf-objcopy --dump-section .text=/dev/stdout test.elf | xxd -c 4 -g 32 | cut -f 2 -d " " > test.mem
LINENUM0=$(wc -l test.mem | cut -f 1 -d ' ')
LINENUM=$(echo "1+$LINENUM0" | bc)
echo ";DEPTH = $LINENUM;" > test.coe
echo ";WIDTH = 32;" >> test.coe
echo "memory_initialization_radix=16;" >> test.coe
echo "memory_initialization_vector=" >> test.coe
sed 's/$/,/' test.mem >> test.coe
echo "00000000;" >> test.coe
rm startup.o test.o test.elf test.mem
