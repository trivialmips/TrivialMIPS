int putchar(int c)
{
tgt_putchar(c);
return 0;
}

void tgt_putchar(c)
{
    volatile unsigned *const serial_entry = (void *) 0xA3000000;
    while(!(serial_entry[0] & 1));
	if(c) serial_entry[1] = c;
}
