SRCS=$(wildcard *.s)

MEMS=$(SRCS:.s=.mem)

info:
	@echo "Please use ./build.sh, do not make directly"

all: $(MEMS)

%.om: %.s
	$(ARCH)-as -mips32 $< -o $@

%.mem: %.om
	$(ARCH)-objcopy --dump-section .text=/dev/stdout $< | xxd -c 4 -g 32 | cut -f 2 -d " " > $@

clean:
	rm *.mem