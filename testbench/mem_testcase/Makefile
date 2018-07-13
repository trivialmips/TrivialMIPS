SRCS=$(wildcard *.s)

MEMS=$(SRCS:.s=.mem) 
BASES=$(SRCS:.s=.base.bin)
EXTS=$(SRCS:.s=.ext.bin)

info:
	@echo "Please use ./build.sh, do not make directly"

sram: $(BASES) $(EXTS) $(MEMS)

%.base.bin: %.mem gen_bin
	./gen_bin $< $(basename $<).ext.bin $(basename $<).base.bin

%.ext.bin: %.base.bin

%.om: %.s
	$(ARCH)-as -mips32 -EB $< -o $@ 

%.mem: %.om
	$(ARCH)-objcopy --dump-section .text=/dev/stdout $< | xxd -c 4 -g 32 | cut -f 2 -d " " > $@

gen_bin: gen_bin.cpp
	g++ -Wall -Werror -o gen_bin gen_bin.cpp

clean:
	rm *.mem *.ans gen_bin *.bin || true
