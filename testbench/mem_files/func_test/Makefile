ver = test_hw
#ver = sim

TOPDIR=$(shell pwd | sed 's: :\\ :g')

export LD_PRELOAD =
CFLAGS := -D_KERNEL -DCONFIG_PAGE_SIZE_16KB -fno-builtin -mips32 -DCACHELOCK_MEM -DMEMSTART=0x80000000 -DMEMSIZE=0x0200000 -DCPU_COUNT_PER_US=10 -I $(TOPDIR)/include -include common.h -DAPB_CLK=33333333
CFLAGS += -DLS1FSOC  -DCPU_MULT=6 -DDDR_MULT=6 $(ALIGNED) 
#CFLAGS += -fno-reorder-blocks -fno-reorder-funcions

ifeq ($(ver), sim)
CFLAGS += -DSIM
endif


export TOPDIR AR CFLAGS

export CROSS_COMPILE ?= mipsel-linux-gnu-

all: main.base.bin main.ext.bin dump.s

main.base.bin: main.bin split_bin
	./split_bin main.bin main.ext.bin main.base.bin

main.ext.bin: main.bin

libinst.a:
	make -C inst $(TOPDIR)/$@

dump.s: main.elf
	${CROSS_COMPILE}objdump -alD $< > $@

main.elf: start.o libinst.a bin.lds
	${CROSS_COMPILE}ld -g -T  bin.lds  -o $@ start.o -L . -linst

bin.lds: bin.lds.S
	${CROSS_COMPILE}gcc -E -P -Umips -D_LOADER -U_MAIN $(CFLAGS) bin.lds.S -o bin.lds

main.bin:main.elf
	${CROSS_COMPILE}objcopy -O binary -j .text -j .data $< $@ 

split_bin: ../utility/split_bin.cpp
	g++ -std=c++11 -Wall -Werror -O2 -o $@ $<

clean:
	rm -f *.o *.bin *.elf *.a *.s bin.lds split_bin
	make -C inst clean

-include rules.make
