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

_start:
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	mov sp, bp

	call menu

start:
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
	mov sp, bp

	call new_line
	jmp input

menu:
	mov dx, menu_str
	call print_str

	ret

print_str:
	push ax
	mov ah, 9
	int 21h
	pop ax

	ret

new_line:
	mov dx, new_line_str
	call print_str
	ret

input_char:
	mov ah, 1
	int 21h
	ret

input_msg:
	mov dx, input_str
	call print_str
	ret

output_char:
	push ax
	mov ah, 2
	int 21h
	pop ax
	ret

output_msg:
	mov dx, output_str
	call print_str
	ret

input:
	call input_char

	call check_space

	xor ah, ah
	push ax
	inc	cx

	cmp al, 13
	jne input

	dec cx
	call output_msg

	jmp output

check_space:
	cmp cx, 0
	jne return

	cmp al, ' '
	jne return

	jmp end

return:
	ret

output:
	cmp cx, 0
	je start

	mov dx, [bp-2]

	sub bp, 2 ; get next char
	add dx, 2 ; add 2 to char

	call output_char
	loop output

	jmp start

end:
	mov ah, 9
	mov dx, end_str
	int 21h

	call new_line

	mov ah, 4Ch
	int 21h

section .data
	menu_str db "Nacisnij spacje aby zakonczyc program lub zacznij wprowadzac znaki:$"
	input_str db "Input:  $"
	new_line_str db 10, 13, "$"
	output_str db "Output: $"
	end_str db "Nacisnieto Space, koncze...$"