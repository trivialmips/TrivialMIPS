#include <machine.h>
#include <time.h>

void shell(void)
{
    unsigned long start_count = 0;
    unsigned long stop_count = 0;
    unsigned long total_count = 0;

    start_count = get_count();
    int r = dhrystone(RUNNUMBERS);
    stop_count = get_count();
    total_count = stop_count - start_count;
	if(r == 0){
		*((int *)LED_RG1_ADDR) = 1;  
		*((int *)LED_RG0_ADDR) = 1;  
		*((int *)LED_ADDR)     = 0xffff;  
	}else{
		*((int *)LED_RG1_ADDR) = 1;  
		*((int *)LED_RG0_ADDR) = 2;  
		*((int *)LED_ADDR)     = 0;

	}

    *((int *)NUM_ADDR) = total_count;  

    return;
}
