#define LED_ADDR                0xbfd0f000
#define LED_RG0_ADDR            0xbfd0f004
#define LED_RG1_ADDR            0xbfd0f008
#define NUM_ADDR                0xbfd0f010

#include <time.h>
unsigned long get_count(void);
unsigned long get_ns(void);
void shell(void)
{
    unsigned long start_count = 0;
    unsigned long stop_count = 0;
    unsigned long total_count = 0;

    start_count = get_count();
    int err = crc32();
    stop_count = get_count();
    total_count = stop_count - start_count;
	if(err == 0){
		*((int *)LED_RG1_ADDR) = 1;  
		*((int *)LED_RG0_ADDR) = 1;  
		*((int *)LED_ADDR)     = 0xffff;  
		printf("The result is right\n");
	}else{
		*((int *)LED_RG1_ADDR) = 1;  
		*((int *)LED_RG0_ADDR) = 2;  
		*((int *)LED_ADDR)     = 0;
		printf("The result is wrong\n");
	}

    *((int *)NUM_ADDR) = total_count;  

    return;
}
