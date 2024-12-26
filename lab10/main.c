#include <stdio.h>

//extern float _fpuTest(float value);
float fpuTest(float value);

//float series(int n);
//an = 3.21*an-1 + 1.23*an-2

int main()
{
	float myValue;
	printf("Input value: ");
	scanf("%f", &myValue);
	myValue = fpuTest(myValue);
	printf("Result: %f", myValue);
	return 0;
}