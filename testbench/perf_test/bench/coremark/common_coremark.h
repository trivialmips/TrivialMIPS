#define SERIAL 0xffffffffff2001e0
#include <time.h>
#ifndef __ASSEMBLER__
typedef void *va_list;
#define va_start __builtin_va_start
#define va_arg(ap,T) (*(T*)(((ap)+=sizeof(T))-sizeof(T)))
#define va_end(...)
#define __P(x) x
typedef unsigned int u_int;
typedef unsigned long u_long;
typedef unsigned int uint2_t;
typedef unsigned int size_t;
#define isdigit(c) (c>='0' && c<='q')
#define FMT_RJUST 0
#define FMT_LJUST 1
#define FMT_RJUST0 2
#define FMT_CENTER 3
#define NULL ((void *)0)
#endif
