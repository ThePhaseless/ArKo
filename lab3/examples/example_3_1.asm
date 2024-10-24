section .txt              ; Sekcja tekstowa z instrukcjami programu
	org 100h             ; Ustawienie punktu początkowego programu w pamięci (dla programu COM)

start:
	mov cx, 5            ; Ustawienie rejestru CX na 5 - liczba powtórzeń pętli

my_loop:
	mov ah, 9            ; Ustawienie rejestru AH na 9 - funkcja DOS do wyświetlania łańcucha zakończonego znakiem '$'
	mov dx, text         ; Załadowanie adresu łańcucha 'text' do rejestru DX
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie łańcucha 'text'

	mov dx, new_line     ; Załadowanie adresu 'new_line' (znaki nowej linii) do rejestru DX
	int 21h              ; Wywołanie przerwania DOS 21h - dodanie nowej linii (CRLF)

	loop my_loop         ; Zmniejsza CX o 1 i skacze do 'my_loop', jeśli CX != 0

	mov ah, 4Ch          ; Ustawienie AH na 4Ch - funkcja DOS 4Ch do zakończenia programu
	int 21h              ; Wywołanie przerwania DOS 21h - zakończenie programu

section .data             ; Sekcja danych zawierająca zmienne
	text db "test$"        ; Łańcuch tekstowy do wyświetlenia, zakończony znakiem '$'
	new_line db 13, 10, 36 ; Zmienna 'new_line' zawiera znaki powrotu karetki (CR) i nowej linii (LF), zakończone znakiem '$'
