#include "mips.h"

int _entry()
{
	LOAD_MEMORY_ENTRY(mem);
	for(int i = 0; i != 100; ++i)
		mem[i + 0x1000] = i;
	for(int i = 0; i != 100; ++i)
	{
		send_serial_integer(mem[i + 0x1000]);
		send_serial_char('\n');
	}
	return 0;
}
