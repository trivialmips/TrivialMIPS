srcs=$(wildcard *.c)
objs=$(srcs:.c=.o) 

libtinyc.a: $(objs)
	$(CROSS_COMPILE)$(AR) -cr $@ $^

clean:
	rm -f *.o *.a *.s

-include rules.make
