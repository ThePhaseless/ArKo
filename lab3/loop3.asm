section .txt
    org 100h

start:
    mov si, text ; si - registry for strings outside of input/output

    mov ah, 2
    mov dl, [si+0]
    int 21h

    mov ah, 2
    mov dl, [si+1]
    int 21h

    mov ah, 2
    mov dl, [si+2]
    int 21h

    mov ah, 2
    mov dl, [si+3]
    int 21h

    mov ah, 2
    mov dl, [si+4]
    int 21h

    mov ah, 4ch ; return code
    int 21h

section .data
    text db "test$"
    new_line db 13, 10, 36