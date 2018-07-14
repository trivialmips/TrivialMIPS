CC = mipsel-linux-gcc
LD = mipsel-linux-ld
OBJCOPY = mipsel-linux-objcopy
OBJDUMP = mipsel-linux-objdump
AR = mipsel-linux-ar

AFLAGS= -G 0 -fno-pic -pipe -mno-abicalls -EL -mips1
CFLAGS= -O3 -mno-abicalls -funroll-all-loops -falign-jumps=16 -falign-functions=16 -fgcse-sm -fgcse-las -finline-functions -finline-limit=1000 -msoft-float -EL -march=mips1 -mips1
CFLAGS+= -I ../../include -include stdio.h -DCOREMARK_LOOP=1
CFLAGS+= -I. -DFLAGS_STR=\"$(FLAGS_STR)\"
CFLAGS+= -G8

all:link
	$(AR) -cr coremark.a $(patsubst %.c, %.o, $(wildcard *.c))
	echo "job done"
	
ifndef $(ITERATIONS)
ITERATIONS=0
endif

CFLAGS+= -DITERATIONS=$(ITERATIONS) -static

CORE_FILES=core_list_join core_main core_matrix core_state core_util core_portme shell
ORIG_SRCS=$(addsuffix .c,$(CORE_FILES))
OEXT=.o
SRCS=$(ORIG_SRCS)
OBIS=$(addsuffix $(OEXT), $(CORE_FILES))
HEADERS=coremark.h
.PHONY:compile link
compile: $(OPATH) $(SRCS) $(HEADERS)
		$(CC) $(CFLAGS) -c $(SRCS)
link:compile
	@echo "link performed along with compile"
.PHONY:clean
clean:
	rm -rf *.o
	rm -rf *.a
