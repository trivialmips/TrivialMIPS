.SUFFIXES: .o64 .elf64 .bin64

objs= malloc.o stdio.o printf.o udelay.o now.o putchar.o puts.o printhex.o  printbase.o memcmp.o strcat.o strchr.o strcmp.o strtok.o strspn.o strcspn.o getchar.o testchar.o vsprintf.o atob.o sprintf.o strtoupp.o toupper.o string.o str_fmt.o strcpy.o strichr.o strncmp.o strncpy.o newprintf.o cache.o cmdline.o irq.o guess.o strtoul.o time.o exception.o sscanf.o

objs64=$(objs:.o=.o64)

libtinyc.a: $(objs)
	$(CROSS_COMPILE)$(AR) -cr  $@ $^

libtinyc64.a: $(objs64)
	$(CROSS_COMPILE)$(AR) -cr  $@ $^

clean:
	rm -f *.o *.a *.s *.o64 *.bin64 *.elf64

-include rules.make
