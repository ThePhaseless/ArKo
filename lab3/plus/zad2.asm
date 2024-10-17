section .txt
    org 100h

start:
    ; Read input from user
    mov ah, 0Ah                 ; DOS service to take input
    mov dx, input_buffer        ; Load address of input buffer
    int 21h

    mov cx, [input_buffer+2]       ; Load length of input for loop counter


my_loop:
    mov ah, 9
    mov dx, input_buffer+2
    int 21h

    mov ah, 9
    mov dx, new_line
    int 21h

    loop my_loop ; cx = cx - 1 && if cx != 0 goto my_loop

    mov ah, 4Ch
    int 21h


section .data
    input_buffer    db 50 ; 50 - size of input buffer
                    db 0 ; 0 - current length of input
                    times 50 db 36 ; 36 - ASCII code of '$'
    new_line db 13, 10, 36