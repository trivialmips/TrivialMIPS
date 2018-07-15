
#ifndef __MIPS_H__
#define __MIPS_H__

#define SERIAL_ADDR 0xa3000000
#define GPIO_ADDR 0xa6000000
#define TIMER_ADDR 0xa4000000
#define MEM_ADDR 0x80000000
#define LOAD_ENTRY(var, addr) \
	volatile unsigned *const var = reinterpret_cast<volatile unsigned *const>(addr)
#define LOAD_SERIAL_ENTRY(var) LOAD_ENTRY(var, SERIAL_ADDR)
#define LOAD_GPIO_ENTRY(var) LOAD_ENTRY(var, GPIO_ADDR)
#define LOAD_MEMORY_ENTRY(var) \
	unsigned char *const var = reinterpret_cast<unsigned char *const>(MEM_ADDR)

inline void send_serial_char(unsigned char c)
{
	LOAD_SERIAL_ENTRY(serial_entry);
	while(!(serial_entry[0] & 1));
	if(c) serial_entry[1] = c;
}

inline bool is_serial_ready_to_read()
{
	LOAD_SERIAL_ENTRY(serial_entry);
	return serial_entry[0] & 2;
}

inline unsigned read_serial_char()
{
	LOAD_SERIAL_ENTRY(serial_entry);
	while(!is_serial_ready_to_read());
	return serial_entry[1];
}

inline int read_serial_line(char *buf, char terminator='\0')
{
	int num = 0;
	while((buf[num] = read_serial_char()) != terminator) ++num;
	buf[num] = 0;
	return num;
}

inline void send_serial_string(const char *str)
{
	for(int i = 0; str[i]; ++i)
		send_serial_char(str[i]);
}

inline void send_serial_hex(unsigned v)
{
	send_serial_char('0');
	send_serial_char('x');
	for(int i = 7; i >= 0; --i)
	{
		unsigned char c = (v >> (i << 2)) & 0xf;
		c = (c < 10) ? c + '0' : c + 'a' - 10;
		send_serial_char(c);
	}
}


inline void send_serial_integer_unsigned(unsigned v)
{
	if (v != 0){
		send_serial_integer_unsigned(v / 10);
		send_serial_char((v % 10) + '0');
	}
}


inline void send_serial_integer(int v)
{
	if(v < 0) {
		send_serial_char('-');
		send_serial_integer_unsigned(-v);
	} else if(v > 0) {
		send_serial_integer_unsigned(v);
	} else {
		send_serial_char('0');
	}
}


namespace __impl
{
	template<unsigned... I> struct unsigned_sequence { };
	
	template<unsigned N, unsigned... I>
	struct maker {
		typedef typename maker<N - 1, N - 1, I...>::type type;
	};

	template<unsigned... I>
	struct maker<0, I...> {
		typedef unsigned_sequence<I...> type;
	};

	template<typename... Pack>
	inline void send_serial_str_unpack(unsigned char a, Pack... pack)
	{
		send_serial_char(a);
		send_serial_str_unpack(pack...);
	}

	template<>
	inline void send_serial_str_unpack(unsigned char a)
	{
		send_serial_char(a);
	}

	template<unsigned N, unsigned... I>
	inline void send_serial_str_arr(const char (&str)[N], unsigned_sequence<I...>)
	{
		send_serial_str_unpack(str[I]...);
	}
}

/* send a literal string without using memory to store it */
template<unsigned N>
inline void send_serial_str(const char (&str)[N])
{
	typedef typename __impl::maker<N>::type type;
	__impl::send_serial_str_arr(str, type{});
}

inline unsigned get_switches()
{
	LOAD_GPIO_ENTRY(gpio_entry);
	return gpio_entry[0];
}

inline void set_segment_displays(unsigned char v)
{
	LOAD_GPIO_ENTRY(gpio_entry);
	gpio_entry[1] = static_cast<unsigned>(v) | 0x80000000u;
}

inline void set_leds(unsigned short v)
{
	LOAD_GPIO_ENTRY(gpio_entry);
	gpio_entry[2] = static_cast<unsigned>(v);
}

#endif
