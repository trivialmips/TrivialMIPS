#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv)
{
	FILE *in;
	FILE *out;

	if (argc < 3)
	{
		fprintf(stderr, "Usage: ./convert_bin binary.in coe.out\n");
		return 1;
	}

	char str_bin[256];
	char str_coe[256];
	strncpy(str_bin, argv[1], 256);
	strncpy(str_coe, argv[2], 256);

	unsigned char mem[32];

	in = fopen(str_bin, "rb");
	out = fopen(str_coe, "w");

	fprintf(out, "memory_initialization_radix = 16;\n");
	fprintf(out, "memory_initialization_vector =\n");
	while (!feof(in))
	{
		if (fread(mem, 1, 4, in) != 4)
		{
			fprintf(out, "%02x%02x%02x%02x\n", mem[3], mem[2], mem[1], mem[0]);
			break;
		}
		fprintf(out, "%02x%02x%02x%02x\n", mem[3], mem[2], mem[1], mem[0]);
	}
	fclose(in);
	fclose(out);

	return 0;
}
