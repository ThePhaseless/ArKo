section .txt
	org 100h
	
start:
	; ah = 1 -> z echo
	; ah = 8 -> bez echo
	mov ah, 1
	int 21h
	
	;mov dx, newline
	;mov ah, 9
	;int 21h
	
	mov dl, al
	mov ah, 2
	int 21h
	
	mov ax, 4c00h
	int 21h
	
	
section .data
	newline db 13, 10, 36