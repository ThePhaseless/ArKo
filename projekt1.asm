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

	jmp increase_input



prnt_new_line:
	push ax
	mov ah, 9
	mov dx, new_line
	int 21h
	pop ax
	ret

input:
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

output:
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

increase_input:
	call input_msg
	call input
	; mov al, '4'

	call prnt_new_line

	cmp al, ' '
	je end

	call output_msg

	add al, 2

	xor ah, ah
	mov dx, ax

	call output

	call prnt_new_line

	jmp increase_input

end:
	mov ah, 9
	mov dx, end_str
	int 21h

	call prnt_new_line
	mov ah, 4Ch
	int 21h

section .data
	input_str db "Input: $"
	new_line db 10, 13, "$"
	output_str db "Output: $"
	end_str db "Pressed Space, exiting...$"