global _mmx1
section .text
	
_mmx1:
	;movd MM0, [first]	; mov 32-bit value
	;movq mm0, [arr_first]	; mov 64-bit value
	
	;paddb mm0, [arr_second]	; add 8-bit integers
	;paddw MM0, MM1	; add 16-bit integers
	;paddd MM0, MM1	; add 32-bit integers

	; Arguments:
	; str: [esp + 4]
	
	movq mm0, [arr_first]
	paddb mm0, [arr_second]
	movq [arr_result], mm0
	;mov [arr_result], mm0
	mov eax, arr_result
	ret
	
section .data
	arr_first times 8 db 97
	arr_second times 8 db 4
	arr_result times 8 db 0
	