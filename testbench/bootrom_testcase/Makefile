SRCS=$(wildcard *.s)

COES=$(SRCS:.s=.coe) 

info:
	@echo "Please use ./build.sh, do not make directly"

coe: $(COES) 

%.om: %.s
	$(ARCH)-as -mips32 -EB $< -o $@ 

%.mem: %.om
	$(ARCH)-objcopy --dump-section .text=/dev/stdout $< | xxd -c 4 -g 32 | cut -f 2 -d " " > $@

%.coe: %.mem
	sh mem_to_coe.sh $< > $@

clean:
	rm *.mem *.om *.coe || true
