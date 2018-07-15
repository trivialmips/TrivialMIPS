#include "mips.h"

inline unsigned rand(unsigned &rand_seed)
{
	return rand_seed = (rand_seed * 16807L) % ((1u << 31) - 1);
}

template<typename Type>
inline void test()
{
	unsigned rand_seed;

	volatile Type* mem = reinterpret_cast<volatile Type *>(MEM_ADDR);

	rand_seed = 23;
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
		mem[i] = rand(rand_seed);

	rand_seed = 23;
	for(int i = 0; i != 8 * 1024 * 1024 / sizeof(Type); ++i)
		if(mem[i] != static_cast<Type>(rand(rand_seed)))
		{
			send_serial_str("Error at ");
			send_serial_hex(MEM_ADDR + i * sizeof(Type));
			send_serial_str("\n");
			break;
		}
}

int _entry()
{
	send_serial_str("Testing memory by word!\n");
	test<unsigned>();
	send_serial_str("OK!\n");
	send_serial_str("Testing memory by short!\n");
	test<unsigned short>();
	send_serial_str("OK!\n");
	send_serial_str("Testing memory by byte!\n");
	test<unsigned char>();
	send_serial_str("OK!\n");

	return 0;
}
