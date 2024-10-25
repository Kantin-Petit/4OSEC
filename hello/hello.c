#include <stdio.h>

int main(int argc, char* const argv[]) {
	char* addr = &argv[1];
	printf("Hello p, %p\n", addr);
	printf("Hello s&, %s\n", &addr);
	printf("Hello i, %i\n", argv[1]);
	printf("Hello s, %s\n", argv[1]);
	return 0;
};
