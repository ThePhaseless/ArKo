section .txt              ; Sekcja tekstowa z instrukcjami programu
	org 100h             ; Punkt początkowy programu w pamięci (dla programu COM)

start:
	; ah = 1 -> pobranie znaku z klawiatury z echem na ekran
	; ah = 8 -> pobranie znaku z klawiatury bez echa
	mov ah, 1            ; Ustawienie rejestru AH na 1 - funkcja DOS 1, pobranie znaku z echem
	int 21h              ; Wywołanie przerwania DOS 21h - czekanie na wprowadzenie znaku przez użytkownika

	; Kod poniżej mógłby być użyty do dodania nowej linii po wprowadzeniu znaku:
	; mov dx, newline     ; Załadowanie adresu 'newline' (znaki nowej linii) do rejestru DX
	; mov ah, 9           ; Ustawienie rejestru AH na 9 - funkcja DOS do wyświetlania łańcucha znaków
	; int 21h             ; Wywołanie przerwania DOS 21h - dodanie nowej linii

	mov dl, al           ; Przekazanie wprowadzonego znaku (z rejestru AL) do rejestru DL (przygotowanie do wyświetlenia)
	mov ah, 2            ; Ustawienie rejestru AH na 2 - funkcja DOS do wyświetlania pojedynczego znaku
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku w DL

	mov ax, 4c00h        ; Funkcja DOS 4Ch - zakończenie programu
	int 21h              ; Wywołanie przerwania DOS 21h - zakończenie programu

section .data             ; Sekcja danych zawierająca zmienne
	newline db 13, 10, 36 ; Zmienna 'newline' zawiera znaki powrotu karetki (CR) i nowej linii (LF), zakończone znakiem '$'
