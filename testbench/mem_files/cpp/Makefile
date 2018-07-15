SRCS=$(wildcard *.cpp)

export CROSS_COMPILE ?= mipsel-linux-gnu-

CXX=${CROSS_COMPILE}gcc
LD=${CROSS_COMPILE}ld
OBJCOPY=${CROSS_COMPILE}objcopy
OBJDUMP=${CROSS_COMPILE}objdump

COES=$(SRCS:.cpp=.coe)
ASM=$(SRCS:.cpp=.s) 
BASES=$(SRCS:.cpp=.base.bin)
EXTS=$(SRCS:.cpp=.ext.bin)
EXTS=$(SRCS:.cpp=.s)

CXXFLAGS=-c -ffreestanding -Wall -Werror -mxgot -EL -mips32 -O2 -std=c++11
LDFLAGS=-static -EL -nostdlib --nmagic

all: bootrom sram

bootrom: $(COES)

sram: $(BASES)  #$(EXTS)

%.coe: %.bootrom.bin convert_bin
	mkdir -p bootrom
	./convert_bin $< bootrom/$@

%.base.bin: %.ram.bin split_bin
	./split_bin $< ram/$(basename $(basename $<)).ext.bin ram/$(basename $(basename $<)).base.bin

convert_bin: ../utility/convert_bin.c
	gcc -Wall -O2 -o $@ $<

split_bin: ../utility/split_bin.cpp
	g++ -Wall -Werror -o $@ $<

%.bin: %.elf
	$(OBJCOPY) -O binary -j .text -j .data -j .bss $< $@

%.bootrom.elf: %.o startup.o linker.bootrom.ld
	mkdir -p bootrom
	$(LD) $(LDFLAGS) -T linker.bootrom.ld -o $@ $^
	$(OBJDUMP) -ald $@ > bootrom/$(basename $(basename $@)).s

%.ram.elf: %.o startup.o linker.ram.ld
	mkdir -p ram
	$(LD) $(LDFLAGS) -T linker.ram.ld -o $@ $^
	$(OBJDUMP) -ald $@ > ram/$(basename $(basename $@)).s

linker.bootrom.ld: utility/linker.ld.S
	$(CXX) -E -P -DBOOT_FROM_BOOTROM $(CXXFLAGS) $< -o $@

linker.ram.ld: utility/linker.ld.S
	$(CXX) -E -P $(CXXFLAGS) $< -o $@

%.o: %.cpp mips.h
	$(CXX) $(CXXFLAGS) -o $@ $<

startup.o: utility/startup.s
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -rf ram/ bootrom/ *.ld *.o split_bin convert_bin
