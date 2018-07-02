mips-elf-as -mips32 $1 -o $1.om
mips-elf-objcopy --dump-section .text=/dev/stdout $1.om | xxd -c 4 -g 32 | cut -f 2 -d " " > inst_data.bin
rm $1.om
