SRCS=$(wildcard *.s)

export CROSS_COMPILE ?= mipsel-linux-gnu-

AS=${CROSS_COMPILE}as
OBJCOPY=${CROSS_COMPILE}objcopy

MEMS=$(SRCS:.s=.mem) 
BASES=$(SRCS:.s=.base.bin)
EXTS=$(SRCS:.s=.ext.bin)

all: $(BASES) $(EXTS)

%.base.bin: %.bin split_bin
	./split_bin $< $(basename $<).ext.bin $(basename $<).base.bin

%.ext.bin: %.base.bin

%.bin: %.o
	$(OBJCOPY) -O binary -j .text -j .data -j .bss $< $@

%.o: %.s
	$(AS) -mips32 -EL $< -o $@ 

split_bin: ../split_bin.cpp
	g++ -Wall -Werror -o $@ $<

clean:
	rm -f split_bin *.bin
