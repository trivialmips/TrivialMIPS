#include <machine.h>
#include <time.h>

void shell(void)
{
    unsigned long start_count = 0;
    unsigned long stop_count = 0;
    unsigned long total_count = 0;

    start_count = get_count();
    int n = bitcnts(1, 100);
    stop_count = get_count();
    total_count = stop_count - start_count;
	*((int *)LED_RG1_ADDR) = 1;  
    *((int *)LED_RG0_ADDR) = 1;  
    *((int *)LED_ADDR)     = 0xffff;  
    *((int *)NUM_ADDR) = total_count;  
	printf(" Count: %lu ; Bits: %ld\n", total_count, n);

    return;
}
