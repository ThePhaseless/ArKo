#include <stdio.h>

// Każdy projekt powinien posiadać interfejs napisany
// w języku C (wprowadzanie danych z klawiatury, wypisywanie
// ich na ekran, nieskończona pętla programu itp.) oraz mieć
// logikę biznesową napisaną w asemblerze z wykorzystaniem
// FPU. Dodatkowo, każdy projekt powinien móc przyjąć
// dodatkowy argument w postaci liczby miejsc po przecinku, do
// której ma być zaokrąglony wynik. Liczbę tę podaje użytkownik
// z klawiatury.
// Napisać program, który oblicza e^x, gdzie x jest
// argumentem podanym przez użytkownika.

void clearInvalidInput() {
  while (getchar() != '\n')
    ;
}

extern float exp_asm(float x, int accuracy) asm(
    "exp_asm"); // Explicitly tell GCC name of the asm function to use

int main() {
  const float FLT_MAX = 3.40282347e+38F;              // Taken from lib
  const unsigned int UINT_MAX = 2147483647 * 2U + 1U; // Taken from lib

  printf("Exponential calculator");
  do {
    long double x;
    unsigned int accuracy, isInputValid;
    printf("\nExponent: ");
    isInputValid = scanf("%Lf", &x);

    if (isInputValid == 0) {
      printf("Couldn't parse x!\n");
      clearInvalidInput();
      continue;
    } else if (x < -FLT_MAX || x > FLT_MAX) {
      printf("Value of x must be greater than %f and less than %f\n", -FLT_MAX,
             FLT_MAX);
      continue;
    }

    printf("Input accuracy (number of taylor series terms)\n");
    printf("Value: ");
    isInputValid = scanf("%d", &accuracy);

    if (isInputValid == 0) {
      printf("Couldn't parse accuracy!\n");
      clearInvalidInput();
      continue;
    } else if (accuracy < 0 || accuracy > UINT_MAX) {
      printf("Accuracy must be greater than 0 and less than %d\n", UINT_MAX);
      continue;
    }

    float result = exp_asm(x, accuracy);
    printf("e^x = ~%.*f\n", accuracy, result);

    printf("Continue? (y/n) ");
    char c;
    scanf(" %c", &c);
    if (c != 'y' && c != 'Y') {
      break;
    }
  } while (1);

  return 0;
}