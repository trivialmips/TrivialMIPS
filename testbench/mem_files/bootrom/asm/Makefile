SRCS=$(wildcard *.s)

export CROSS_COMPILE ?= mipsel-linux-gnu-
AS=${CROSS_COMPILE}as
OBJCOPY=${CROSS_COMPILE}objcopy

COES=$(SRCS:.s=.coe) 

all: $(COES) 

%.coe: %.bin convert_bin
	./convert_bin $< $@

%.bin: %.o
	$(OBJCOPY) -O binary -j .text -j .data -j .bss $< $@

%.o: %.s
	$(AS) -mips32 -EL $< -o $@ 

convert_bin: ../../utility/convert_bin.c
	gcc -Wall -O2 -o $@ $<

clean:
	rm -f *.coe convert_bin
