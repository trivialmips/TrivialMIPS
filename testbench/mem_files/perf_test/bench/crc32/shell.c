#include <time.h>
#include <machine.h>

void shell() {

    TIMER_BEGIN

    int err = crc32();

    TIMER_END

	if (err == 0) {
		printf("The result is right\n");
	} else {
		printf("The result is wrong\n");
	}

    TIMER_PRINT

    return;
}
