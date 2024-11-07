section .data
    ; Zmienna do wypisania
    number db 1            ; Przykładowa 3-cyfrowa liczba (8-bitowa)
    msg db "Liczba: $", 0    ; Komunikat do wyświetlenia
    newline db 13, 10, "$"   ; Nowa linia

section .text
    org 100h                 ; Ustawienie adresu początkowego dla programu .COM

start:
    ; ; Wyświetlenie komunikatu
    ; mov ah, 9                ; Funkcja 9: wyświetlenie łańcucha
    ; mov dx, msg              ; Adres łańcucha
    ; int 21h                  ; Wywołanie przerwania DOS

    ; Konwersja liczby na tekst
    mov ah, [number]           ; Wczytanie liczby do rejestru AL
    ; mov bl, 10               ; Podstawa (10) dla konwersji dziesiętnej

    ; ; Ustalamy pierwszą cyfrę
    ; xor cx, cx               ; Zerowanie licznika cyfr
    ; mov cx, 100              ; Ustalamy 100 dla pierwszej cyfry
    ; div cx                   ; AL = AL / 100, AH = AL % 100
    ; add al, '0'              ; Konwersja na ASCII
    ; mov ah, 2                ; Funkcja 2: wypisanie znaku
    ; int 21h                  ; Wywołanie przerwania DOS

    ; ; Druga cyfra
    ; mov cx, 10               ; Ustalamy 10 dla drugiej cyfry
    ; div cx                   ; AL = AL / 10, AH = AL % 10
    ; add al, '0'              ; Konwersja na ASCII
    ; mov ah, 2                ; Funkcja 2: wypisanie znaku
    ; int 21h                  ; Wywołanie przerwania DOS

    ; Trzecia cyfra
    add ah, '0'              ; Konwersja na ASCII
    mov ah, 2                ; Funkcja 2: wypisanie znaku
    int 21h                  ; Wywołanie przerwania DOS

    ; ; Dodanie nowej linii
    ; mov ah, 9                ; Funkcja 9: wyświetlenie łańcucha
    ; mov dx, newline          ; Adres nowej linii
    ; int 21h                  ; Wywołanie przerwania DOS

    ; Zakończenie programu
    mov ah, 4Ch              ; Funkcja 4Ch: zakończenie programu
    int 21h                  ; Wywołanie przerwania DOS
