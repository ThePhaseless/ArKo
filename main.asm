; Define the text section, which contains the code
section .txt   ; Start of code section
	org 100h    ; Set the origin to address 100h (for COM files, typical start)

start:
	; Print the first character from the 'farray'
	mov ah, 2           ; AH = 2, select the DOS interrupt function to display a character
	mov dx, farray      ; Load the address of 'farray' into DX
	int 21h             ; Call DOS interrupt to print the character

	; Print the '$' character (ASCII 36) which signals the end of a string in DOS
	mov ah, 2           ; AH = 2, select the DOS interrupt function to display a character
	mov dx, 36          ; Load the '$' symbol into DX
	int 21h             ; Call DOS interrupt to display '$'

	; Print the '1' character (ASCII 1)
	mov ah, 2           ; AH = 2, select the DOS interrupt function to display a character
	mov dx, 1           ; Load the character value '1' (non-printable) into DX
	int 21h             ; Call DOS interrupt to print the character

	; Exit the program and return control to DOS
	mov ax, 4c00h       ; AX = 4C00h, DOS interrupt function to terminate program
	int 21h             ; Call DOS interrupt to terminate

; Define the data section, which contains initialized data
section .data   ; Start of initialized data section

	; Declare an array of 5 bytes with specific values
	farray db 3, 5, 12, 0, 133   ; Initialize the 'farray' with the values 3, 5, 12, 0, 133

	; Declare a sequence of 4 bytes with the value 74, followed by one byte with the value 36
	sarray TIMES 4 db 74          ; Define 4 bytes initialized with the value 74
			db 36              ; Define one more byte initialized with the value 36
