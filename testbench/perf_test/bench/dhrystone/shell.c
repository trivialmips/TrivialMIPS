#include <machine.h>
#include <time.h>

void shell(void) {

    TIMER_BEGIN

    int r = dhrystone(RUNNUMBERS);

    TIMER_END

    TIMER_PRINT

    return;
}
