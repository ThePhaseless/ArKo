; Zadanie 3:
; Napisać program, który pobiera ciąg znaków z wejścia i wypisuje na wyjściu znaki o
; kodach ASCII zwiększone o 2 w stosunku do znaków z tego ciągu. Program powinien
; móc wielokrotnie powtarzać operację z różnymi ciągami znaków oraz zakończyć
; pracę po naciśnięciu przez użytkownika klawisza SPACJA. Wykorzystać procedury i
; stos. Przewidzieć sytuacje wyjątkowe.

; Dodatkowe info:
;

section .txt
	org 100H

start:
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	mov bp,sp

	call new_line
	call input_msg
	jmp input


new_line:
	push ax
	mov ah, 9
	mov dx, new_line_str
	int 21h
	pop ax
	ret

input_char:
	mov ah, 1
	int 21h
	ret

input_msg:
	push ax
	mov ah, 9
	mov dx, input_str
	int 21h
	pop ax
	ret

output_char:
	push ax
	mov ah, 2
	int 21h
	pop ax
	ret

output_msg:
	push ax
	mov ah, 9
	mov dx, output_str
	int 21h
	pop ax
	ret

input:
	call input_char

	xor ah, ah
	push ax
	inc	cx

	cmp al, ' '
	jne input

	cmp cx, 1
	je start

	dec cx ; remove
	call new_line
	call output_msg

	jmp output

output:
	mov dx , [bp-2]

	sub bp, 2 ; get next char

	add dx, 2
	call output_char

	loop output

	jmp start

section .data
	input_str db "Input:  $"
	new_line_str db 10, 13, "$"
	output_str db "Output: $"
	end_str db "Pressed Space, exiting...$"