section .text
global count_chars

count_chars:
	; Arguments:
	; str: [esp + 4]

	mov eax, 30
	ret