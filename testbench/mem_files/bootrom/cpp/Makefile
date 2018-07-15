SRCS=$(wildcard *.cpp)

export CROSS_COMPILE ?= mipsel-linux-gnu-

CXX=${CROSS_COMPILE}gcc
LD=${CROSS_COMPILE}ld
OBJCOPY=${CROSS_COMPILE}objcopy
OBJDUMP=${CROSS_COMPILE}objdump

COES=$(SRCS:.cpp=.coe) 
ASM=$(SRCS:.cpp=.s) 

CXXFLAGS=-c -ffreestanding -Wall -Werror -mxgot -EL -mips32 -O2 -std=c++11 -I../../include
LDFLAGS=-static -EL -T utility/linker.ld -nostdlib --nmagic

all: $(COES) $(ASM)

%.coe: %.bin convert_bin
	./convert_bin $< $@

convert_bin: ../../utility/convert_bin.c
	gcc -Wall -O2 -o $@ $<

%.bin: %.elf
	$(OBJCOPY) -O binary -j .text $< $@

%.s: %.elf
	$(OBJDUMP) -ald $< > $@

%.elf: %.o startup.o
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.cpp mips.h
	$(CXX) $(CXXFLAGS) -o $@ $<

startup.o: utility/startup.s
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -f *.coe *.s *.o convert_bin
