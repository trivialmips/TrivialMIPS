SRCS=$(wildcard *.cpp)

export CROSS_COMPILE ?= mipsel-linux-gnu-

CXX=${CROSS_COMPILE}gcc
LD=${CROSS_COMPILE}ld
OBJCOPY=${CROSS_COMPILE}objcopy
BASES=$(SRCS:.cpp=.base.bin)
EXTS=$(SRCS:.cpp=.ext.bin)

CXXFLAGS=-c -ffreestanding -Wall -Werror -mxgot -EL -mips32 -O2 -std=c++11
LDFLAGS=-static -EL -T utility/linker.ld -nostdlib --nmagic

all: $(BASES) $(EXTS)

%.base.bin: %.bin split_bin
	./split_bin $< $(basename $<).ext.bin $(basename $<).base.bin

%.ext.bin: %.base.bin

split_bin: ../../utility/split_bin.cpp
	g++ -Wall -Werror -o $@ $<

%.bin: %.elf
	$(OBJCOPY) -O binary -j .text -j .data -j .bss $< $@

%.elf: %.o startup.o
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.cpp mips.h
	$(CXX) $(CXXFLAGS) -o $@ $<

startup.o: utility/startup.s
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -f *.elf *.mem *.o *.bin split_bin
