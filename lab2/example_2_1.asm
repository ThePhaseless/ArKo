section .txt          ; Sekcja tekstowa zawierająca instrukcje programu
	org 100h         ; Punkt początkowy programu w pamięci (dla programu COM)

start:                ; Etykieta, która będzie punktem startowym programu

section .data         ; Sekcja danych, gdzie definiujemy zmienne
	first db 55       ; Zmienna first przechowuje wartość 55 w jednym bajcie (typ db)
	second db 3565667H ; Zmienna second przechowuje wartość w jednym bajcie (tylko najmłodszy bajt wartości 3565667H zostanie zapisany)
	third resb 3      ; Rezerwacja 3 bajtów pamięci dla zmiennej third (bez inicjalizacji)
	fourth db 0FFH    ; Zmienna fourth przechowuje wartość 0xFF (255 dziesiętnie) w jednym bajcie
	fifth dq 3.1415   ; Zmienna fifth przechowuje wartość 3.1415 w formacie 64-bitowym (8 bajtów)

	; db -> 1 bajt
	; dw -> 1 słowo, 2 bajty
	; dd -> 2 słowa, 4 bajty
	; df -> 3 słowa, 6 bajtów
	; dq -> 4 słowa, 8 bajtów
	; dt -> 5 słów, 10 bajtów