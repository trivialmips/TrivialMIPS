int result[1000];
int *bubble_sort(int *a, int N) {
    int m;
    for(m = 0; m <= N; m++) {
        result[m] = a[m];
    }

	int i, j, t;
	for(j = 0; j < N; j ++) {
		for(i = 0; i < N - 1 - j; i ++) {
			if(result[i] > result[i + 1]) {
				t = result[i];
				result[i] = result[i + 1];
				result[i + 1] = t;
			}
		}
	}
    return result;
}
