#include <machine.h>
#include <time.h>

void shell() {
    TIMER_BEGIN

    int n = bitcnts(1, 100);
    
    TIMER_END
	
	printf("Bits: %ld\n", n);

    TIMER_PRINT

    return;
}
