#include <machine.h>

int putchar(int c)
{
	tgt_putchar(c);
	return 0;
}

void tgt_putchar(c)
{
    volatile unsigned *const uart_status = (void *) UART_STATUS_ADDR;
	volatile unsigned *const uart_data = (void *) UART_DATA_ADDR;
    while(!(*uart_status & 1));
	if(c) *uart_data = c;
}
