#include <machine.h>
#include <time.h>

void shell(void) {

    TIMER_BEGIN

    int r = sha_driver();

    TIMER_END

	if (r == 0) { 
		printf("The result is right\n");
	} else {
		printf("The result is wrong\n");
	}

    TIMER_PRINT

    return;
}
