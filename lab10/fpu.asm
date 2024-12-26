section .text

global fpuTest

fpuTest:
	push ebp
	mov ebp, esp

	%idefine value [ebp + 8]

	finit				; inicjalizacja stosu FPU
	fld dword value
	fld dword [first]	; ładowanie zmiennej na stos
	;fldz				; ładowanie zera na stos
	;fld1				; ładowanie jedynki na stos
	fld dword [second]	; ładowanie wartości na stos

	; st0 = second 	(0.5)
	; st1 = first 	(2.5)
	; st2 = user input

	fadd st1			; dodanie st1 do st0
	fmul st2			; przemnożenie st0 przez st2
	fsub st1			; odjęcie st1 od st0
	;fxch st2			; zamiana st0 z st2
	;fdiv st2			; podzielenie st0 przez st2
	;fsub st2			; odjęcie st2 od st0
	;fsub st1			; odjęcie st1 od st0
	;fmul st1			; przemnożenie st0 przez st1
	;fdiv st1			; podzielenie st0 przez st1
	;fsubr st1			; odjęcie st0 od st1
	;fdivr st1			; podzielenie st1 przez st0

	leave
	ret

section .data
	first dd 2.5
	second dd 0.5