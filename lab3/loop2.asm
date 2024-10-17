section .txt
    org 100h

start:
    mov cx, 0

my_loop:
    mov ah, 9
    mov dx, text
    int 21h

    mov dx, new_line
    int 21h

    inc cx ; cx = cx + 1
    cmp cx, 5 ; cx == 5
    jne my_loop ; if ^ goto my_loop


section .data
    text db "test$"
    new_line db 13, 10, 36