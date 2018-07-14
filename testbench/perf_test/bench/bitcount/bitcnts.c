/* +++Date last modified: 05-Jul-1997 */

/*
**  BITCNTS.C - Test program for bit counting functions
**
**  public domain by Bob Stout & Auke Reitsma
*/

#include <stdio.h>
#include "conio.h"
#include "bitops.h"

#define FUNCS  7

static int CDECL bit_shifter(long int x);

unsigned long get_count(void);
unsigned long get_ns(void);

unsigned long myrand()
{
    unsigned long lfsr = 0xACE1u;
    unsigned long bit;

    bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
    return lfsr =  (lfsr >> 1) | (bit << 15);
}

int bitcnts(int argc, long argv)
{
	unsigned long start_ns = 0;
	unsigned long stop_ns = 0;
 
	unsigned long ct, cmin = 0xffffffffffffffff, cmax = 0;
	int i, cminix, cmaxix;
	long j, n, seed;
	int iterations;

static int (* CDECL pBitCntFunc[FUNCS])(long) = {
  bit_count,
  bitcount,
  ntbl_bitcnt,
  ntbl_bitcount,
  /*            btbl_bitcnt, DOESNT WORK*/
  BW_btbl_bitcount,
  AR_btbl_bitcount,
  bit_shifter
};

static char *text[FUNCS] = {
  "Optimized 1 bit/loop counter",
  "Ratko's mystery algorithm",
  "Recursive bit count by nybbles",
  "Non-recursive bit count by nybbles",
 /*            "Recursive bit count by bytes",*/
  "Non-recursive bit count by bytes (BW)",
  "Non-recursive bit count by bytes (AR)",
  "Shift and count bits"
};

	iterations=(int)argv;
	puts("Bit counter algorithm benchmark\n");
	start_ns = get_ns();
 
	for (i = 0; i < FUNCS; i++) {
		for (j = n = 0, seed = myrand(); j < iterations; j++, seed += 13)
		{
			n += pBitCntFunc[i](seed);
    	}
	}
    stop_ns = get_ns();
    ct = (stop_ns - start_ns);

	return n;
}

static int CDECL bit_shifter(long int x)
{
  int i, n;
  
  for (i = n = 0; x && (i < (sizeof(long) * CHAR_BIT)); ++i, x >>= 1)
    n += (int)(x & 1L);
  return n;
}

