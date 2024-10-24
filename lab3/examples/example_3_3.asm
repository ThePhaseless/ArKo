section .txt              ; Sekcja tekstowa z instrukcjami programu
	org 100h             ; Ustawienie punktu początkowego programu w pamięci (dla programu COM)

start:
	mov si, text          ; Załadowanie adresu łańcucha 'text' do rejestru SI

	; Wyświetlanie poszczególnych znaków z łańcucha
	mov ah, 2            ; Ustawienie rejestru AH na 2 - funkcja DOS do wyświetlania pojedynczego znaku
	mov dl, [si + 0]     ; Załadowanie pierwszego znaku z 'text' do rejestru DL
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku

	mov ah, 2            ; Ustawienie rejestru AH na 2 (ponownie, dla kolejnego znaku)
	mov dl, [si + 1]     ; Załadowanie drugiego znaku z 'text' do rejestru DL
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku

	mov ah, 2            ; Ustawienie rejestru AH na 2 (ponownie, dla kolejnego znaku)
	mov dl, [si + 2]     ; Załadowanie trzeciego znaku z 'text' do rejestru DL
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku

	mov ah, 2            ; Ustawienie rejestru AH na 2 (ponownie, dla kolejnego znaku)
	mov dl, [si + 3]     ; Załadowanie czwartego znaku z 'text' do rejestru DL
	int 21h              ; Wywołanie przerwania DOS 21h - wyświetlenie znaku

	mov ah, 4Ch          ; Ustawienie AH na 4Ch - funkcja DOS 4Ch do zakończenia programu
	int 21h              ; Wywołanie przerwania DOS 21h - zakończenie programu

section .data             ; Sekcja danych, gdzie definiujemy zmienne
	text db "text"         ; Łańcuch tekstowy do wyświetlenia, niezakończony znakiem '$', bo wypisujemy pojedyńcze znaki
