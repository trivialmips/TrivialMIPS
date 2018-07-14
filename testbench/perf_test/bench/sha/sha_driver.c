/* NIST Secure Hash Algorithm */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "sha.h"

extern char* str;

int sha_driver()
{
    FILE *fin;
    SHA_INFO sha_info;

	fin = fopen(str);
	sha_stream(&sha_info, fin);
	sha_print(&sha_info);
	LONG ans[5] = {437358104, 2057077515, 2988414705, 3742976831, 2079096471};
	fclose(fin);
	int i;
	int r = 0;
	for(i=0;i<5;i++){
		printf("%lu : %lu\n", sha_info.digest[i], ans[i]);
		if(sha_info.digest[i] != ans[i]){
			r = 1;
			break;
		}
	}
	return r;
}
