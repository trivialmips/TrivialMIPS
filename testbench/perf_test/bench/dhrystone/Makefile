CC = mipsel-linux-gcc
CFLAGS= -O3 -mno-abicalls -funroll-all-loops -falign-jumps=16 -falign-functions=16 -fgcse-sm -fgcse-las -finline-functions -finline-limit=1000 -msoft-float -EL -march=mips1 -mips1
CFLAGS+= -G8 -DTIME -DRUNNUMBERS=100
CFLAGS+= -I ../../include -include stdio.h

all:link
	$(AR) -cr dhrystone.a $(patsubst %.c, %.o, $(wildcard *.c))
	echo "job done"
compile:
		$(CC) $(CFLAGS) -c dhry_1.c dhry_2.c shell.c
link:compile
	@echo "link performed along with compile"
.PHONY:clean
clean:
	rm -rf *.o
	rm -rf *.f
