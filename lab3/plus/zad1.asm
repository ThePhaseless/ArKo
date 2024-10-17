section .txt
    org 100h

start:
    mov cx, 0

    mov si, text

my_loop:
    mov ah, 2
    mov dl, text[si]
    int 21h

    mov ah, 9
    mov dx, new_line
    int 21h

    inc cx ; cx = cx + 1

    cmp cx, 5 ; cx == 5
    jne my_loop ; if ^ goto my_loop

    mov ah, 4Ch
    int 21h

section .data
    text db "test$"
    text_len db 0
    new_line db 13, 10, 36