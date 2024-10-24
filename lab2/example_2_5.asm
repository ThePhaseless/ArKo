; inv = into variable  ; Komentarz opisujący, że instrukcje będą wstawiać wartości do zmiennej

section .txt              ; Sekcja tekstowa z instrukcjami programu
	mov word [value], 50   ; Ustawia wartość 50 (słowo, 2 bajty) w zmiennej 'value'

	; alternatywnie        ; Komentarz sugerujący, że poniższy kod osiąga to samo w inny sposób

	mov al, 50             ; Ładuje wartość 50 do rejestru AL (8-bitowy rejestr)
	mov [value], al        ; Przechowuje wartość z rejestru AL (50) w zmiennej 'value' (1 bajt)

section .data             ; Sekcja danych, gdzie definiujemy zmienne
	value db 36             ; Zmienna 'value' zainicjalizowana wartością 36 (1 bajt)
