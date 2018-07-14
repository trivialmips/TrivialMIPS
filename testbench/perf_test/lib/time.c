#include <time.h>

unsigned long _get_count()
{
    // TODO: the function now returns timer data, we should use CP0 to obtain accurate clock count
    volatile unsigned *const timer = (void *) 0xA4000000;
    return timer[0];
    // unsigned long _contval;
    // asm volatile(
    //     "lui  $1,0xbfd0\n\t"
    //     "ori  $1,$1,0xe000\n\t"
    //     "lw %0,0($1)\n\t"
    //     :"=r"(_contval)
    //     :
    //     :"$1"
    //     );
    // return  _contval;
}

unsigned long get_count()
{
    return  _get_count();
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

unsigned long get_ns(void)
{
    unsigned long n=0;
//    n=get_clock();
    asm(
        "mfc0 %0,$9\n\t"
        :"=r"(n)
        );
    n=2*n*(NSEC_PER_USEC/CPU_COUNT_PER_US);
    return n;
}
