#Assembler

.model small
.stack 100h
.data

input db ?
msg db 13,"Enter Elem: $"
.code

main proc
    mov ax, @data
    mov ds, ax
    
    ;input:
    lea dx,msg 
    mov ah,09h 
    int 21h 
    mov ah, 01h
    int 21h
    mov input, al
    
    ;output:
    mov ah, 02h   
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    mov dl, input
    int 21h
    mov dl, 10
    int 21h
    mov dl, input
    int 21h
    mov dl, 10
    int 21h
    mov dl, input
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main   
