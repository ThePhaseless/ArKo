#include <stdio.h>

#define MAX_VAL(type) ((type)((1U << (sizeof(type) * 8 - 1)) - 1))

void clearInvalidInput() {
  while (getchar() != '\n')
    ;
}

extern float exp_asm(float x, int accuracy);

int main() {
  printf("Exponential calculator");
  do {
    float x;
    unsigned int accuracy, isInputValid;
    printf("\nExponent: ");
    isInputValid = scanf("%f", &x);

    if (isInputValid == 0) {
      printf("Couldn't parse x!\n");
      clearInvalidInput();
      continue;
    } else if (x < 0 || x > MAX_VAL(float)) {
      printf("Value of x must be greater than 0 and less than %f\n",
             MAX_VAL(float));
      continue;
    }

    printf("Input accuracy (number of taylor series terms)\n");
    printf("Value: ");
    isInputValid = scanf("%d", &accuracy);

    if (isInputValid == 0) {
      printf("Couldn't parse accuracy!\n");
      clearInvalidInput();
      continue;
    } else if (accuracy < 0 || accuracy >= MAX_VAL(unsigned int)) {
      printf("Accuracy must be greater than 0 and less than %d\n",
             MAX_VAL(unsigned int));
      continue;
    }

    float result = exp_asm(x, accuracy);
    printf("e^x = ~%f\n", result);

    printf("Continue? (y/n) ");
    char c;
    scanf(" %c", &c);
    if (c != 'y' && c != 'Y') {
      break;
    }
  } while (1);

  return 0;
}