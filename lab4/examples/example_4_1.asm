section .txt              ; Sekcja tekstowa z instrukcjami programu
	org 100h             ; Ustawienie punktu początkowego programu w pamięci (dla programu COM)

start:
	; ADD x, y -> x = x + y
	; Przykład:
	; mov al, 5        ; x = 5
	; add al, 3        ; x = x + 3 (al = 8)

	; SUB x, y -> x = x - y
	; Przykład:
	; mov al, 5        ; x = 5
	; sub al, 2        ; x = x - 2 (al = 3)

	; 8-bit MUL x -> ax = x * al
	; Przykład:
	; mov al, 4        ; al = 4
	; mul al           ; ax = 4 * 4 (ax = 16)

	; 16-bit MUL x -> dx:ax = x * ax
	; Przykład:
	; mov ax, 2000h    ; ax = 2000h
	; mul ax           ; dx:ax = 2000h * 2000h (wynik w dx:ax)

	; 8-bit DIV x -> al = ax / x | ah = ax % x
	; Przykład:
	; mov ax, 8        ; ax = 8
	; mov bl, 2        ; x = 2
	; div bl           ; al = 8 / 2 (al = 4), ah = 8 % 2 (ah = 0)

	; 16-bit DIV x -> ax = dx:ax / x
	; Przykład:
	; mov dx, 0       ; dzielnik niech będzie 0
	; mov ax, 8       ; ax = 8
	; mov bx, 2       ; x = 2
	; div bx           ; ax = 8 / 2 (ax = 4), dx = 8 % 2 (dx = 0)

	; INC x -> x = x + 1
	; Przykład:
	; mov al, 5        ; x = 5
	; inc al           ; x = x + 1 (al = 6)

	; DEC x -> x = x - 1
	; Przykład:
	; mov al, 5        ; x = 5
	; dec al           ; x = x - 1 (al = 4)

section .data             ; Sekcja danych
