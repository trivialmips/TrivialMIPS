#include <fstream>
#include <string>

int main(int argc, char *argv[])
{
	std::ifstream ifs(argv[1]);
	std::ofstream ofs_odd(argv[2], std::ofstream::binary);
	std::ofstream ofs_even(argv[3], std::ofstream::binary);
	unsigned data;
	int cnt = 0;
	while(ifs >> std::hex >> data)
	{
		if(cnt & 1) 
			ofs_odd.write(reinterpret_cast<const char*>(&data), 4);
		else ofs_even.write(reinterpret_cast<const char*>(&data), 4);
		cnt++;
	}
	return 0;
}
