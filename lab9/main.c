#include <stdio.h>

extern char *process_string(char *str, int i);

// Zwiększ stringa o i
int main()
{
	int i;
	char str[8];
	printf("%s", "Input string: ");
	scanf("%s", str);

	printf("%s", "Input i: ");
	scanf("%d", &i);

	printf("Output string: ");
	printf("%s", process_string(str, i));
	return 0;
}