section .txt          ; Sekcja tekstowa, która zawiera kod programu (instrukcje)
	org 100H           ; Ustalenie punktu początkowego kodu na adresie 100h (typowe dla programów .COM)

start:                ; Etykieta początkowa (oznacza początek programu)
	mov ah, 9         ; Ustawienie rejestru AH na 9 - funkcja DOS do wyświetlania łańcucha znaków
	mov dx, message   ; Załadowanie adresu początku wiadomości (adres zmiennej message) do rejestru DX
	int 21h           ; Wywołanie przerwania DOS 21h - wykonanie funkcji wyświetlania tekstu

	mov ah, 4C00h     ; Funkcja DOS 4Ch - zakończenie programu. AH = 4Ch (funkcja), AL = 00h (kod wyjścia)
	int 0x21          ; Wywołanie przerwania DOS 21h - zakończenie programu

section .data         ; Sekcja danych, gdzie umieszczamy stałe i zmienne
	message db "Hello, World!$" ; Definicja komunikatu do wyświetlenia. Znak '$' oznacza koniec łańcucha dla funkcji DOS
