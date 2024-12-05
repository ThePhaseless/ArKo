section .text
global count_chars

count_chars:
	; Arguments:
	; str: [esp + 4]

	mov eax, 32
	ret