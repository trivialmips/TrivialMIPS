#include "mips.h"

int _entry()
{
	send_serial_str("Hello MIPS!\n");
	send_serial_str("This is a message sent by code compiled from C++!\n");
	register unsigned now_val = 0, count = 0;
	while(1)
	{
		if(now_val != get_switches())
		{
			set_segment_displays(++count);
			send_serial_hex(now_val = get_switches());
			send_serial_char('\n');
		}
	}
	return 0;
}
