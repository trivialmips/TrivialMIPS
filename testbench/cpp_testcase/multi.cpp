#include "mips.h"

int _entry()
{
	char A[3000], B[3000];
	int C[6000];
	for(auto &x : C) x = 0;
	send_serial_str("Ready to read!\n");
	send_serial_str("Please input two numbers, end with '.'\n");
	int la = read_serial_line(A, '.');

	send_serial_str("A = ");
	send_serial_string(A);
	send_serial_char('\n');
	int lb = read_serial_line(B, '.');
	send_serial_str("B = ");
	send_serial_string(B);
	send_serial_char('\n');

	int lc = la + lb;
	for(int k = 0; k < lc; ++k)
	{
		int v = 0;
		for(int i = 0; i < la; ++i)
		{
			if(0 <= k - i && k - i < lb)
				v += (A[la - i - 1] - '0') * (B[lb - (k - i) - 1] - '0');
		}

		C[k] = v;
	}

	for(int i = 0; i != lc; ++i)
		if(C[i] > 10)
		{
			C[i + 1] += C[i] / 10;
			C[i] %= 10;
		}

	send_serial_str("A * B = ");
	for(int i = lc - 1; i >= 0; --i)
		if(i != lc - 1 || C[i])
			send_serial_char(C[i] + '0');
	send_serial_char('\n');
	return 0;
}
