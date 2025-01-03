#include <stdio.h>

extern char *process_string(char *str, int len);

extern int count_chars(char *str);

int count_len(char *str)
{
	int len = 0;
	while (str[len] != '\0')
	{
		len++;
	}
	return len;
}

void print_line()
{
	printf("\n");
}

int main()
{
	int len;
	char str[100];
	print_line();

	printf("Input string: ");
	scanf("%s", str);

	len = count_chars(str);
	printf("Before: %s len: %d", str, len);
	print_line();

	process_string(str, len);
	printf(" After: %s", str);
	print_line();

	printf("Count chars: %d", count_chars(str));
	print_line();
	return 0;
}