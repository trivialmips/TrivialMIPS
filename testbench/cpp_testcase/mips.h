
#define SERIAL_ADDR 0xa3000000
#define GPIO_ADDR 0xa6000000
#define LOAD_ENTRY(var, addr) \
	volatile unsigned *const var = reinterpret_cast<volatile unsigned *const>(addr)
#define LOAD_SERIAL_ENTRY(var) LOAD_ENTRY(var, SERIAL_ADDR)
#define LOAD_GPIO_ENTRY(var) LOAD_ENTRY(var, GPIO_ADDR)

inline void send_serial_char(unsigned char c)
{
	LOAD_SERIAL_ENTRY(serial_entry);
	while(!(serial_entry[0] & 1));
	if(c) serial_entry[1] = c;
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

void __attribute__ ((noinline)) send_serial_integer(int v)
{
	if(v < 0) 
	{
		send_serial_char('-');
		send_serial_integer(-v);
	} else if(v != 0) {
		send_serial_integer(v / 10);
		send_serial_char((v % 10) + '0');
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
