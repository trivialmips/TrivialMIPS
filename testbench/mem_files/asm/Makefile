SRCS=$(wildcard *.s)

export CROSS_COMPILE ?= mipsel-linux-gnu-
AS=${CROSS_COMPILE}as
OBJCOPY=${CROSS_COMPILE}objcopy

COES=$(SRCS:.s=.coe)
BASES=$(SRCS:.s=.base.bin)
EXTS=$(SRCS:.s=.ext.bin)

all: bootrom ram 

bootrom: $(COES)

ram: $(BASES) #$(EXTS)

%.coe: %.bin convert_bin
	mkdir -p bootrom
	./convert_bin $< bootrom/$@

%.base.bin: %.bin split_bin
	mkdir -p ram
	./split_bin $< ram/$(basename $<).ext.bin ram/$(basename $<).base.bin

%.ext.bin: %.base.bin

%.bin: %.o
	$(OBJCOPY) -O binary -j .text -j .data -j .bss $< $@

%.o: %.s
	$(AS) -mips32 -EL $< -o $@ 

convert_bin: ../utility/convert_bin.c
	gcc -Wall -O2 -o $@ $<

split_bin: ../utility/split_bin.cpp
	g++ -Wall -Werror -o $@ $<

clean:
	rm -rf bootrom/ ram/ convert_bin split_bin
