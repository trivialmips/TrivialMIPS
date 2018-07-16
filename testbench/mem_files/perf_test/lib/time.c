#include <time.h>
#include <machine.h>

unsigned _get_count()
{
	return *((volatile unsigned *)TIMER_CYCLE_ADDR);
}

unsigned get_count()
{
    return _get_count();
}

unsigned long clock_gettime(int sel,struct timespec *tmp)
{
    unsigned long n = 0;
    n = _get_count();
    tmp->tv_nsec = n*(2*NSEC_PER_USEC/CPU_COUNT_PER_US)%NSEC_PER_USEC;
    tmp->tv_usec = (n/CPU_COUNT_PER_US*2)%USEC_PER_MSEC;
    tmp->tv_msec = (n/CPU_COUNT_PER_US*2/USEC_PER_MSEC)%MSEC_PER_SEC;
    tmp->tv_sec  = n/CPU_COUNT_PER_US*2/NSEC_PER_SEC;
    printf("clock ns=%d,sec=%d\n",tmp->tv_nsec,tmp->tv_sec);
    return 0;
}

unsigned long get_clock()
{
    unsigned long n=0;
    n=_get_count();
    return 2*n;
}

unsigned get_us() {
    return *((volatile unsigned *)TIMER_MICROSEC_ADDR);
}

unsigned long get_ns() {
    return get_us() * 1000L;
}
