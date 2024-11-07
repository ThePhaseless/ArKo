section .txt
	org 100H

start:
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx

    mov si, text
    dec si

    jmp print_loop

print_loop:
    inc si

    mov dl, [si]
    cmp dl, skip1
    je print_loop

    cmp dl, skip2
    je print_loop

    cmp dl, '$'
    je end

    mov ah, 2
    mov dl, [si]
    int 21h

    jmp print_loop

end:
    mov ah, 4Ch
    int 21h

section .data
    text db "abbacadaddac$"
    skip1 db 'c'
    skip2 db 'd'