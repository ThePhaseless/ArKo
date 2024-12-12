global _mmx2
section .text

_mmx2:
	movq mm0, [arr_first]
	paddb mm0, [arr_second]
	movq [arr_result], mm0

	mov cx, 16
	mov ah, 2
	mov eax, arr_result
	ret

my_loop:
	mov dx, [si]
	int 21h

	inc si
	loop my_loop

	mov eax, arr_result
	ret


section .data
	arr_first times 8 db 97
	arr_second db 0, 1, 2, 3, 4, 5, 6, 7
	arr_result times 36 db 36