section .text

global process_string

process_string:
    mov eax, [esp + 4]
    mov si, [eax]
    inc si
    mov [eax], si
    ret