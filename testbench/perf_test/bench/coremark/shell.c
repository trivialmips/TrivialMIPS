#include <machine.h>
#include <time.h>

void shell() {
    
	TIMER_BEGIN

	int r = core_mark(0,0,0x66,COREMARK_LOOP,7,1,2000);

    TIMER_END

    TIMER_PRINT

    return;
}
