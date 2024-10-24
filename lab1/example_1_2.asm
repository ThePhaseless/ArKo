section .txt              ; Sekcja z kodem programu (instrukcje)
	org 100H             ; Ustawienie punktu początkowego programu na adresie 100h

	mov ah, 9            ; Funkcja DOS 9 - wyświetlenie łańcucha zakończonego znakiem '$'
	mov dx, message      ; Załadowanie adresu zmiennej 'message' do rejestru DX
	int 21H              ; Wywołanie przerwania DOS 21h - wyświetlenie tekstu "Input text:"

	mov ah, 0ah          ; Funkcja DOS 0Ah - wprowadzenie ciągu znaków z klawiatury (do bufora w 'input')
	mov dx, input        ; Załadowanie adresu bufora 'input' do rejestru DX
	int 21H              ; Wywołanie przerwania DOS 21h - czekanie na wprowadzenie tekstu przez użytkownika

	mov ah, 9            ; Funkcja DOS 9 - wyświetlenie kolejnego łańcucha zakończonego znakiem '$'
	mov dx, greeting     ; Załadowanie adresu zmiennej 'greeting' do rejestru DX
	int 21H              ; Wywołanie przerwania DOS 21h - wyświetlenie tekstu powitalnego "Hello:"

	mov ah, 9            ; Funkcja DOS 9 - wyświetlenie wprowadzonego przez użytkownika tekstu
	mov dx, input + 2    ; Wprowadzone znaki zaczynają się od trzeciego bajtu w buforze 'input' (dlatego +2)
	int 21H              ; Wywołanie przerwania DOS 21h - wyświetlenie tekstu wprowadzonego przez użytkownika

	mov ah, 0x4C         ; Funkcja DOS 4Ch - zakończenie programu
	int 21H              ; Wywołanie przerwania DOS 21h - zakończenie działania programu


section .data             ; Sekcja danych programu
	message db "Input text: $"      ; Komunikat wyświetlany przed wprowadzeniem tekstu przez użytkownika

	input 	db 20                  ; Maksymalna liczba znaków do wprowadzenia
	        db 0                   ; Bieżąca liczba wprowadzonych znaków (na początku 0)
	        times 22 db "$"        ; Bufor na wprowadzone znaki, plus znak '$' (zapas na 20 znaków + kończący)

	greeting db 10, 13, 10, 13, "Hello: $" ; Tekst powitalny "Hello:" poprzedzony znakami nowej linii i powrotu karetki (CRLF)
