section .txt              ; Sekcja tekstowa zawierająca instrukcje programu
	org 100h             ; Ustawienie punktu początkowego programu w pamięci (dla programu COM)

start:
	mov ah, 9            ; Ustawienie rejestru AH na 9 - funkcja DOS do wyświetlania łańcucha znaków zakończonego '$'
	mov dx, farray       ; Załadowanie adresu 'farray' (tablicy znaków) do rejestru DX
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie tablicy 'farray'

	mov dx, newline      ; Załadowanie adresu 'newline' (znaki nowej linii) do rejestru DX
	int 21h              ; Wywołanie przerwania DOS 21h - dodanie nowej linii (CRLF)

	mov dx, sarray       ; Załadowanie adresu 'sarray' (tablicy z wartością 78) do rejestru DX
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie tablicy 'sarray'

	mov ax, 4c00h        ; Funkcja DOS 4Ch - zakończenie programu
	int 21h              ; Wywołanie przerwania DOS 21h - zakończenie programu

section .data             ; Sekcja danych zawierająca zmienne
	newline db 13, 10, 36 ; Zmienna 'newline' zawiera znaki powrotu karetki (CR) i nowej linii (LF), zakończone znakiem '$'
	farray db 78, 65, 83, 77, 36 ; Tablica 'farray' z wartościami ASCII odpowiadającymi znakom 'N', 'A', 'S', 'M', zakończona '$'

	sarray TIMES 4 db 78  ; Zmienna 'sarray' zawiera cztery razy wartość 78 (co odpowiada znakowi 'N' w ASCII)
	       db 36          ; Zakończenie 'sarray' znakiem '$' dla funkcji DOS 9
