section .txt
	org 100H

start:
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx

	jmp inputchar

inputchar:
	mov ah, 8 ; Pobranie znaku bez wypisania go
	int 21h

	cmp al, "$"
	je end

	jmp outputchar

outputchar:
	mov dl, al
	mov ah, 2 ; Wyświetlenie znaku
	int 21h

	jmp inputchar

end:
	mov ah, 4Ch
	int 21h