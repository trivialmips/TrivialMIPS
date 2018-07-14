#include <time.h>
#include <machine.h>

unsigned long get_count(void);

void shell(void)
{
    unsigned long start_count = 0;
    unsigned long stop_count = 0;
    unsigned long total_count = 0;

    start_count = get_count();
    int err_cnt = search_small();
    stop_count = get_count();
    total_count = stop_count - start_count;

    *((int *)NUM_ADDR) = total_count;  
	if(err_cnt == 0){
		*((int *)LED_RG1_ADDR) = 1;  
	    *((int *)LED_RG0_ADDR) = 1;  
    	*((int *)LED_ADDR)     = 0xffff;  
	}else{
		*((int *)LED_RG1_ADDR) = 1;  
	    *((int *)LED_RG0_ADDR) = 2;  
    	*((int *)LED_ADDR)     = 0;
	}

	printf("Error count: %d\n", err_cnt);

    return;
}
