int result[1000];
int *select_sort(int *a, int N) {
    int m;
    for(m = 0; m <= N; m++) {
        result[m] = a[m];
    }

	int i, j, k, t;
	for(i = 0; i < N - 1; i ++) {
		k = i;
		for(j = i + 1; j < N; j ++) {
			if(result[j] < result[k]) {
				k = j;
			}
		}

		t = result[i];
		result[i] = result[k];
		result[k] = t;
	}
    return result;
}
