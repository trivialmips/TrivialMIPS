CFLAGS := -D_KERNEL -DCONFIG_PAGE_SIZE_16KB -fno-builtin -mips1 -DCACHELOCK_MEM -DMEMSTART=0x80400000 -DMEMSIZE=0x0400000 -DCPU_COUNT_PER_US=1000 -I include -include common.h -DAPB_CLK=33333333
CFLAGS += -DLS1FSOC  -DCPU_MULT=6 -DDDR_MULT=6 -msoft-float

export AR CFLAGS
export CROSS_COMPILE ?= mipsel-linux-

OBJDIR = obj

info:
	@echo "Please use ./build.sh, do not make directly"

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

generate: main.bin main.data convert
	./convert main.bin main.data $(OBJDIR)/$(BENCH_DIR)/

main.bin: main.elf
	${CROSS_COMPILE}objcopy -O binary -j .text $(OBJDIR)/$(BENCH_DIR)/$< $(OBJDIR)/$(BENCH_DIR)/$@ 

main.data: main.elf
	${CROSS_COMPILE}objcopy -O binary -j .data $(OBJDIR)/$(BENCH_DIR)/$< $(OBJDIR)/$(BENCH_DIR)/$@ 

main.elf: start.o libtinyc.a bin.lds
	${CROSS_COMPILE}ld -g -T bin.lds start.o bench/$(BENCH_DIR)/$(BENCH_LIB) lib/libtinyc.a -o $(OBJDIR)/$(BENCH_DIR)/$@
	${CROSS_COMPILE}objdump -ald $(OBJDIR)/$(BENCH_DIR)/$@ > $(OBJDIR)/$(BENCH_DIR)/test.s

bin.lds: bin.lds.S
	${CROSS_COMPILE}gcc -E -P -Umips -D_LOADER -U_MAIN $(CFLAGS) $< -o $@

start.o: start.S
	${CROSS_COMPILE}gcc -O2 $(CFLAGS) -fno-pic -mno-abicalls -g -DGUEST -I ../include -c $< -nostdinc -nostdlib

convert: convert.c
	gcc -o convert convert.c
clean:
	rm -f *.o *.bin *.elf *.a testbin *.o64 *.bin64 *.elf64 *.s *.vlog convert *.coe *.data bin.lds *.mif
	rm -rf obj
	make -C lib clean
	make -C bench clean

#-include rules.make
