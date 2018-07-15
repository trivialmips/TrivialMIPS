#include <time.h>
#include <machine.h>

void shell(void) {

    TIMER_BEGIN

    int err_cnt = search_small();
	
    TIMER_END

	printf("Error count: %d\n", err_cnt);

	TIMER_PRINT

    return;
}
