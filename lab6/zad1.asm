section .txt
	org 100H

start:
	xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx

	jmp input_char


input_char:
	mov ah, 1
	int 21h

	cmp al, "$"
	je print

	mov ah, 0
	push ax

	inc cx
	jmp input_char

print:
	pop dx
	mov ah, 2
	int 21h

	loop print

	jmp end


end:
	mov ah, 4Ch
	int 21h