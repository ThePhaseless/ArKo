section .txt              ; Sekcja z kodem programu
	org 100h             ; Punkt początkowy programu w pamięci (dla programu COM)

start:
	mov ah, 2            ; Ustawienie rejestru AH na 2 - funkcja DOS do wyświetlania pojedynczego znaku
	mov dx, [array + 0]  ; Załadowanie pierwszego elementu z tablicy 'array' do rejestru DX (pierwsze 2 bajty)
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku z DX

	mov ah, 2            ; Powtórzenie kroku dla kolejnego znaku
	mov dx, [array + 2]  ; Załadowanie drugiego elementu z tablicy (następne 2 bajty)
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku

	mov ah, 2            ; Powtórzenie kroku dla kolejnego znaku
	mov dx, [array + 4]  ; Załadowanie trzeciego elementu z tablicy
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku

	mov ah, 2            ; Powtórzenie kroku dla ostatniego znaku
	mov dx, [array + 6]  ; Załadowanie czwartego elementu z tablicy
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku

	mov ax, 4c00h        ; Funkcja DOS 4Ch - zakończenie programu
	int 21h              ; Wywołanie przerwania DOS 21h - zakończenie programu

section .data             ; Sekcja danych programu
	array dw 78, 65, 83, 77 ; Tablica 'array' zawiera wartości dwubajtowe (słowa):
	                       ; 78 -> 'N' (ASCII)
	                       ; 65 -> 'A' (ASCII)
	                       ; 83 -> 'S' (ASCII)
	                       ; 77 -> 'M' (ASCII)
