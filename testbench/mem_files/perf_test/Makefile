CFLAGS := -D_KERNEL -DCONFIG_PAGE_SIZE_16KB -fno-builtin -mips1 -DCACHELOCK_MEM -DMEMSTART=0x80000000 -DMEMSIZE=0x00100000 -DCPU_COUNT_PER_US=1000 -I include -include common.h -DAPB_CLK=33333333
CFLAGS += -DLS1FSOC  -DCPU_MULT=6 -DDDR_MULT=6 -msoft-float -nostdlib

export AR CFLAGS
export CROSS_COMPILE ?= mipsel-linux-gnu-

OBJDIR = obj

all: bitcount stringsearch coremark dhrystone sha crc32 quick_sort bubble_sort select_sort stream_copy

bitcount:
	$(eval export BENCH = $@)
	make target_bench

stringsearch:
	$(eval export BENCH = $@)
	make target_bench

coremark:
	$(eval export BENCH = $@)
	make target_bench

dhrystone:
	$(eval export BENCH = $@)
	make target_bench

sha:
	$(eval export BENCH = $@)
	make target_bench

crc32:
	$(eval export BENCH = $@)
	make target_bench

quick_sort:
	$(eval export BENCH = $@)
	make target_bench

bubble_sort:
	$(eval export BENCH = $@)
	make target_bench

select_sort:
	$(eval export BENCH = $@)
	make target_bench

stream_copy:
	$(eval export BENCH = $@)
	make target_bench

libtinyc.a libtinyc64.a:
	make -C lib $@

.SUFFIXES: .o64 .elf64 .bin64

target_bench:
	$(eval export BENCH_DIR = $(BENCH))
	$(eval export BENCH_LIB = $(BENCH).a)
	make -C bench/$(BENCH_DIR)
	mkdir -p $(OBJDIR)/$(BENCH_DIR)
	make generate

generate: main.base.bin main.ext.bin split_bin

main.base.bin: main.bin split_bin
		./split_bin $(OBJDIR)/$(BENCH_DIR)/main.bin $(OBJDIR)/$(BENCH_DIR)/main.ext.bin $(OBJDIR)/$(BENCH_DIR)/main.base.bin

main.ext.bin: main.base.bin

main.bin: main.elf
	${CROSS_COMPILE}objcopy -O binary -j .text -j .data -j .bss $(OBJDIR)/$(BENCH_DIR)/$< $(OBJDIR)/$(BENCH_DIR)/$@


main.elf: start.o libtinyc.a bin.lds
	${CROSS_COMPILE}ld -g -T bin.lds start.o bench/$(BENCH_DIR)/$(BENCH_LIB) lib/libtinyc.a -o $(OBJDIR)/$(BENCH_DIR)/$@
	${CROSS_COMPILE}objdump -ald $(OBJDIR)/$(BENCH_DIR)/$@ > $(OBJDIR)/$(BENCH_DIR)/test.s

bin.lds: bin.lds.S
	${CROSS_COMPILE}gcc -E -P -Umips -D_LOADER -U_MAIN $(CFLAGS) $< -o $@

start.o: start.S
	${CROSS_COMPILE}gcc -O2 $(CFLAGS) -fno-pic -mno-abicalls -g -DGUEST -I ../include -c $< -nostdinc -nostdlib

split_bin: ../utility/split_bin.cpp
	g++ -std=c++11 -Wall -Werror -O2 -o $@ $<

clean:
	rm -f *.o *.bin *.elf *.a *.s split_bin bin.lds
	rm -rf obj
	make -C lib clean
	make -C bench clean

#-include rules.make
