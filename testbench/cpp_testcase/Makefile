SRCS=$(wildcard *.cpp)
COES=$(SRCS:.cpp=.coe)

CXX=$(ARCH)-gcc
LD=$(ARCH)-ld
OBJCOPY=$(ARCH)-objcopy
BASES=$(SRCS:.cpp=.base.bin)
EXTS=$(SRCS:.cpp=.ext.bin)

CXXFLAGS=-c -ffreestanding -Wall -Werror -mxgot -EB -mips32 -O2 -std=c++11
LDFLAGS=-static -EB -T utility/linker.ld -nostdlib --nmagic

info:
	@echo "Please use ./build.sh, do not make directly"

sram: $(BASES) $(EXTS)

%.base.bin: %.mem gen_bin
	./gen_bin $< $(basename $<).ext.bin $(basename $<).base.bin

%.ext.bin: %.base.bin

gen_bin: utility/gen_bin.cpp
	g++ -Wall -Werror -o gen_bin utility/gen_bin.cpp

#coe: $(COES)

#%.coe: %.mem
#	sh mem_to_coe.sh $< > $@

%.mem: %.elf
	$(OBJCOPY) --dump-section .text=/dev/stdout $< | xxd -c 4 -g 32 | cut -f 2 -d " " > $@

%.elf: %.o startup.o
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.cpp 
	$(CXX) $(CXXFLAGS) -o $@ $<

startup.o: utility/startup.s
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm *.mem *.elf *.o || true
