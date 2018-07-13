SRCS=$(wildcard *.cpp)
COES=$(SRCS:.cpp=.coe)

CXX=$(ARCH)-gcc
LD=$(ARCH)-ld
OBJCOPY=$(ARCH)-objcopy

CXXFLAGS=-c -ffreestanding -Wall -Werror -EB -mips32 -O2 -std=c++11
LDFLAGS=-static -EB -T linker.ld --oformat elf32-big -nostdlib --nmagic

info:
	@echo "Please use ./build.sh, do not make directly"

coe: $(COES) $(MEM)

%.coe: %.mem
	./mem_to_coe.sh $< > $@

%.mem: %.elf
	$(OBJCOPY) --dump-section .text=/dev/stdout $< | xxd -c 4 -g 32 | cut -f 2 -d " " > $@

%.elf: %.o startup.o
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.cpp 
	$(CXX) $(CXXFLAGS) -o $@ $<

startup.o: startup.s
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm *.coe *.o || true
