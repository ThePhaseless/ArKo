#include <stdio.h>

extern char *_mmx1(char *str);

extern char *_mmx2(char *str);

extern char *_modify(char *str, int value);

void new_line()
{
	printf("\n");
}

int main()
{
	printf("Input: ");
	char str[10];
	scanf("%s", str);
	printf("Before: %s", str);
	new_line();
	printf("After: %s", _mmx2(str));
	return 0;
}